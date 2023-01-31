#d3$QU01
#m1<-grep("QU",colnames(d3))
lobs<-length(d3$QU01)
lq<-length(m1)
lc<-lobs*length(m1)
deval<-data.frame(response=1:lc)

deval$response[1:lc]<-0
rowarray<-array()
for (k in m1){
  rstart<-lobs*k
  data<-d3[,k]
  rowarray<-append(rowarray,data,after = rstart)
  
}
head(rowarray)
head(d3$QU01)
# put QU01-QU39 answers into DF
deval$response_value<-rowarray[2:length(rowarray)]
# ds$QU10 = factor(ds$QU10, levels=c("1","2","3","4","-9"), labels=c("inconcrete","name","request","unclear","N.A."), ordered=FALSE)

#now same for meta questions
# ds$MT02 = factor(ds$MT02, levels=c("1","2","3","-1","-9"), labels=c("m","w","d","[NA] k.A.","N.A."), ordered=FALSE)
# ds$MT03 = factor(ds$MT03, levels=c("1","2","3","4","5","6","7","8","-9"), labels=c("18 - 22","23 - 27","28 - 35","36 - 42","43 - 50","51 - 60","61 - 70","71 - 80","N.A."), ordered=FALSE)
# ds$MT08 = factor(ds$MT08, levels=c("1","2","-9"), labels=c("ja","nein","N.A."), ordered=FALSE)
# ds$MT11 = factor(ds$MT11, levels=c("1","2","3","4","5","-9"), labels=c("weniger als einmal pro Woche","ungefähr einmal pro Woche","zweimal pro Woche","mehr als zweimal pro Woche","jeden Tag","N.A."), ordered=FALSE)
k<-1
rowarray<-array()
m2<-c("MT02","MT03","MT08","MT11")
for (k in 1:39){
  rstart<-lobs*k
  data<-d3[,m2[1]]
  rowarray<-append(rowarray,data,after = rstart)
}  
#data1<-unlist(rowarray)
deval$sex<-rowarray[2:length(rowarray)]
#data1[2:10]
rowarray[1:10]

rowarray<-array()
for (k in 1:39){
  rstart<-lobs*k
  data<-d3[,m2[2]]
  rowarray<-append(rowarray,data,after = rstart)
}  
#data1<-unlist(rowarray)
deval$age<-rowarray[2:length(rowarray)]

rowarray<-array()
for (k in 1:39){
  rstart<-lobs*k
  data<-d3[,m2[3]]
  rowarray<-append(rowarray,data,after = rstart)
}  
#data1<-unlist(rowarray)
deval$biL<-rowarray[2:length(rowarray)]

rowarray<-array()
for (k in 1:39){
  rstart<-lobs*k
  data<-d3[,m2[4]]
  rowarray<-append(rowarray,data,after = rstart)
}  
deval$child_IA<-rowarray[2:length(rowarray)]

################

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

###########################
# add labels
t1<-deval$sex==1
t2<-deval$sex==2
t3<-deval$sex==3
t4<-deval$sex==-1
t5<-deval$sex==5
t6<-deval$sex==6
t7<-deval$sex==7
t8<-deval$sex==8
t9<-deval$sex==-9
t10<-is.na(deval$sex)

deval$sex[t1]<-"m"
deval$sex[t2]<-"w"
deval$sex[t3]<-"d"
deval$sex[t4]<-"k.a."
#deval$sex[t5]<-"N.A."
#deval$sex[t6]<-"N.A."
#deval$sex[t7]<-"N.A."
#deval$sex[t8]<-"N.A."
deval$sex[t9]<-"N.A."
deval$sex[t10]<-"N.A."
#deval$sex[t9]<-"N.A."

t1<-deval$age==1
t2<-deval$age==2
t3<-deval$age==3
t4<-deval$age==4
t5<-deval$age==5
t6<-deval$age==6
t7<-deval$age==7
t8<-deval$age==8
t9<-deval$age==-9
t10<-is.na(deval$age)

deval$age[t1]<-"18-22"
deval$age[t2]<-"23-27"
deval$age[t3]<-"28-35"
deval$age[t4]<-"36-42"
deval$age[t5]<-"43-50"
deval$age[t6]<-"51-60"
deval$age[t7]<-"61-70"
deval$age[t8]<-"71-80"
deval$age[t9]<-"N.A."
deval$age[t10]<-"N.A."
#deval$age[t9]<-"N.A."

d3$MT08[1:10]

t1<-deval$biL==1
t2<-deval$biL==2
#t3<-deval$age==3
#t4<-deval$age==4
#t5<-deval$age==5
#t6<-deval$age==6
#t7<-deval$age==7
#t8<-deval$age==8
t9<-deval$biL==-9
t10<-is.na(deval$biL)

