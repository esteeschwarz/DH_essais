src<-"https://gutenberg.org/ebooks/6698.txt.utf-8"

#get text
ext<-function(src){
  dta<-scan(src,"character",quote = c("\'","\""),na.strings = c(",",".",";","-"))
  start<-which(dta=="PRINT!")
  start2<-start[1]+20
  startbook<-which(dta[start[1]:start2]=="Wilhelm")
  start1<-startbook-1
  dta4<-dta[start[1]+start1:length(dta)]
  dta5<-dta4[!is.na(dta4)]
}

dta <- gutenberg_download(6698)
stylotext <- select(dta, text)
write.table(stylotext, file = "data/hegel.txt", sep="", row.names = FALSE)

enc2native(dta[,2])

dta<-scan(src,"character",what="character", encoding = "UTF-8", sep="\n")
library(clipr)
write_clip(dta)

