#13405.klemm semantic network
#20221005(10.21)
################
#fetch xml
#xpath sprechakte/speaker
#write sprechakttext to .txt
#stylo @ .txt corpus
####################
library(xml2)
library(purrr)
library(stringr)
sc<-"~/Documents/GIT/DH_essais/sections/DD/klemm_HA/data/ger000577-klemm-der-besuch.tei.xml"

data<-read_xml("~/Documents/GIT/DH_essais/sections/DD/klemm_HA/data/ger000577-klemm-der-besuch.tei.xml")


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
  xml_find_all('//speaker') %>%
  xml_path()
all_heads
#xml_text(all_heads[1])


# Sprecher*innen im ersten Akt extrahieren
all_speakers <- data %>% 
  xml_find_all('/TEI/text/body/div[1]/sp/speaker') %>%
  xml_text() %>%
  tolower() %>%
  map(str_replace_all,"\\.(?=$)", "") # Punkt am Ende entfernen
all_speakers
unlist(all_speakers)

all_speakers <- data %>% 
  xml_find_all('//speaker') %>%
  xml_text() %>%
  tolower() %>%
  map(str_replace_all,"\\.(?=$)", "") # Punkt am Ende entfernen
all_speakers
speaker<-unique(unlist(all_speakers))
#sprechtext extrahieren / speaker
sptx<- data %>% xml_find_all('//speaker') %>% xml_text()

pos_data <- read_xml(sc)
pos_data %>% xml_ns()
pos_data %>% xml_ns_strip()

# PoS tags im ersten head element
spx<-xml_find_all(pos_data, '//speaker')
xml_find_all(pos_data, '/TEI/text/body/div[1]/head[1]/s/w[@pos = "NOUN"]')
spc<-xml_text(spx)=="Celimene."
xml_text(pos_data,'/TEI/text/body/div[1]/sp/speaker[spc]')
px<-xml_find_all(pos_data,'/TEI/text/body/div[1]/sp/speaker[spc]')
px
## Beispiel 3: Part of Speech tags extrahieren

#pos_data <- read_xml("ELTeC-de_level2_DEU004.xml")

pos_data %>% xml_ns()
pos_data %>% xml_ns_strip()

# PoS tags im ersten head element
xml_find_all(pos_data, '/p[@pos = "NOUN"]')
xml_find_all(pos_data, '/TEI/text/body/div[1]/head[1]/s/w[@pos = "NOUN"]')

# PoS tags in allen Kapiteln
all_chapters <- xml_find_all(pos_data, '/TEI/text/body/div')

# alle als NOUN getaggten Wörter herausziehen
all_nouns <- pos_data %>%
  xml_find_all('//s/w[@pos = "NOUN" and not(ancestor::head)]') %>% # Substantive aus den Kapitelüberschriften ausschließen
  xml_text() 
all_nouns 
