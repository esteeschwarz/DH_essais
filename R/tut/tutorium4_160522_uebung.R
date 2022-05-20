# neue Art Pakete zu installieren:
if (!require("purrr")) install.packages("purrr") 
install.packages(c("xml2", "stringr"))
library(xml2)
library(purrr)
library(stringr)

setwd("")


## Einstieg: Struktur, Elemente, xpath-Pfade

data <- read_xml("ELTeC-de_level1_DEU004(3).xml")
typeof(data)

# Mehrere Dateien einlesen: brauchen wir jetzt nicht
files <- list.files(pattern = "\\.xml") # alternativ: path = "" als weiteres Argument der list.files Funktion
xml_corpus <- map(files, read_xml)
typeof(xml_corpus)
for(i in 1:length(files)){
  xmldata[[i]]<-read_xml(files[i])
}
# Oder: Funktion lapply
# Wie kann man das als Schleife umschreiben? 

# Namen bestimmter Elemente anzeigen 
?xml_name
xml_name(data)
xml_name(xml_parent(data)) #keine Eltern - Wurzelelement
xml_name(xml_children(data))
lst<-list(" ")
# Namespace anzeigen
xml_attr(data, "xmlns")

# Namespace entfernen

data %>% xml_ns()
data%>% xml_ns_strip()

# Beispiel 1: xpath-Pfade anzeigen
# Alle xpath-Pfade anzeigen
data %>% 
  xml_find_all('//*') %>%
  xml_path()
?xml_path

# Alle xpath-Pfade zu einem head-Element anzeigen
all_heads <- data %>% 
  xml_find_all('//head') %>%
  xml_path()
all_heads
all_heads[1]

# Beispiel 2: Alle Kapitelüberschriften extrahieren
# So geht es nicht
xml_text(all_heads[2])
# So geht es
all_chapters <- data %>% 
  xml_find_all('//head') %>%
  xml_text()
all_chapters

# Variante für das erste Element
ch_1_head <- xml_find_first(data, "//head")
xml_text(ch_1_head)


## Beispiel 3: Part of Speech tags extrahieren

pos_data <- read_xml("ELTeC-de_level2_DEU004.xml")

pos_data %>% xml_ns()
pos_data %>% xml_ns_strip()

# PoS tags im ersten head element
xml_find_all(pos_data, '/TEI/text/body/div[1]/head[1]/s/w[@lemma = "erst"]')
xml_find_all(pos_data, '/TEI/text/body/div[1]/head[1]/s/w[@pos = "NOUN"]')

# PoS tags in allen Kapiteln
all_chapters <- xml_find_all(pos_data, '/TEI/text/body/div')

# alle als NOUN getaggten Wörter herausziehen
all_nouns <- pos_data %>%
  xml_find_all('//s/w[@pos = "NOUN" and not(ancestor::head)]') %>% # Substantive aus den Kapitelüberschriften ausschließen
  xml_text() 
all_nouns 

# die vier häufigsten Wörter und ihr Vorkommen im Text
sort(table(all_nouns),decreasing=TRUE)[1:4]


## Beispiel 4: Aktnamen und Sprecher*innen aus einem Drama extrahieren 

data <- read_xml("ger000538-gryphius-cardenio-und-celinde.tei.xml")
xml_name(data)
xml_name(xml_children(data))

# Namespace entfernen
data %>% xml_ns()
data%>% xml_ns_strip()

# Pfade zu allen Akten 
all_acts <- data %>% 
  xml_find_all('//div[@type = "act"]') 
all_acts

# Xpath-Pfad zum ersten Akt
act_one <- all_acts[1]
xml_path(act_one)

# Sprecher*innen im ersten Akt extrahieren
all_speakers <- data %>% 
  xml_find_all('/TEI/text/body/div[1]/sp/speaker') %>%
  xml_text() %>%
  tolower() %>%
  map(str_replace_all,"\\.(?=$)", "") # Punkt am Ende entfernen
all_speakers
unlist(all_speakers)
# Oder: statt map() map_chr() verwenden!

# Wie kann man das als Schleife umschreiben? 

# Wenn wir die Information Sprecher*innen je Szene haben und davon ausgehen, dass Sprecher*innen 
# in einer Szene gemeinsam auf der Bühne sind, können wir beispielsweise in einem nächsten Schritt 
# eine Liste aller Kopräsenzen erstellen. Wir können die Daten als Knoten- und Kantenliste speichern 
# und Kopräsenznetzwerke analysieren. Dazu bald mehr.

