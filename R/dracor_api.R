# Seminar Digitale Dramenanalyse
# Dracor API aus dem RStudio abrufen
# 25.05.2022
# Lisa Poggel

install.packages(c("jsonlite", "httr", "purrr"))
library(jsonlite)
library(httr)
library(purrr)

corpusname <- "ger"
base_url <- "https://dracor.org/api"
author <- "goethe"

## 1. Informationen zu allen Stücken aus dem deutschsprachigen Dracor Korpus abfragen
# Abfrage-URL für das ausgewählte Korpus vorbereiten
full_url <- paste(base_url, "/corpora/", corpusname, sep="")
full_url #zum Überprüfen in der Konsole ausgeben lassen
# API call 
api_call <- httr::GET(full_url)
?GET #Informationen zur Funktion GET anzeigen lassen
# API response ansehen
api_call$status_code
api_call$content
content(api_call, "text")
# API Antwort lesbar machen und in einem Dataframe (~Tabelle) speichern
api_df <- jsonlite::fromJSON(content(api_call, "text"), simplifyDataFrame = TRUE)
# Output überprüfen
View(api_df)
api_df$dramas 

# 2. Sprechtexte weiblich und männlich codierter Charaktere aus allen Stücken eine:r bestimmten Autor:in abrufen
# Entweder mithilfe des Zugriffsoperators $ sofort auf alle Stücke der gewählten Autor:in zugreifen
# (in diesem Fall brauchen wir nicht unsere Variable author)
# plays_selected <- api_df$dramas$name[api_df$dramas$author$name == "Goethe, Johann Wolfgang"]
# ... oder erst Namen aller Stücke aus ger-Dracor in einer neuen Variable speichern...
plays <- api_df$dramas$name
plays #überprüfen
# ... und dann nach Stücken der gewählten Autor:in filtern, mithilfe von regex
# (Als pattern wird dann die Variable author eingesetzt, die wir in Zeile 13 erstellt haben)
plays_selected <- grep(pattern=author, plays, value=TRUE) 
plays_selected
# URLs für die Abfrage vorbereiten
first_url <- paste0(full_url, "/play/")
second_url <- purrr::map_chr(plays_selected, paste0, '/spoken-text')
full_urls <- purrr::map2_chr(first_url, second_url, paste0)
# neues Verzeichnis anlegen: in diesem Ordner werden die Textdateien gespeichert
dir.create("spokentext_corpus", showWarnings=F)
setwd(paste0(getwd(), "/spokentext_corpus"))
# API calls durchführen und Output speichern
# Zuerst ohne Angabe des codierten Geschlechts als Query-Parameter
for(i in 1:length(full_urls)){
  api_call <- httr::GET(full_urls[i])
  spokentext <- content(api_call, "text")
  filename <- paste0(plays_selected[i], ".txt")
  writeLines(spokentext, filename)
}
# Mit query nach dem Geschlecht
genders <- c("FEMALE", "MALE", "UNKNOWN")
for(i in 1:length(full_urls)){
  for(j in 1:length(genders)){
    api_call <- httr::GET(full_urls[i], query=list(gender=genders[j]))
    spokentext <- content(api_call, "text")
    filename <- paste(plays_selected[i], genders[j], ".txt", sep="_")
    writeLines(spokentext, filename)
  }
}

list.files() # Dateien im Arbeitsverzeichnis auflisten
  
