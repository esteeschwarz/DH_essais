# Seminar "Digitale Dramenanalyse"
# 29.06.2022: DramaAnalysis
# Dieses Skript reproduziert das Tutorial https://quadrama.github.io zum Paket "DramaAnalaysis".

# VORBEREITUNG
# Pakete installieren...
install.packages(c("DramaAnalysis", "magrittr", 
                   "igraph", "highcharter", 
                   "rmarkdown", "fmsb", 
                   "knitr"))
# ... und laden
library(DramaAnalysis)
library(magrittr)
library(igraph)
getwd()


# DATEN
# quadrama Korpus installieren: Das enthält die TextGrid IDs
setDirectories(
  dataDirectory = file.path(path.expand("~"), "QuaDramA", "Data2"),
  collectionDirectory = file.path(dataDirectory, "collections")
)
setDirectories(
  dataDirectory <- file.path("data","corpus","nlp"),
  collectionDirectory <- file.path(dataDirectory, "collections")
)

installData("qd")
# Stück laden und in einer Variable d speichern
d <- loadDrama("qd:vn0h.0")
d <- loadDrama("drst:001vww579.0") # WORKS with 577, 578, 579; other have missing speaker assigned to utterances.
d <- loadDrama("dd:7") # WORKS with 577, 578, 579; other have missing speaker assigned to utterances.

print(presence(d)) # überprüfen

# gesamtes Korpus einlesen:
dd.ids <- c("dd:1","dd:2", "dd:3", "dd:4", "dd:5", "dd:6", "dd:7", "dd:8")
dd.plays <- loadDrama(dd.ids)
dd.plays$meta 

# WER REDET WIE VIEL? 
# Mithilfe der Funktion characterStatistics() kann ein Dataframe mit Statistiken 
# zum Sprechtext der Figuren erzeugt werden:
characterStatistics(d)
??characterStatistics
# Satzzeichen werden per Default als einzelne Tokens gezählt.Das kann mithilfe des 
# Funktionsparameters "filterPunctuation" geändert werden: 
characterStatistics(d, filterPunctuation = TRUE)
# Statistiken für jeden Akt einzeln ausgeben lassen:
characterStatistics(d, segment="Scene")
# Werte normalisieren: wenn mehrere Texte verglichen werden sollen, muss mit 
# normalisierten Werten gearbeitet werden
characterStatistics(d, normalize=TRUE)
# Wir wollen jetzt visualisieren, wieviele Tokens jede Figur spricht. Satzzeichen sollen 
# dabei nicht mitgezählt werden, diese filtern wir also heraus:
charStats <- characterStatistics(d, filterPunctuation = TRUE)

# 1. Bar Plot
# Bei Stücken mit langen Figurennamen sollten zunächst die Default-Größe der Ränder des Plots vergrößert werden
par(mar=c(9,3,2,2)) #position grafik
# Plot erzeugen: 
barplot(charStats$tokens, # Spalte tokens aus dem charStats Dataframe auswählen
        names.arg = charStats$character, # Beschriftung der x-Achse: hier sollen die IDs der Figuren aus der Spalte "character" stehen
        las=2 # Beschriftung der Achsen rotieren (Figuren-IDs auf der x-Achse würden sich sonst überlappen)
        ) # Diese Zeile beim Ausführen nicht vergessen
# Die Wahl der Figuren-IDs als Beschriftung der x-Achse ist nicht optimal. Um stattdessen 
# die richtigen Figurennamen einzusetzen, können wir mithilfe der Funktion characterNames() 
# verwenden die IDs in der Spalte character durch die vollen Namen der Figuren ersetzen: 
??characterNames # nachsehen, welche Argumente die Funktion nimmt
charStats <- characterNames(charStats, d)
charStats$character # überprüfen: hat geklappt
# Plot erneut erzeugen, diesmal mit den Figurennamen als Beschriftung auf der x-Achse
par(mar=c(9,3,2,2)) 
barplot(charStats$tokens, 
        names.arg = charStats$character, 
        las=2 
) 

# 2. Stacked Bar Plot 
# Dieses Mal verwenden wir den "Pipe" %>%, um die einzelnen Arbeitsschritte zu verketten 
charStats %>%
  characterNames(d) %>%
  barplot(names.arg=dramaNames(d, formatString="%T"))
