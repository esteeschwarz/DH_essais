library(quanteda)
dta<-"local/DYN/db/wriddle.txt"
#dta<-corpus(dta)
dta<-readLines(dta)
library(stringi)
w<-stri_extract_all_words(dta)
getwd()
dta
