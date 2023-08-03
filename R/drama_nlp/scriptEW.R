library(DramaAnalysis)

# Zum Einlesen der Dramen aus unserem "dd-Korpus" müssen wir zunächst das 
# Arbeitsverzeichnis auf das Verzeichnis setzen, das als Unterverzeichnis "dd" hat, 
# in diesem Fall ist das der Ordner "dd-korpus"
setwd("/Users/gast/dd-korpus")

# Anders als beim Laden der quadrama-Dramen müssen wir das quadrama-Korpus nicht mit 
# installData() installieren, sondern nur das Arbeitsverzeichnis als "Data Directory"
# einstellen: 
setDataDirectory(getwd()) 

# Drama laden
d <- loadDrama("dd:1") # Hausherr in der Klemme
print(presence(d)) # überprüfen

# ein anderes Drama laden
d <- loadDrama("dd:2") # Der Neue Narziß
print(presence(d)) #überprüfen

# Jetzt kann das geladene Drama analog zur letzten Woche mit den DramaAnalysis-Funktionen
# analysiert werden. 

# gesamtes Korpus einlesen:
dd.ids <- c("dd:1","dd:2", "dd:3", "dd:4", "dd:5", "dd:6", "dd:7", "dd:8")
dd.plays <- loadDrama(dd.ids)
dd.plays$meta 