?barplot # Argument names.arg gibt an, wie der Plot beschriftet werden soll 
# Anstelle der Anzahl der Tokens kann auch die mittlere Länge aller Sprechtexte einer Person
# visualisiert werden:
charStats %>%
  characterNames(d) %>%
  barplot(names.arg=dramaNames(d, formatString="%T"), column="utteranceLengthMean")

# Anmerkung: Alle Arbeitsschritte in diesem Abschnitt können auch für zwei Stücke gleichzeitig 
# erfolgen. Dazu müssen beide Dramen geladen werden und anschließend in ein neues Objekt 
# zusammengefügt werden: text <- combine(d_1, d_2), wobei d_1 und d_2 die geladenen Dramen sind. 
# In diesem Fall muss überall mit normalisierten Werten gearbeitet werden. 


# WER REDET WIE OFT?
# Die Funktion utteranceStatistics() erzeugt einen Dataframe mit Statistiken zur Länge und
# zum Beginn der Sprechakte. Wir erzeugen zunächst ein neues Datenobjekt uStat und benennen 
# in einem zweiten Schritt mithilfe der bereits bekannten Funktion characterNames() die 
# Figuren-IDs in der Spalte "character" in die Figurennamen um: 
uStat <- utteranceStatistics(d) %>%
  characterNames(d)
# Mithilfe eines Boxplots kann die Verteilung der absoluten Länge des Sprechtexts der 
# Figuren visualisiert werden. Bevor der plot erstellt wird, werden zuerst wieder die 
# Ränder der Abbildung vergrößert. Die Formel "utteranceLength ~ character" bedeutet, 
# dass die Spalte "utteranceLength" nach den Figuren aus der Spalte "character" gruppiert 
# werden soll.
par(mar=c(9,4,2,2)) 
boxplot(utteranceLength ~ character, 
        data=uStat,   
        main = dramaNames(d),
        las = 2
)

# Wir wollen zuletzt visualisieren, wann im Verlauf des Stücks welche Figuren sprechen: 
par(mar=c(2,7,2,2))
plot(uStat, main=dramaNames(d))


# KONFIGURATION
# 1. Konfigurationstabellen
# Mit der Funktion configuration() können Konfigurationstabellen erstellt werden. 
# Diese enthalten Informationen zur An- und Abwesenheit der Figuren in einem Akt
# sowie die Anzahl der Sprechtext-Tokens jeder Figur. configuration() gibt also 
# ähnliche Informationen aus wie characterStatistics(rksp.0, segment="Act"), jedoch 
# in einer anderen Form und mit anderen Möglichkeiten zur Visualisierung.
c <- configuration(d)
# Um aus der Tabelle eine Matrix zu machen, müssen die numerischen Werte extrahiert werden: 
mat <- as.matrix(c)
# Länge des Sprechtexts je Figur visualisieren: 
par(mar=c(2,2,2,10))
barplot(mat, 
        legend.text = c$character,  # Text der Legende: Farben stehen für Figuren
        args.legend = list(x=ncol(mat)+3,      # Position der Legende auf der x-Achse
                           y=max(colSums(mat)) # Position der Legende auf der y-Achse
        ), 
        col=qd.colors)
# Bei der Visualisierung gibt es ein Problem: Bei Stücken mit vielen Figuren wiederholen 
# sich die Farben. Eine Lösung ist, die Figuren mit dem geringsten Sprechtext aus der 
# Konfigurationstabelle zu filtern und die Visualisierung nur für die fünf Figuren mit 
# dem meisten Sprechtext zu erstellen. Wir ersetzen dabei auch die lateinischen Aktnummern 
# durch römische Ziffern.
# Konfigurationstabelle erstellen und filtern
c <- configuration(d) %>%
  filterCharacters(d, n = 5) %>%
  characterNames(d)
# Matrix erstellen
mat <- as.matrix(c)
# Visualisieren:
par(mar=c(2,2,2,10))
barplot(mat, 
        names.arg = as.roman(1:ncol(mat)),   # römische Ziffern für Akte
        legend.text = c$character, 
        args.legend = list(x=ncol(mat)+3,   
                           y=max(colSums(mat)) 
        ), 
        col=qd.colors)
