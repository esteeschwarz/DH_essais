library(mongolite)
library(readr)
library(jsonlite)
library(ggplot2)
library(lme4)

# fsi<-read_delim()
# con$index()
# x<-con$distinct("lengevitch")
# x<-con$find('{}')
# con$export(file("wolfmongo.json"))
getwd()
src<-paste0(getwd(),"/local/R/cred_gener.csv")
cred<-read.csv(src)
# # list.dirs(paste0(getwd(),"/local/DYN"))
# # dir.create(paste0(getwd(),"/local/DYN/db"))
# setwd(paste0(getwd(),"/local/DYN/db"))
# x<-con$find(fields = '{"div":true}',limit = 10)
# con$count()
con<- mongo(collection = "wolfdb003", db ="deadend", url=cred$url[cred$q=="mongodb"])

###wks.
#prepare df
tempfun<-function(){
db<-(fromJSON("wolfmongo.json"))
dta1<-as.data.frame(db$book$chapter[1])
dta2<-as.data.frame(db$book$chapter[2])
dta3<-as.data.frame(db$book$chapter[3])
dta<-as.data.frame(db)
dta21<-as.data.frame(dta2$pg[1])
dta22<-as.data.frame(dta2$pg[2])
dta23<-as.data.frame(dta2$pg[3])
dta24<-as.data.frame(dta2$pg[4])
dta25<-as.data.frame(dta2$pg[5])
dta26<-as.data.frame(dta2$pg[6])
dta27<-as.data.frame(dta2$pg[7])
dta28<-as.data.frame(dta2$pg[8])

dta31<-as.data.frame(dta3$pg[1])
dta32<-as.data.frame(dta3$pg[2])
dta33<-as.data.frame(dta3$pg[3])
dta34<-as.data.frame(dta3$pg[4])

dta11<-as.data.frame(dta1$pg[1])
#dta11<-dta1 #one dimension
###all texts in single df
dtac2<-rbind(dta21,dta24)
dta1$ID<-dta1$id
dta1$book<-"FF"
dta1$chapter<-dta1$pg.chtitle
dta1$content<-dta1$pg.div
dta1$head<-dta1$pg.title
dta1$phead<-NA

dta21$content<-dta21$div$`#text`
dta21$ID<-dta21$div$id
dta21$book<-"lengevitch"
dta21$chapter<-unique(dta21$chtitle[1])
dta21$head<-dta21$title
dta21$phead<-NA

dta22$content<-dta22$div$`#text`
dta22$ID<-dta22$div$id
dta22$book<-"lengevitch"
dta22$chapter<-dta22$chtitle[1]
dta22$content<-dta1$pg.div
dta22$head<-dta22$title
dta22$phead<-NA

dta23$content<-dta23$div$`#text`
dta23$ID<-dta23$div$id
dta23$book<-"lengevitch"
dta23$chapter<-dta23$chtitle[1]
dta23$head<-dta23$div$title
dta23$phead<-dta23$ptitle

dta24$content<-dta24$div$`#text`
dta24$ID<-dta24$div$id
dta24$book<-"lengevitch"
dta24$chapter<-dta24$chtitle[1]
dta24$head<-dta24$title
dta24$phead<-dta24$ptitle

dta25$content<-dta25$div$`#text`
dta25$ID<-dta25$div$id
dta25$book<-"lengevitch"
dta25$chapter<-dta25$chtitle[1]
dta25$head<-dta25$title
dta25$phead<-"spitzen"

dta26$content<-dta26$div$`#text`
dta26$ID<-dta26$div$id
dta26$book<-"lengevitch"
dta26$chapter<-dta26$chtitle[1]
dta26$head<-dta26$div$title
dta26$phead<-dta26$ptitle

dta27$content<-dta27$div$`#text`
dta27$ID<-dta27$div$id
dta27$book<-"lengevitch"
dta27$chapter<-dta27$chtitle[1]
dta27$head<-dta27$ptitle[2]
dta27$phead<-dta27$ptitle[2]

dta31$content<-dta31$div$`#text`
dta31$ID<-dta31$div$id
dta31$book<-"kochanie"
dta31$chapter<-dta31$chtitle[1]
dta31$head<-dta31$title
dta31$phead<-dta31$ptitle

dta32$content<-dta32$div$`#text`
dta32$ID<-dta32$div$id
dta32$book<-"kochanie"
dta32$chapter<-dta32$chtitle[1]
dta32$head<-dta32$title
dta32$phead<-dta32$ptitle

dta33$content<-dta33$div$`#text`
dta33$ID<-dta33$div$id
dta33$book<-"kochanie"
dta33$chapter<-dta33$chtitle[1]
dta33$head<-dta33$title
dta33$phead<-dta33$chtitle[1]
###
dtacc<-rbind(dta1$ID)
dta26s<-cbind(dta26$ID,dta26$book,dta26$chapter,dta26$phead,dta26$head,dta26$content)
dta33s<-cbind(dta33$ID,dta33$book,dta33$chapter,dta33$phead,dta33$head,dta33$content)
dta11s<-cbind(dta1$ID,dta1$book,dta1$chapter,dta1$phead,dta1$head,dta1$content)
dta4<-rbind(dta21s,dta22s,dta23s,dta24s,dta25s,dta26s,dta27s,dta31s,dta32s,dta33s)
dta4b<-rbind(dta11b[2:7],dta4)
colnames(dta)<-c("text","page","book","chapter","phead","head","content","sentiment")
write.csv2(dta4,"wolfdb001.csv")
dim(dta22s)
head(dta21s)
write.csv2(dta4c,"wolfdb002.csv")
write_csv(dta4c,"wolfdb002.csv")
dta4c<-as.data.frame(dta4b)
###try insert to mongo
#dta11b<-read.csv2("wolfdbff.csv")
dtaimp<-read.csv2("wolfdb002cor.csv")
con$drop()
con$insert(dta)
con$find()
con$remove('{}')
typeof(dta4d)
dta4d<-as.data.frame(dta4c)
con$count()
}
#end tempfun
###########
library(syuzhet)
x<-con$find('{}')
#dta<-dtaimp
dta<-x
#m<-!is.na(x$content)
dtam<-subset(dta,!is.na(dta$content))
dta<-dtam
#dtaexpo<-dta[2:8]
#dta$content[dta$book=="FF"]
a1<-get_sentiment(dta$content[dta$book=="kochanie"],method = "syuzhet",language = "german")
a1i<-get_transformed_values(a1)

