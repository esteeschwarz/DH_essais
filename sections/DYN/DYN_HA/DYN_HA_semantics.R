#13451.2.DYN_HA: wolf plot arcs
#Q: https://www.matthewjockers.net/2015/02/02/syuzhet/
#semantic analysis: uljana wolf; gegenwartslyrik

#library(httr)
#library(jsonlite)
#library(purrr)
#library(stylo)
#library(igraph)
#library(network)
#library(syuzhet)
#library(stringi)
#root<-"~/boxHKW/21S/DH/"
#setwd(local)
#local<-paste0(root,"local/DYN/")
#setwd(local)
#src<-"wolf_FF_1.json"
#src<-paste0(local,"wolf_FF-LEN-KOCHANIE.json")
getwd()
#stoplist<-read.csv("/gith/DH_essais/sections/DYN/DYN_HA/corpus/wolf_LE_stopwords.csv",sep = ";")
stoplist<-read.csv("corpus/wolf_LE_stopwords.csv",sep = ";")
stoplist_t<-subset(stoplist,stoplist$stop==1)$word
dta$top<-0
dta<-subset(dta,!is.na(dta$content))
dta<-subset(dta,dta$content!="")
dta$top[dta$book=="kochanie"]<-2005
dta$top[dta$book=="FF"]<-2009
dta$top[dta$book=="lengevitch"]<-2013
dta<-dta[with(dta,order(dta$top)),]
book<-dta$book
book_ex<-unique(book)
match(book,book_ex)
dta$book_id<-match(book,book_ex)
chapter<-dta$chapter
chapter_ex<-unique(chapter)
match(chapter,chapter_ex)
dta$chapter_id<-match(chapter,chapter_ex)
dtans<-colnames(dta)
dta0<-c(NA,"a-intercept","a-intercept","a-intercept","null","null","null","null","null","null",2000)
dtalm<-rbind(dta0,dta)
dtalm$sentiment[1]<-0
mode(dtalm$sentiment)<-"double"
dta<-dtalm


do_sentiment<-function(dta){
  # src<-paste0(getwd(),"/local/R/cred_gener.csv")
  # cred<-read.csv(src)
  # con<- mongo(collection = "wolfdb003", db ="deadend", url=cred$url[cred$q=="mongodb"])
  # x<-con$find('{}')
 # dta<-subset(dta,!is.na(dta$content))
  #dta<-dtam
  a1<-get_sentiment(dta$content[dta$book=="kochanie"],method = "syuzhet",language = "german")
  a1i<-get_transformed_values(a1)
  
  a2<-get_sentiment(dta$content[dta$book=="FF"],method = "syuzhet",language = "german")
  a2i<-get_transformed_values(a2)
  a3<-get_sentiment(dta$content[dta$book=="lengevitch"],method = "syuzhet",language = "german")
  a3i<-get_transformed_values(a3)
  #plot(a1i~a2i)
  #plot(a1i~a3i)
  #plot(a2i~a3i)
  #no.
  ### lmer test
  # formel: test dependency sentiment of book
  ################################################
  # new with sorted df (after year of publication)
  lm<-lmer(dta$sentiment~dta$book+(dta$book|dta$chapter),dta)
 # lm<-lmer(dtalm$sentiment~dtalm$book+(dtalm$book|dtalm$chapter),dtalm)
  length(dta$book)
    le<-summary(lm)
  le
  res<-le$residuals
  lm2<-get_transformed_values(res)
  ####
  m1<-mean(dta$sentiment[dta$book=="kochanie"])
  m2<-mean(dta$sentiment[dta$book=="FF"])
  m3<-mean(dta$sentiment[dta$book=="lengevitch"])
  #le
  sent1<-c(a1i,a2i,a3i)
  plot(sent1,type = "h",col=2,ylab = "sentiment factorized",xlab="books",main="sentiment analysis over texts")
  sent2<-c(a1,a2,a3) #untransformed sentiment, absolute
  scatter.smooth(1:length(sent2),sent2,.1,.1,type="h",family = "gaussian",ylab="absolute sentiment vaules",xlab="text corpus",main="sentiment over texts")
  scatter.smooth(1:length(a1),a1,.1,.1,type="h",family = "gaussian",ylab="absolute sentiment vaules",xlab="text: kochanie",main="sentiment over texts")
  scatter.smooth(1:length(a2),a2,.1,.1,type="h",family = "gaussian",ylab="absolute sentiment vaules",xlab="text: FF",main="sentiment over texts")
  scatter.smooth(1:length(a3),a3,.1,.1,type="h",family = "gaussian",ylab="absolute sentiment vaules",xlab="text: lengevitch",main="sentiment over texts")
  sent3<-get_transformed_values(sent2)
  plot(sent3,type = "h",col=2,ylab = "sentiment frequencies",xlab="corpus",main="sentiment analysis over texts")
  scatter.smooth(1:length(res),res,.1,.1,type="h",family = "gaussian",ylab="dependencies: lmer sentiment residuals",xlab="text corpus",main="book/chapter dependency")
  plot(lm2,type = "h",col=2,ylab = "sentiment frequencies",xlab="corpus",main="sentiment analysis over texts")
  p<-ggplot(dta, aes(1:length(sentiment), sentiment, colour = book)) + 
    geom_line()
  p +  labs(x="corpus", y="sentiment absolute", title="sentiment over texts", fill="book")
  #print(le)
  le<-summary(lm)
#return(dta)
}
mfw_out<-list()
#do_sentiment(dta)
#set<-dta
chapterx<-2
mfw<-function(set,chapterx){
#dtasubna<-set
#dtasubna<-dta
#dtatarget<-set
dtatarget<-subset(set,set$chapter_id==chapterx)
#dtatarget<-subset(set,set$chapter_id==)

dtasubna<-dtatarget
#m1<-match(dtatarget$peak,max(dtatarget$peak))
m1<-match(dtatarget$sentiment,max(dtatarget$sentiment))
m2<-!is.na(m1)
textmax<-dtasubna$content[m2]
#m1<-match(dtatarget$peak,min(dtatarget$peak))
m1<-match(dtatarget$sentiment,min(dtatarget$sentiment))
m3<-!is.na(m1)
textmin<-dtasubna$content[m3]
###wks. TODO: display name of text! dafür titel im df erhalten!
mfw_out$min$head<-dtasubna$head[m3]
mfw_out$max$head<-dtasubna$head[m2]
mfw_out$min$book<-dtasubna$book[m3]
mfw_out$max$book<-dtasubna$book[m2]
mfw_out$min$chapter<-dtasubna$chapter[m3]
mfw_out$max$chapter<-dtasubna$chapter[m2]
mfw_out$min$id<-dtasubna$text[m3]
mfw_out$max$id<-dtasubna$text[m2]

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
ifelse(length(p2)!=0,mfw_out$min$words<-p2,mfw_out$min$words<-"no duplicate words")
#print(p2)
#cat("sentiment (minimum) text most frequent words:\n")
#print(p2)
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
ifelse(length(p2)!=0,mfw_out$max$words<-p2,mfw_out$max$words<-"no duplicate words")
#cat("sentiment (maximum) text most frequent words:\n")
#print(p2)
#print(mfw_out)
#mfw_out$max[3]
#t6
#p2<-unique(p2)
#print(p2)
#text2
# return(t4[m>1])
return(mfw_out)
}
#mfw(dta,3)
####
###
#create stopword list
