#13451.2.DYN_HA: wolf plot arcs
#Q: https://www.matthewjockers.net/2015/02/02/syuzhet/
#semantic analysis: uljana wolf; gegenwartslyrik

#library(httr)
library(jsonlite)
#library(purrr)
#library(stylo)
#library(igraph)
#library(network)
library(syuzhet)
library(stringi)
root<-"~/boxHKW/21S/DH/"
#setwd(local)
local<-paste0(root,"local/DYN/")
setwd(local)
#src<-"wolf_FF_1.json"
src<-paste0(local,"wolf_FF-LEN_1.json")
getwd()
#k<-2
#dtatxt<-as.data.frame(fromJSON(src))
dtatxt<-(fromJSON(src))
book<-2
chapter<-4
plotsentiment<-function(set,book,chapter,pl){
dtatxt<-set
dtatarget<-dtatxt[["content"]][["body"]][["text"]][[book]][["pg"]][[chapter]][["div"]]["#text"]
a4<-!is.na(dtatarget$`#text`)
al<-length(a4)
a2<-get_sentiment(dtatarget$`#text`[1:al][a4],method = "syuzhet",language = "german")
a3<-get_transformed_values(a2)
#label<-c("main"=chapter)
plot(a3,type="h",main="sentiment analysis",ylab="relative value",xlab="distribution over:",sub=paste0("chapter ",chapter),col=2,asp=1)
points(a3, cex = .2, col = "dark red")
if (pl==1){
plot(a2,type="l")}
return(dtatarget$`#text`)
}
#?plot
targettxt<-plotsentiment(dtatxt,2,1,1)

k<-4
stoplist<-read.csv("~/boxHKW/21S/DH/gith/DH_essais/sections/DYN/DYN_HA/corpus/wolf_LE_stopwords.csv",sep = ";")

stoplist_t<-subset(stoplist,stoplist$stop==1)$word
stoplist_m<-gsub("[()?+]|\\[|\\]",".",stoplist_t)
stoplist_m<-gsub("[^A-Za-z0-9äöü]","",stoplist_t)
stoplist_m<-gsub("[\\.]{2,8}","",stoplist_m)

stoplist_t<-stoplist_m
textnr<-2
#gsub()

mfw<-function(textnr){
#text<-dtatarget$`#text`[textnr]
text<-dtatarget[textnr]
if (is.na(text)){
  print("no data available for this text")
  return()
  }
text2<-stri_split_boundaries(text)
text3<-(text2[[1]]) #raw single words of text
text4<-unique(text3)
#m<-array()
# for (k in 1:length(text4)){
# m[k]<-length(gregexec(text4[k],text[1])[[1]])
# }
# text4

m2<-!match(text3,stoplist_t,nomatch = F)
#m2<-match(text3,stoplist_t,nomatch = F)
#sum(m2)
#m2
#t4<-unique(text3[m2]) #alle unique wörter ohne stopwords
t6<-text3[m2]
#häufungen finden für ranking
#match(t6,t4)
p1<-unique(t6[duplicated(t6)])
p2<-gsub("[^A-Za-z0-9äöü]","",p1)
#t4<-t5
# count occurences of !stopwords in text 
# m<-array()
# for (k in 1:length(t4)){
#   m[k]<-length(gregexec(t4[k],text[1])[[1]])
# }
# for (k in 1:length(t4)){
#   m[k]<-match(stopwords,text3)
# }
# 
# m
# grep(t4[k],text[1],perl = F)
# stoplist_m
# 
# #sort(t4)
# t4<-gsub("\\.","",t4)
# print(t4[m>2])
# return(t4[m>1])
return(p2)
}
#mfw(13)
# grep(stoplist_t[1:3,1],text4)
# stoplist_t<-subset(stoplist,stoplist$stop==1)
# m<-grep(stoplist[k,1],text4)
# m
# m2<-order(m,decreasing = T)
# text[1]
# m2
# text4[m2]
###
#create stopword list
stopwordlistfunc<-function(){
chapter<-7
#plotsentiment<-function(set,book,chapter,pl){
 # dtatxt<-set
dtatarget<-dtatxt[["content"]][["body"]][["text"]][[book]][["pg"]][[chapter]][["div"]]["#text"]
  
k<-1
#text5<-array()
text<-dtatarget$`#text`[k] #neuer text
text2<-stri_split_boundaries(text) #split
text3<-(text2[[1]]) #split array
text5<-append(text3,text2[[1]],after = length(text3))
length(dtatarget$`#text`)

for (k in 1:length(dtatarget$`#text`)){
text<-dtatarget$`#text`[k]
text2<-stri_split_boundaries(text)
#text3<-(text2[[1]])
text5<-append(text5,text2[[1]],after = length(text5))
}
length(unique(text5))
textarray<-cbind("word"=sort(unique(text5)),"stop"=NA)
sort(head(textarray))
getwd()

write.csv(textarray,"~/boxHKW/21S/DH/gith/DH_essais/sections/DYN/DYN_HA/corpus/wolf_LE_textarray.csv")
}
#stoplist<-read.csv("~/boxHKW/21S/DH/gith/DH_essais/sections/DYN/DYN_HA/corpus/wolf_LE_stopwords.csv",sep = ";")