deval$biL[t1]<-T
deval$biL[t2]<-F
#deval$age[t3]<-"28-35"
#deval$age[t4]<-"36-42"
#deval$age[t5]<-"43-50"
#deval$age[t6]<-"51-60"
#deval$age[t7]<-"61-70"
#deval$age[t8]<-"71-80"
deval$biL[t9]<-"N.A."
deval$biL[t10]<-"N.A."

t1<-deval$child_IA==1
t2<-deval$child_IA==2
t3<-deval$child_IA==3
t4<-deval$child_IA==4
t5<-deval$child_IA==5
#t2<-deval$child_IA==2

#t3<-deval$age==3
#t4<-deval$age==4
#t5<-deval$age==5
#t6<-deval$age==6
#t7<-deval$age==7
#t8<-deval$age==8
t9<-deval$child_IA==-9
t10<-is.na(deval$child_IA)

deval$child_IA[t1]<-T
deval$child_IA[t2]<-F
#deval$age[t3]<-"28-35"
#deval$age[t4]<-"36-42"
#deval$age[t5]<-"43-50"
#deval$age[t6]<-"51-60"
#deval$age[t7]<-"61-70"
#deval$age[t8]<-"71-80"
deval$child_IA[t9]<-"N.A."
deval$child_IA[t10]<-"N.A."

getwd()
#write.csv(deval,"local/SPUND/db_nprg001.csv")
#write.csv(deval,"gith/DH_essais/sections/eval/nprg-eval/db_nprg001.csv")

# k<-1
# attr(d3[,k],"1")
# attr(ds$MT05x01,"1") = "indexbuch"
# attr(ds$MT05x01,"1")
# 
attrlist<-1:39
attrlist<-as.character(attrlist)
d4<-d3

#attr(d4$QU01,attrlist[1])
attarray<-array()
for (k in 1:length(attrlist)){
attarray[k]<-attr(d4$MT05x01,attrlist[k])


}
attarray
attdf<-rep(attarray,lobs)
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

# lm1<-lm(true~stimulus,deval)
# summary(lm1)
# lm2<-lmer(true~stimulus+(1|word)+(1|png),deval)
# sum1<-summary(lm2)
# coef1<-data.frame(sum1$coefficients)
# #rownames(coef1)[1]<-"stimulusindex####"
# 
# coef2<-coef1[order(coef1$t.value,decreasing = T),]
# coef1[which.min(coef1$t.value),]
# coef1[which.max(coef1$t.value),]


head(coef2)
tail(coef2)
###########
deval$expected<-TRUE

# lm3<-lm(true~stimulus,deval)
# sum1<-summary(lm3)
# lm4<-lmer(true~stimulus+(expected|word)+(expected|png),deval)
# lm4<-lmer(true~stimulus+(1|png)+(1|word),deval)
# lm5<-lmer(true~response_lang+(1|png)+(1|word),deval)
# sum1<-summary(lm5)
# plot(lm4)
#plot(lm3)

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
# plot.new()
# plot(x, y, pch=18,main="chosen label vs. ideal selection",xlab="ideal-fitted",ylab="selection")
# abline(a=13, b=0,col="grey")
# regxy = lm(response~expected)
# #abline(regxy)
# #lm2<-lm(dplot)
# #summary(lm2)
# summary(regxy)
# #summary(lm(y~x))
# abline(regxy)
# text(25, 30, "Ideal", pos=4)
# arrows(28, 28, 28, 13, length=.15)
# text(5, 20, "Abweichung", pos=4,col=2)
# arrows(7.4, 18.8, 7.4, coef(regxy)%*%c(1,7.4), length=.15,col=2)
# segments(x, y, x, fitted(regxy), lty=3)

# d3$MT11
# d3$MT13_01 #feedback
# d3$MT09_01
# d3$MT11
# d3$MT07_01
# d3$MT03
# d3$MT06

#########
tnresponse<-list()
tndf<-data.frame()
k<-1
# for (k in 1:lobs){
#     
#     q1<-d3[k,m1[1:13]]
#     q2<-d3[k,m1[14:26]]
#     q3<-d3[k,m1[27:39]]       
#   tnresponse[[k]]["index"]<-q1
#   tnresponse[[k]]["request"]<-q2
#   tnresponse[[k]]["undef"]<-q3
# }
responsearray<-c("inconcrete","name","request","unclear","N.A.")

#tnresponse[[7]]["request"]


