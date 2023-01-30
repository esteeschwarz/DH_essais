d3$QU01
#m1<-grep("QU",colnames(d3))
deval<-data.frame(response=1:lc)
lobs<-length(d3$QU01)
lq<-length(m1)
lc<-l1*length(m1)
deval$response[1:lc]<-0
rowarray<-array()
for (k in m1){
  rstart<-lobs*k
  data<-d3[,k]
  rowarray<-append(rowarray,data,after = rstart)
  
}
head(rowarray)
head(d3$QU01)
deval$response_value<-rowarray[2:length(rowarray)]
ds$QU10 = factor(ds$QU10, levels=c("1","2","3","4","-9"), labels=c("inconcrete","name","request","unclear","N.A."), ordered=FALSE)

t1<-deval$response_value==1
t2<-deval$response_value==2
t3<-deval$response_value==3
t4<-deval$response_value==4
t9<-deval$response_value==-9
t5<-deval$response_value==5

t6<-is.na(deval$response_value)
deval$response_lang[t1]<-"undef"
deval$response_lang[t2]<-"index"
deval$response_lang[t3]<-"request"
deval$response_lang[t4]<-"unclear"
deval$response_lang[t5]<-"N.A."
deval$response_lang[t6]<-"N.A."
deval$response_lang[t9]<-"N.A."

k<-1
attr(d3[,k],"1")
attr(ds$MT05x01,"1") = "indexbuch"
attr(ds$MT05x01,"1")

attrlist<-1:39
attrlist<-as.character(attrlist)
d4<-d3

attr(d4$QU01,attrlist[1])
attarray<-array()
for (k in 1:length(attrlist)){
attarray[k]<-attr(d4$MT05x01,attrlist[k])


}
attarray
attdf<-rep(attarray,64)
attdf<-gsub("fern","####",attdf)
deval$stimulus<-attdf
stindex<-strsplit(attdf,"index")
stindex[[2]]
stall<-list()
stall[["index"]]<-stri_extract_all_regex(attdf,"index")
stall[["request"]]<-stri_extract_all_regex(attdf,"request")
stall[["undef"]]<-stri_extract_all_regex(attdf,"undef")


stall[["vogel"]]<-stri_extract_all_regex(attdf,"vogel")
stall[["kamm"]]<-stri_extract_all_regex(attdf,"kamm")
stall[["salz"]]<-stri_extract_all_regex(attdf,"salz")
stall[["ring"]]<-stri_extract_all_regex(attdf,"ring")
stall[["messer"]]<-stri_extract_all_regex(attdf,"messer")
stall[["tasse"]]<-stri_extract_all_regex(attdf,"tasse")
stall[["buch"]]<-stri_extract_all_regex(attdf,"buch")
stall[["pfote"]]<-stri_extract_all_regex(attdf,"pfote")
stall[["zange"]]<-stri_extract_all_regex(attdf,"zange")
stall[["cola"]]<-stri_extract_all_regex(attdf,"cola")
stall[["stift"]]<-stri_extract_all_regex(attdf,"stift")
stall[["handy"]]<-stri_extract_all_regex(attdf,"handy")
stall[["raute"]]<-stri_extract_all_regex(attdf,"####")
#stall["vogel"]<-stri_extract_all_regex(attdf,"vogel")


deval$word[!is.na(stall$vogel)]<-"vogel"
deval$word[!is.na(stall$kamm)]<-"kamm"
deval$word[!is.na(stall$messer)]<-"messer"
deval$word[!is.na(stall$ring)]<-"ring"
deval$word[!is.na(stall$tasse)]<-"tasse"
deval$word[!is.na(stall$pfote)]<-"pfote"
deval$word[!is.na(stall$buch)]<-"buch"
deval$word[!is.na(stall$stift)]<-"stift"
deval$word[!is.na(stall$cola)]<-"cola"
deval$word[!is.na(stall$handy)]<-"handy"
deval$word[!is.na(stall$raute)]<-"####"
deval$word[!is.na(stall$ring)]<-"ring"
deval$word[!is.na(stall$salz)]<-"salz"
deval$word[!is.na(stall$zange)]<-"zange"


deval$png[!is.na(stall$index)]<-"index"
deval$png[!is.na(stall$undef)]<-"undef"
deval$png[!is.na(stall$request)]<-"request"
#deval$word[!is.na(stall$vogel)]<-"vogel"

deval$true<-deval$png==deval$response_lang

lm1<-lm(true~stimulus,deval)
summary(lm1)
lm2<-lmer(true~stimulus+(1|word)+(1|png),deval)
sum1<-summary(lm2)
coef1<-data.frame(sum1$coefficients)
rownames(coef1)[1]<-"stimulusindex####"

coef2<-coef1[order(coef1$t.value,decreasing = T),]
coef1[which.min(coef1$t.value),]
coef1[which.max(coef1$t.value),]


head(coef2)
tail(coef2)
###########
deval$expected<-TRUE

lm3<-lm(true~stimulus,deval)
sum1<-summary(lm3)
lm4<-lmer(true~stimulus+(expected|word)+(expected|png),deval)
lm4<-lmer(true~stimulus+(1|png)+(1|word),deval)
lm5<-lmer(true~response_lang+(1|png)+(1|word),deval)
sum1<-summary(lm5)
plot(lm4)
plot(lm3)

## graph
m<-deval$expected #ideal (correct) answer / picture
#m<-max(df4$response_value)
o<-length(deval$response_value) # anzahl answers 
#y<-1:m
#m<-o
x = runif(o,0,m) # ideal random distribution over observation
x<-1:152
x<-m
y = deval$true # real distribution
#mean(x)
response<-y
expected<-x
#a<-mean(df5$response_value)
#dplot<-data.frame(expected=x,response=y)
plot.new()
plot(x, y, pch=18,main="chosen label vs. ideal selection",xlab="ideal-fitted",ylab="selection")
abline(a=13, b=0,col="grey")
regxy = lm(response~expected)
#lm2<-lm(dplot)
#summary(lm2)
summary(regxy)
#summary(lm(y~x))
abline(regxy)
text(25, 30, "Ideal", pos=4)
arrows(28, 28, 28, 13, length=.15)
text(5, 20, "Abweichung", pos=4,col=2)
arrows(7.4, 18.8, 7.4, coef(regxy)%*%c(1,7.4), length=.15,col=2)
segments(x, y, x, fitted(regxy), lty=3)