# Anmerkung: Beim Vergleich mehrer Stücke müssen die Werte wieder normalisiert werden. 
# Siehe hierzu https://quadrama.github.io/DramaAnalysis/tutorial/3/configuration.html

# 2. Kopräsenzmatrizen
# Die Funktion copresence() kann auch dazu verwendet werden, um nur die Kopräsenzinformation
# ohne Information zur Länge des Sprechtexts zu extrahieren. Zuerst wird mit configuration()
# eine Tabelle generiert, die die Anwesenheit ("TRUE") oder Abwesenheit ("FALSE") der Figuren
# in jeder Szene enthält. Daraus kann dann eine Matrix erstellt werden. 
c <- configuration(d, onlyPresence = TRUE, segment="Scene")
mat <- as.matrix(c)
# Durch Multiplikation der erstellten Matrix mit der Transponierten erhält man die 
# Kopräsenzmatrix (= auch "Adjazenzmatrix")
# %*% ist ein Operator für die Multiplikation von Matrizen.
copresence <- mat %*% t(mat)
# Figurennamen hinzufügen:
rownames(copresence) <- c$character
colnames(copresence) <- c$character
View(copresence) # überprüfen
# Die Kopräsenzen für die sieben Figuren mit den meisten Kopräsenzen sollen jetzt 
# in Form einer "Heatmap" visualisiert werden, bei der die unterschiedliche Anzahl 
# der Kopräsenzen farblich hervorgehoben wird. 
# Zunächst erzeugen wir die Kopräsenzmatrix wie bisher: 
c <- configuration(d, onlyPresence = TRUE, segment="Scene") %>%
  filterCharacters(d, n = 7) %>%
  characterNames(d)
mat <- as.matrix(c)
copresence <- mat %*% t(mat) 
rownames(copresence) <- c$character
colnames(copresence) <- c$character
copresence # überprüfen
# Durch die Matrixmultiplikation haben wir eine quadratsiche Matrix erhalten, bei der
# sich die Werte im Dreieck unter der Diagonalen und im Dreieck über der Diagonalen 
# spiegeln. Auf der Diagonalen steht die absolute Anzahl an Szenen, in denen jede Figur
# anwesend ist. Die Heatmap soll aber nur die Kopräsenzen der Charaktere abbilden. Die 
# Werte auf der Diagonalen und die wiederholten Werte im unteren Dreieck werden also 
# nicht benötigt und können gelöscht werden: 
copresence[lower.tri(copresence,diag=TRUE)] <- NA
# Heatmap visualisieren:
par(mar=c(10,10,1,1))
image(copresence, 
      col = rgb(256,111,184, alpha=(seq(0,255)),
                maxColorValue = 256),
      xaxt= "n",  # keine x-Achse
      yaxt= "n",  # keine y-Achse
      frame=TRUE  # Rahmen um die Heatmap 
)
# Die erstellte Grafik hat noch keine Beschriftungen, diese fügen wir noch hinzu.
# Werte als Labels für die Kästchen hinzufügen: 
text(y=(rep(1:ncol(copresence), each=nrow(copresence))-1)/(nrow(copresence)-1),
     x=(1:nrow(copresence)-1)/(nrow(copresence)-1),
     labels=as.vector(copresence))
# x-Achse hinzufügen
axis(1, at = seq(0,1,length.out = length(c$character)), labels = c$character, las=3)
# y-Achse hinzufügen
axis(2, at = seq(0,1,length.out = length(c$character)), labels = c$character, las=1)

# Anmerkung: Die Kopräsenzen können auch als Netzwerk visualisiert werden. 
# Dazu nächste Woche mehr!