tnarray<-array()
for (k in 1:39){
  tnstart<-lobs*k
  data<-1:lobs
  tnarray<-append(tnarray,data,after = tnstart)
}  
#data1<-unlist(rowarray)
deval$tn<-tnarray[2:length(tnarray)]
qtn<-2
qstim<-"indexring"
qresp<-"index"
evalcount<-function(qtn,qstim,qresp){
#  set<-subset(deval,deval$tn==qtn&deval$qstim==stimulus&deval$response_lang==qresp)
  set<-subset(deval,deval$tn==qtn&deval$png==qstim&deval$response_lang==qresp)
 # set<-subset(deval,deval$tn==tnid)
  #print(count)
    count<-length(set$tn)
  print(count)
  return(count)
}
pngarray<-c("index","undef","request")
responsearray
tncount<-list()
pngcount<-array()
emptycol<-rep(0,lobs)
pngcount<-data.frame(tn=1:lobs,index=emptycol,request=emptycol,undef=emptycol,checksum=emptycol)
t<-2
#pngcount$index<-emptycol
26-5
# for (c in 6:26){
# 
#   for (k in 1:lobs){
#   pngcount[k,6]<-evalcount(t,"index","undef")
#   pngcount[k,7]<-evalcount(t,"index","index")
#   pngcount[k,8]<-evalcount(t,"index","request")
#   pngcount[k,9]<-evalcount(t,"index","unclear")
#   
# }
# }
for (t in 1:lobs){
# selections for INDEX stimulus, 1 out of 4
  
pngcount$undefindex[t]<-evalcount(t,"index","undef")
pngcount$indexindex[t]<-evalcount(t,"index","index")
pngcount$requestindex[t]<-evalcount(t,"index","request")
pngcount$unclearindex[t]<-evalcount(t,"index","unclear")

  
# selections for REQUEST stimulus
pngcount$undefrequest[t]<-evalcount(t,"request","undef")
pngcount$indexrequest[t]<-evalcount(t,"request","index")
pngcount$requestrequest[t]<-evalcount(t,"request","request")
pngcount$unclearrequest[t]<-evalcount(t,"index","unclear")

# selections for UNDEF stimulus
pngcount$undefundef[t]<-evalcount(t,"undef","undef")
pngcount$indexundef[t]<-evalcount(t,"undef","index")
pngcount$requestundef[t]<-evalcount(t,"undef","request")
pngcount$unclearundef[t]<-evalcount(t,"undef","unclear")

# pngcount$indexrequest[t]<-evalcount(t,"request","index")
# pngcount$undefrequest[t]<-evalcount(t,"request","undef")
# pngcount$requestrequest[t]<-evalcount(t,"request","request")

# sum of selections per stimulus
pngcount$index[t]<-pngcount$indexindex[t]+pngcount$requestindex[t]+pngcount$undefindex[t]+pngcount$unclearindex[t]
pngcount$request[t]<-pngcount$indexrequest[t]+pngcount$requestrequest[t]+pngcount$undefrequest[t]+pngcount$unclearrequest[t]
pngcount$undef[t]<-pngcount$indexundef[t]+pngcount$requestundef[t]+pngcount$undefundef[t]+pngcount$unclearundef[t]
pngcount$checksum[t]<-pngcount$index[t]+pngcount$request[t]+pngcount$undef[t]


# p of selection per tn and stimulus
pngcount$indexundef_p[t]<-pngcount$undefindex[t]/pngcount$index[t]*100
pngcount$indexindex_p[t]<-pngcount$indexindex[t]/pngcount$index[t]*100
pngcount$indexrequest_p[t]<-pngcount$requestindex[t]/pngcount$index[t]*100
pngcount$indexunclear_p[t]<-pngcount$unclearindex[t]/pngcount$index[t]*100


pngcount$requestindex_p[t]<-pngcount$indexrequest[t]/pngcount$request[t]*100
pngcount$requestrequest_p[t]<-pngcount$requestrequest[t]/pngcount$request[t]*100
pngcount$requestundef_p[t]<-pngcount$undefrequest[t]/pngcount$request[t]*100
pngcount$requestunclear_p[t]<-pngcount$unclearrequest[t]/pngcount$request[t]*100

pngcount$undefindex_p[t]<-pngcount$indexundef[t]/pngcount$undef[t]*100
pngcount$undefrequest_p[t]<-pngcount$requestundef[t]/pngcount$undef[t]*100
pngcount$undefundef_p[t]<-pngcount$undefundef[t]/pngcount$undef[t]*100
pngcount$undefunclear_p[t]<-pngcount$unclearundef[t]/pngcount$undef[t]*100

}
3/9*100
#rm(pngcount)
