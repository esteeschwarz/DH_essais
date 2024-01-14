
args <- commandArgs(trailingOnly = TRUE)
args<-"file2.txt"
arg<-args[1]
if (length(args)<1){
  txt<-NA
  arg<-"filesm.txt"
}
library(readtext)
con<-file(description=arg,"r")
t<-readtext(arg)
#t.con<-readLines(con = con)
tl<-readLines(arg)
#tl
tlhtm<-paste("<p>",tl,"</p>")#tm
#tlhtm
tlhtm.2<-paste0(tlhtm,sep  = "\n")
#tlhtm.2
cat(tlhtm.2)
tm<-paste("modified",t$doc_id,"@begin",t$text,"@end",sep     = "\n")
#print(t)
#cat(tm)

