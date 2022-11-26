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
src<-paste0(local,"wolf_FF-LEN-KOCHANIE.json")
getwd()
#k<-2
#dtatxt<-as.data.frame(fromJSON(src))
dtatxt<-(fromJSON(src))
book<-2
chapter<-4
dtaoutput<-data.frame()
plotsentiment<-function(set,book,chapter,pl,color){
dtatxt<-set
#dtatarget<-dtatxt[["content"]][["body"]][["text"]][[book]][["pg"]][[chapter]][["div"]]["#text"]
#dtatxt[["content"]][["body"]][["text"]][[3]][["pg"]][[1]]
dtatarget<-dtatxt[["content"]][["body"]][["text"]][[book]][["pg"]][[chapter]][["div"]]
a4<-!is.na(dtatarget$`#text`)
#dtatxt[["content"]][["body"]][["text"]][[book]][["pg"]][[chapter]][["peaks"]]<-a3
dtasubna<-as.data.frame(dtatarget$`#text`[a4])
colnames(dtasubna)<-"text"

al<-length(a4)
#a2<-get_sentiment(dtatarget$`#text`[1:al][a4],method = "syuzhet",language = "german")
a2<-get_sentiment(dtasubna$text,method = "syuzhet",language = "german")

a3<-get_transformed_values(a2)
#label<-c("main"=chapter)
plot(a3,type="l",main="sentiment analysis",ylab="relative value",xlab="distribution over:",sub=paste0("book ",book,", chapter ",chapter),col=color,asp=1)
#points(a3, cex = .2, col = "dark red")
if (pl==1){
plot(a2,type="l")}
#m1<-match(a2,max(a2))
#m1
#m2<-!is.na(m1)
#dim(dtatarget)
#dtatarget$peak<-dtatarget$`#text`[m2]
dtasubna$peak<-a2
colnames(dtasubna)<-c("text","peak")
#dtatxt[["content"]][["body"]][["text"]][[book]][["pg"]][[chapter]]["peaks"]<-a3

#dtaoutput[,book]<-a3
return(dtasubna)

#return(dtatarget$`#text`)
}
#?plot
#dtatarget<-plotsentiment(dtatxt,2,1,1)

#k<-4
stoplist<-read.csv("~/boxHKW/21S/DH/gith/DH_essais/sections/DYN/DYN_HA/corpus/wolf_LE_stopwords.csv",sep = ";")

stoplist_t<-subset(stoplist,stoplist$stop==1)$word
#stoplist_m<-gsub("[()?+]|\\[|\\]",".",stoplist_t)
#stoplist_m<-gsub("[^A-Za-z0-9äöü]","",stoplist_t)
#stoplist_m<-gsub("[\\.]{2,8}","",stoplist_m)

#stoplist_t<-stoplist_m
#textnr<-2
#gsub()
#dtatarget<-dtasubna
mfw<-function(){
dtasubna<-dtatarget
  #text<-dtatarget$`#text`[textnr]
#text<-dtatarget[textnr]
m1<-match(dtatarget$peak,max(dtatarget$peak))
m2<-!is.na(m1)
textmax<-dtasubna$text[m2]
m1<-match(dtatarget$peak,min(dtatarget$peak))
m3<-!is.na(m1)
textmin<-dtasubna$text[m3]
###wks. TODO: display name of text! dafür titel im df erhalten!

# if (is.na(text)){
#   print("no data available for this text")
#   return()
#   }
text2<-stri_split_boundaries(textmin)
text3<-(text2[[1]]) #raw single words of text
text4<-unique(text3)
m2<-!match(text3,stoplist_t,nomatch = F)
t6<-text3[m2]
#häufungen finden für ranking
#match(t6,t4)
#p1<-t6[duplicated(t6)]
p2<-gsub("[^A-Za-z0-9äöü]","",t6)
p2<-p2[duplicated(p2)]
p2<-unique(p2)
#print(p2)
cat("minimum text wordlist of duplicates:\n")
print(p2)
#wks. now repeat for maximum
text2<-stri_split_boundaries(textmax)
text3<-(text2[[1]]) #raw single words of text
text4<-unique(text3)
m2<-!match(text3,stoplist_t,nomatch = F)
t6<-text3[m2]
#häufungen finden für ranking
#match(t6,t4)
p1<-t6[duplicated(t6)]
p2<-gsub("[^A-Za-z0-9äöü]","",t6)
p2<-p2[duplicated(p2)]
p2<-unique(p2)
cat("maximum text wordlist of duplicates:\n")
print(p2)
#t6
#p2<-unique(p2)
#print(p2)
#text2
# return(t4[m>1])
#return(p2)
}
#mfw()
#plotsentiment(dtatxt,book,chapter,plot_abs) #ARG: (set,book,chapter,absolute)
####
#find peak text in curve
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

#call function, comment in for main Rmd
# dtsubna<-plotsentiment(dtatxt,book,chapter,plot_abs)
 book<-3
 chapter<-3
# par(new=T)
dtasubna<-plotsentiment(dtatxt,book,chapter,0,7)
# 
# dtaoutput2<-plotsentiment(dtatxt,book,chapter,0)["peak"]
dtasubna
x2<-data.frame("text"="start","value"=1)
x2<-array()
x4<-array()
for (k in 2:3){
  ldtc<-length(dtatxt[["content"]][["body"]][["text"]][[k]][["pg"]])  
  ldta<-length(dtatxt[["content"]][["body"]][["text"]][[k]][["pg"]][[ldtc]][["div"]][["#text"]])
  for (i in 1:ldtc){
  x<-plotsentiment(dtatxt,k,i,0,4)
#  x2[1:ldta]<-x$text
  x2<-append(x2,x$text,after = ldta)

  x4<-append(x4,x$peak,after = ldta)
  x4d<-cbind(i,x4)
  x2d<-cbind(k,x2)
  
    }
  
  }
x5<-cbind(x2d,x4d)
ldta<-length(dtatxt[["content"]][["body"]][["text"]][[book]][["pg"]][[chapter]][["div"]][["#text"]])