# FIGURENWECHSEL 
# Figurenwechsel, also das Auf- und Abgehen von Personen zwischen Szenen, können 
# mithilfe der Funktion hamming() berechnet werden. Der Funktionsname bezieht sich auf
# den US-amerikanischen Mathematiker Richard Hamming, der in den 1950er Jahren ein Maß
# zur Berechnung der Unterschiedlichkeit von Zeichenketten entwickelt hat, den 
# Hamming-Abstand. Zeichenketten werden dabei als Vektoren aufgefasst, und der Hamming-
# Abstand ist die Anzahl an Stellen, an denen sich zwei Vektoren unterscheiden. 
# Übertragen auf den Figurenwechsel bedeutet das, dass die An- und Abwesenheit der Figuren 
# in einer Szene als Vektor mit den Werten TRUE und FALSE aufgefasst wird. Der "Hamming-
# Abstand" zwischen zwei Vektoren ist in dem Fall die Summe aller Auf- und Abgänge (Wechsel 
# zwischen TRUE und FALSE). Die Funktion hamming() gibt einen Vektor mit einem auf diese 
# Weise berechneten Wert für jeden Szenenwechsel aus:
?hamming
hamming(d, variant="Hamming")
# Figurenwechsel visualisieren: 
plot(hamming(d, variant="Hamming"),
     type="l",
     ylab="Hamming distance",
     xlab="Scenes")
# Die berechneten Werten können mit der Anzahl aller Figuren normalisiert werden... 
hamming(d, variant="NormalizedHamming")
# ... oder mit der Anzahl der Figuren in zwei aufeinanderfolgenden Szenen: 
hamming(d, variant="Trilcke")


# WORTFELDANALYSE
# Mit den Funktionen dictionaryStatistics() und dictionaryStatisticsSingle() kann untersucht 
# werden, wie oft Figuren Wörter aus einem vordefinierten thematischen oder semantischen
# Wortfeld verwenden. Dabei wird zuerst ein Vektor aus Wörtern (bzw. Wortlemmata), die wir
# derselben thematischen Gruppe zuordnen, erstellt. Anschließend wird gezählt, wie oft jede
# Figur ein Wort aus diesem "dictionary" verwendet.
# Wortfeld-Vektor erstellen, hier als Beispiel zum Thema Liebe (je nach gewähltem Stück muss
# das ggf. angepasst werden): 
wf_love <- c("liebe", "herz")
dictionaryStatisticsSingle(d, wordfield=wf_love)
# Visualisieren: 
# Zuerst speichern wir die berechneten Statistiken in der Variable dstat und ersetzen 
# wieder die Figuren-IDs durch die vollen Namen: 
dstat <- dictionaryStatisticsSingle(d, wordfield = wf_love) %>% 
  characterNames(d)
# Figuren entfernen, die keins der Worte verwenden 
dstat <- dstat[dstat$x>0,]
# Balkendiagramm erstellen
barplot(dstat$x,                      
        names.arg = dstat$character,  # beschriftung der x-Achse
        las=2                         # Achsen rotieren
)
# Diese Visualisierung ist informativ, kann jedoch auch fehlleitend sein. Wie wir bereits
# gesehen haben, sprechen verschiedene Figuren unterschiedlich viel. Wir sollten also 
# unsere dictionary statistics mit der Anzahl der von einer Figur gesprochenen Wörter 
# normalisieren:
dstat <- dictionaryStatisticsSingle(d, wordfield=wf_love,
                                    normalizeByCharacter = TRUE) %>% #normalisieren
  characterNames(d)        
dstat <- dstat[dstat$x>0,]
barplot(dstat$x, 
        names.arg = dstat$character, 
        las=2            
)

# Es können die Sprechtexte auch auf mehrere Wortfelder gleichzeitig hin untersucht werden.
# Diese können entweder als Liste selbst erstellt werden...
wf <- list(Liebe=c("liebe","herz","schmerz"), Hass=c("hass","hassen"))
# ... oder über eine URL oder ein lokales Verzeichnis mithilfe der Funktion loadFields()
# geladen werden. Die geladenen Wortfelder können auch direkt als Argument "fieldnames" 
# an die Funktion dictionaryStatistics() übergeben werden. Per Default werden Wortfelder
# importiert, welche die Entwickler:innen des DramaAnalysis Pakets vordefiniert haben. 
# Diese Wortfelder sind online einsehbar: https://github.com/quadrama/metadata/tree/master/fields/
# Die Wortfelder können anhand ihres Namens ausgewählt werden und über den Parameter "fieldnames" der 
# Funktion übergeben werden: 
dstat <- dictionaryStatistics(
  d,  
  fieldnames = # gewählte Wortfelder von https://github.com/quadrama/metadata/tree/master/fields/
    c("Liebe", "Familie", "Ratio", "Krieg", "Religion"),
  normalizeByCharacter = TRUE,   # Normalisierung mit Figuren
  normalizeByField = TRUE     # Normalisierung mit Wortfeld: Wortfelder können unterschiedlich viele Wörter enthalten
)
dstat

