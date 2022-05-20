# R Tutorium 
# Übung: Daten lesen und schreiben
# 02.05.2022

## Arbeitsverzeichnis setzen

setwd("/Users/gast/R-Tutorium")
# Backslashes für Windows:
# setwd("C:\Users\gast\R-Tutorium")

## 1. Daten einlesen

## R base Funktionen - Beispiele

# multi-purpose Funktion "scan"
kafka_1 <- scan("kafka_verwandlung_1915.txt", what="character", encoding = "UTF-8", sep="\n")
eltec <- scan("ELTeC-de_level1_DEU004.xml", what = "char", encoding = "utf-8", sep = "\n", quiet = TRUE)
# Inhalt der Variable in der Konsole ausgeben lassen
kafka_1
print(kafka_1)
# Alternative für Textdateien: readLines
kafka_2 <- readLines("kafka_verwandlung_1915.txt")
# csv-Datei einlesen
schiller <- read.csv("ger000058-schiller-wallensteins-tod-cast.csv", header=TRUE)
# Alternative: read.table() - Probiert es selbst aus!
?read.table()


## Paket: readtext

# Paket installieren und laden
install.packages("readtext")
library(readtext)
# einen Text einlesen und als Variable speichern
kafka_3 <- readtext("kafka_verwandlung_1915.txt")
# alle Texte in einem Ordner einlesen und als Variable speichern 
ein_korpus <- readtext("*.txt")
ein_korpus
# Texte in einem Unterordner einlesen und als Variable speichern
noch_ein_korpus <- readtext("Unterordner/*.txt")
noch_ein_korpus

# Was ist der Unterschied zwischen den Objekten, die wir mit readLines, scan und readtext erstellt haben? 
typeof(kafka_1) #scan
typeof(kafka_2) #readLines
typeof(kafka_3) #readtext
# Welche anderen Unterschiede könnt ihr der Beschreibung der Funktionen entnehmen? 

## Paket: xml2

# Paket installieren und laden 
install.packages("xml2")
library(xml2)
# Funktion read_xml
data <- read_xml("ELTeC-de_level1_DEU004.xml")
# Mehrere Dateien einlesen
install.packages("purrr")
library(purrr)
files <- list.files(pattern = ".xml") # Liegen die Dateien in einem Unterordner: path = "" als weiteres Argument der list.files Funktion
dta_corpus <- map(files, read_xml) 
# Die map Funktion wendet eine Funktion (in diesem Fall read_xml) auf alle Elemente einer Liste oder eines Vektors an
??purrr::map


## 2. Daten schreiben 

## Neuen Ordner erstellen 
unlink("corpus", recursive = T) # falls bereits ein Ordner "corpus" existiert" wird dieser gelöscht
dir.create("corpus") 

# csv und andere tabulare Daten im Arbeitsverzeichnis speichern 
write.table(schiller, file = "wallenstein_bearbeitet.csv",
            sep = ",", row.names = F)

# csv und andere tabulare Daten im Unterordner "corpus" speichern - Achtung! Der Ordner muss erst erstellt werden, siehe oben.
write.table(schiller, file = "corpus/wallenstein_bearbeitet.csv",
            sep = ",", row.names = F)

# Funktioniert auch für Textdateien!
write.table(kafka_1, 
            file = "kafka_bearbeitet.txt", 
            quote=FALSE,
            col.names=FALSE,
            row.names=FALSE)

# Textdateien Zeile für Zeile schreiben:
writeLines(kafka_1, "kafka_bearbeitet-2.txt")


# R-interne Datenformate: R Objekte speichern und laden

# rds: Save one object in one file
saveRDS(kafka, file="kafka.rds")
readRDS(file="kafka.rds")

# RData and rda : Save multiple objects in one file 
save(kafka, eltec, schiller, file="uebung.rda")
load(file="uebung.rda")
save(kafka, eltec, schiller, file="uebung.rda")
load(file="uebung.RData")