a2<-get_sentiment(dta$content[dta$book=="FF"],method = "syuzhet",language = "german")

#dta$sentiment<-get_sentiment(dta$content)
a2i<-get_transformed_values(a2)
a3<-get_sentiment(dta$content[dta$book=="lengevitch"],method = "syuzhet",language = "german")
a3i<-get_transformed_values(a3)


# #label<-c("main"=chapter)
# color<-3
# par(new=T)
#sentbox$a<-dta$sentiment[dta$book]
#plot(dta$sentiment[dta$book=="lengevitch"]~dta$sentiment[dta$book=="kochanie"],main="sentiment analysis",ylab="relative value",xlab="distribution over:",col=color,asp=1)
#points(a3, cex = .2, col = "dark red")
plot(a1i~a2i)
plot(a1i~a3i)
plot(a2i~a3i)
chisq.test(a1i,a3i)
chisq.test(a2i,a3i)
chisq.test(a1i,a2i)
#no.
### lmer test
#?lme4
# formel: test dependency sentiment of book
################################################
# new with sorted df (after year of publication)
#sort df new after publication year
dta$top[dta$book=="kochanie"]<-2005
dta$top[dta$book=="FF"]<-2009
dta$top[dta$book=="lengevitch"]<-2013

ds<-dta[with(dta,order(dta$top)),]
dta<-ds
dtans<-colnames(dta)
dta0<-c(NA,NA,"a-intercept","a-intercept","null","null","null","null","null")
dtalm<-rbind(dta0,dta)
dtalm$sentiment[1]<-0
mode(dtalm$sentiment)<-"double"
#print(dtans)
lm<-lmer(dtalm$sentiment~dtalm$book+(dtalm$book|dtalm$chapter),dtalm)
le<-summary(lm)
res<-le$residuals
#library(lmerTest)
#plot(a1,type = "h")
lm2<-get_transformed_values(res)
scatter.smooth(le$residuals,1:length(le$residuals),.1,.1,family = "gaussian")
# plot(lm2,type = "h",col=2,ylab = "sentiment factorized",xlab="books",main="sentiment analysis: book/chapter dependency")
####
m1<-mean(dtalm$sentiment[dtalm$book=="kochanie"])
m2<-mean(dtalm$sentiment[dtalm$book=="FF"])
m3<-mean(dtalm$sentiment[dtalm$book=="lengevitch"])
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
#scatter.smooth("index"<-1:131,res,.1,.1,type="h",family = "gaussian")#wks.

plot(lm2,type = "h",col=2,ylab = "sentiment frequencies",xlab="corpus",main="sentiment analysis over texts")

#pdf<-cbind("FF"=a1,"kochanie"=a2,"lengevitch"=a3)
# 
# p<-ggplot(dta,mapping=aes(y=sentiment,
#                                    x=1:130)) 
# p + geom_bar(fill = "lightblue", color = "black", stat="identity")
# p<-ggplot(dta)
# p+geom_bar(mapping=aes(1:130, sentiment), colour = book) 
p<-ggplot(ds, aes(1:length(sentiment), sentiment, colour = book)) + 
  geom_line()
p +  labs(x="corpus", y="sentiment absolute", title="sentiment over texts", fill="book")
###wks.
# #sort df new after publication year
#  dta$top[dta$book=="kochanie"]<-2005
#  dta$top[dta$book=="FF"]<-2009
#  dta$top[dta$book=="lengevitch"]<-2013
# dtas<-dta[sort(dta$top)]
# order(dta$top,decreasing = F)
# sort(dta$top,decreasing = F)
# 
# s<-c(rep(3,7),rep(1,4),rep(2,6))
# s
# sort(s)
# m<-order(-s,decreasing=T)
# s[m]
# m<-order(-dta$top,decreasing = T)
# m<-dta$top
# ms<-order(-m,decreasing = T)
# dta[m]
# dta$row<-m
# ms
# m[ms]
# dta$book[ms]
# dta$book[order(dta$top)]

# #ordering dataframe by column 1
# df[with(df,order(df[,1])), ]
# #ordering dataframe by column name 'a'
# df[with(df,order(df[,"a"])), ]
# 
# ds<-dta[with(dta,order(dta$top)),]