# Visualisieren: 
# 1. Balkendiagramm: Sprechtext einer einzelnen Figur, alle Wortfelder
mat <- as.matrix(dstat)
barplot(mat[3,],     # Figur aus der dritten Zeile der Matrix wählen 
        main="Sprechtext einer Figur", # Überschrift
        names.arg=colnames(mat), # Einträge auf der x-Achse
        las = 2 # Achsen rotieren
)

# 2. Balkendiagramm: Sprechtext aller Figuren, ein Wortfeld
dstat <- dictionaryStatistics(
  d,  
  fieldnames = 
    c("Liebe", "Familie", "Ratio", "Krieg", "Religion"),
  normalizeByCharacter = TRUE,  
  normalizeByField = TRUE     
) %>% 
  characterNames(d)

mat <- as.matrix(dstat)
mat
par(mar=c(9,4,1,1))
barplot(mat[,1],                  # Spalte für Wortfeld "Liebe" wählen
        main="Use of love words", 
        beside = TRUE,            # nebeneinander darstellen
        names.arg = dstat$character,  
        las=2                     
)
?matplot

# 3. Liniendiagramm: Sprechtext einer Figur, mehrere Wortfelder 
# Die Funktion dictionaryStatistics() kann auch dazu verwendet werden, um die Verwendung
# von Wörtern aus einem oder mehreren Wortfeldern im Sprechtext einer oder mehrerer
# Figuren über den Verlauf des Stücks zu visualisieren. Dazu kann der Funktionsparameter 
# "segment" angepasst werden.
# Verlauf für eine Figur:
dsl <- dictionaryStatistics(d, 
                            fieldnames=c("Liebe", "Familie", "Ratio", "Krieg", "Religion"),
                            normalizeByCharacter=TRUE,
                            segment="Act") 

mat <- as.matrix(dsl[dsl$character=="philemon",]) # Namen für andere Stücke austauschen
matplot(mat, type="l", col="black")
legend(x="topleft",legend=colnames(mat), lty=1:ncol(dsl))

# Je nach Anwendungsfall kann es nützlich sein, hier die kumulierte Summe der verwendeten 
# Wörter aus den Wortfeldern zu verwenden:  
dsl <- dictionaryStatistics(d, 
                            fieldnames=c("Liebe", "Familie", "Ratio", "Krieg", "Religion"),
                            normalizeByCharacter=TRUE,
                            segment="Act") 
mat <- as.matrix(dsl[dsl$character=="philemon",])
mat <- apply(mat,2,cumsum) # kumulierte Summe über alle Spalten berechnen
matplot(mat, type="l", col="black")
# senkrechte Linien für die Aktgrenzen einfügen
abline(v=1:nrow(mat))
legend(x="topleft", legend=colnames(mat), lty=1:5)

# 4. Liniendiagramm: Sprechtext aller Figuren, ein Wortfeld: 
dsl <- dictionaryStatistics(d, 
                            fieldnames=c("Liebe"),
                            normalizeByCharacter=TRUE,
                            segment="Act") %>% 
  filterCharacters(d,
                   n = 6) %>%
  characterNames(d)

dsl <- reshape(dsl, direction = "wide",  
               timevar = "Number.Act",   
               times = "Liebe",          
               idvar=c("corpus","drama","character")   
)

mat <- as.matrix.data.frame(dsl[,4:ncol(dsl)])
rownames(mat) <- dsl$character
mat <- apply(mat,1,cumsum)

matplot(mat, type="l", lty = 1:ncol(mat), col="black", main="Liebe")
legend(x="topleft", legend=colnames(mat), lty=1:ncol(mat))
dsl
