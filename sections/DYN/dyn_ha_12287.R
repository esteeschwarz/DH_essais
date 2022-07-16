#12287.dyn_ha: extract multiLX
#20220715(18.43)
#essai to extract multilingual and neologist expressions from german texts
################
library(readtext)
library(purrr)
library(httr)
library(jsonlite)
library(clipr)
library(stringi)
library(stringr)
library(udpipe)

setwd("~/boxHKW/21S/DH/gith/DH_essais/sections/DYN")
getwd()
githbase<-"https://github.com/esteeschwarz/"
githtreemain<-"tree/main/"
githtreeraw<-"raw/main/"
sections/DYN/data/dyn_ha_wolf_out01/wordlist.csv
githcombine<-paste0(githbase,"\\2",githtreeraw,"\\3")
wdlocal<-gsub("(.+gith/)(.+?/)(.+?)",replacement =githcombine,getwd(),perl = T)
githurl<-wdlocal
dudenurl<- 'https://api.duden.de/v1/spellcheck'
#githurl<-paste0(githbase,"DH_essais",githtree,)
wolfsrc<-paste0(githurl,"/data/dyn_ha_wolf_out01/wordlist.csv")
wolfcsv<-read.csv2(wolfsrc,sep = ",")
datadir<-paste0(getwd(),"/data/")
wolfouttxt<-paste0(datadir,"wolfout.txt")
wolftypes<-wolfcsv[,1]
write_clip(wolfcsv[,1])
wolfbody<-read_clip()

wolfbodyflat01<-stri_flatten(wolfbody[300:500],collapse=", ")
wolfbodyflat02<-stri_flatten(wolfbody[501:1000],collapse=" ")
wolfbodyflat03<-stri_flatten(wolfbody[1001:length(wolfbody)],collapse=" ")
#wolfbodyflat04<-stri_flatten(wolfbody[1501:2000],collapse=" ")
wolfbodyflat01
#dudenapi
head<-read_json("~/boxHKW/21S/DH/local/DYN/dudenapi_head.json")
head$`x-api-key`
req_body<-paste0('{"text":"',wolfbodyflat01,'","dictionary":["Wäl"]}')
cat(req_body)
req <- httr::POST(dudenurl,
                  httr::add_headers(
                    "x-api-key" = head$`x-api-key`,
                    "Content-Type" = "application/json"
                  ),
                  body = req_body
);

head$`x-api-key`
#Extract the access token
httr::stop_for_status(req)
json<-httr::content(req, as="parsed")
#out<-fromJSON(json)
#out
#match(json$data$spellAdvices[[3]],"2")
lj<-length(json$data$spellAdvices)
for (k in 1:lj){
ec<-json$data$spellAdvices[[k]]$errorCode
ifelse(ec!=2,em<-c(k,ec,json$data$spellAdvices[[k]]$originalError),em<-F)
print(em)
}
print(json$data$spellAdvices[[107]]$originalError)
#### duden knowledge reicht nicht, gives false positives/negatives
#### e.g. with excluding all positives with errorcode 2 = NP without capitals:
#### duden dont finds "gotenhoden" which has just errorcode 2 and is not recognized
#### as unknown orthographie
####
ud_model <- udpipe_download_model(language = "german")
data(brussels_reviews)
comments <- subset(brussels_reviews, language %in% "es")

ud_model <- udpipe_load_model(ud_model$file_model)
x <- udpipe_annotate(ud_model, x = wolftypes)
x <- as.data.frame(x)
### also not sufficient, lots of misdefined words in general
#####
#try ("https://www.semanticsoftware.info/durm-german-lemmatizer")
src<-"https://www.semanticsoftware.info/system/files/delexicon.txt"
delemma<-read.delim(src)
m<-match(wolftypes,delemma$X.)
m<-match(delemma$X.,wolftypes)
mnot<-is.na(m)
wolftypes[mnot==F]
wolftypes[4]
m
delemma$X.[mnot==F]
