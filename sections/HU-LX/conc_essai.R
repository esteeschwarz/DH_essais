#13015.HU-LX concordance essai
##############################
library(readr)
library(stringi)
library(R.utils)
getwd()
datadir<-"local/HU-LX/SES"

preprocess_temp<-function(){
src<-paste(datadir,"ses_vert.csv",sep = "/")
d<-read_delim(src)

#d$token[1:20]
#mi<-grep("INT",d$token)
#nna<-!is.na(d$token)
#length(nna)
ms<-grep("[A-Z]{3}",d$token) #speaker lines
# try put column with flowing speaker declaration
sp_d<-array()
sp_ds<-array()
sp_sentence_nr<-array()
sp_sentence<-array()
sp_sentence_cn<-array()
sp_s_cn<-array()
  for (k in 1:length(ms)){
    sp_s<-ms[k]
  if (k<=length(ms))
  sp_e<-ms[k+1]-1
  
  sp_ns<-d$token[sp_s]
  if (!is.na(sp_e)){
    sp_s_cn<-paste(d$token[sp_s:sp_e],collapse = " ")
    sp_d[sp_s:sp_e]<-sp_s:sp_e
  sp_ds[sp_s:sp_e]<-sp_ns
  #sp_sentence_cn[sp_s:sp_e]<-sp_s_cn
  sp_sentence_cn[sp_s:sp_e]<-sp_s_cn
  sp_sentence[sp_s:sp_e]<-sp_s
  }
  }
#paste(d$token[15:29],collapse = " ")
  #spdssafe<-sp_ds
  endns<-length(sp_ds)
  sp_ds[endns:length(d$token)]<-d$token[ms[length(ms)]]
  sp_sentence[endns:length(d$token)]<-d$token[ms[length(ms)]]
  sp_sentence_cn[endns:length(d$token)]<-d$token[ms[length(ms)]]
  sp_s_cn[endns:length(d$token)]<-d$token[ms[length(ms)]]
  
  #sp_ds<-spdssafe
  d$speaker<-sp_ds
  d$sentence<-sp_sentence
  d$sentence_cn<-sp_sentence_cn
  
  ################ wks.
library(stringi)
ann<-data.frame(stri_split_fixed(d$cat,".",simplify = T))
anns<-c("")
d2<-cbind(d,ann)
d3<-cbind(d2$speaker,d2$token,d2$lemma,d2$X1,d2$X2,d2$X3,d2$X4,d2$X5,d2$X6,d2$X7,d2$sentence,d2$sentence_cn)
getwd()
#cleanup
regx<-("<s>|</s>|<g/>")
repl<-""
d4$sentence<-gsub(regx,repl,d4$sentence)
#d3[10,]
d4<-data.frame(d3)
dns<-c("id","speaker","token","lemma","pos",",pos.check.OK","function","case","num","gender","mode","X","snr","sentence")
colnames(d4)<-dns
#write.csv(d4,"sesDB001.csv")     
#d4$sentence<-sp_sentence
#d4$sentence_cn<-sp_sentence_cn
dim(d3)
}
###### wks.
##########
#dns<-colnames((d))

quer_temp<-function(){
#query<-list(dns)
#dn2<-array(dns)
#q<-data.frame(dns)
#q<-as.list(dns)
#q<-as.data.frame(dns[1:10])
#q1<-c("GCB",".*",".*",".*",".*",".*",".*",".*",".*",".*")
#qm<-rbind(dns,q1)
#qm<-data.frame(qm)
#colnames(qm)<-dns
#qm
#q1
#q1<-c("id","#GCB","der",".*",".*",".*",".*",".*",".*",".*",".*",".*",".*")
#m1<-grep(q1,d4)

#m1<-q1%in%d4
#q2<-"der"

#d4<-data.frame(d4)
#d4$sentence
############
#subsetting after query:
length(m1)
unique(m1)
q1_s
q1u<-unique(d4$sentence[m1])
d4$sentence[m1[3]]
dq1<-subset(d4)
dq1$sentence_cn
#sentence<-
dq1$token
m1<-q1%in%d3
}
########
# query:

getdata<-function(){
src<-paste(datadir,"sesDB002.csv",sep = "/")
d<-read.csv(src,sep = ";")
d$pos.check.OK<-0
d4<-d
d$pos_cpt<-paste(d4$function.,d4$case,d4$num,d4$gender,d4$mode,d4$X,sep = "-")
dns<-c("id","speaker","token","lemma","pos","pos.check.OK","funct","cat","case","pers","num","gender","mode","snr","sentence","pos_cpt")
d4<-d
d5<-cbind(d4[,1:12],"fun",d4[,13:15])
colnames(d5)<-dns
d3<-d5
#dns<-c("id","speaker","token","lemma","pos","pos.check.OK","funct","cat","case","pers","num","gender","mode","snr","sentence","pos_cpt")
}

d3<-getdata()
d4<-d3
#d5<-cbind(d4[,1:12],"fun",d4[,13:15])
#colnames(d5)<-dns
ds<-d5
d5<-d3

7:12
#s1<-d5$pos_cpt[18]
#correct POS tag
k<-5
#d4<-d3
#d5<-insert(d5[1,],13,"fun")
#### new
dns[7:14]
ns_g<-list()
ns_g[[1]]<-unique(d5[,7])
ns_g
ns_g[[2]]<-unique(d5[,8])
ns_g[[3]]<-unique(d5[,9])
ns_g[[4]]<-unique(d5[,10])
ns_g[[5]]<-unique(d5[,11])
ns_g[[6]]<-unique(d5[,12])
ns_g[[7]]<-unique(d5[,13])
ns_g2<-list()
ns_g2[["db"]]<-ns_g
ns_g2[["cor"]][["cat"]]<-ns_g[[1]]
ns_g2[["cor"]][["funct"]]<-c("Subst","Sent","Left","Right","Psp","Attr","zu","Gen","XY","Auth")
ns_g2[["cor"]][["case"]]<-c("Nom","Gen","Dat","Acc")
ns_g2[["cor"]][["pers"]]<-c(1,2,3)
ns_g2[["cor"]][["num"]]<-c("Sg","Pl")
ns_g2[["cor"]][["gender"]]<-c("Neut","Fem","Masc")
ns_g2[["cor"]][["tense"]]<-c("Pres","Past")
ns_g2[["cor"]][["mode"]]<-c("Ind","Subj") #"Subj" == conditional


ns_g2[[2]][[1]]
k<-5
d5<-d3
r<-11
#PoS CORRECTION LOOP
#for (k in 1:length(d4$id)){
ma<-array()
s3<-"-"
s4<-s2
s4<-array()
la<-length(ns_g2$cor)
getarray(12)
######################
getarray<-function(r){
s1<-d5$pos_cpt[r]
s1
colnames(d5[7:13])
s2<-stri_split_regex(s1,"-",simplify = T)
a<-c(s2)
s2<-a
rstar<-match(s2,"*")
s2[rstar==T]<-"-"
print(s2)
return(s2)
}
s2<-getarray(10)
for (top in 1:length(s2)){
top_sub<-top_array(s2,top)
}
top<-2
##################
  ######################################
top_array<-function(s2,top){
ma<-array()
  for (l in 1:length(ns_g2$cor[[top]])){
  m1<-match(s2,ns_g2$cor[[top]]) #output position of match in y on array pos x
  m1<-sum(m1,na.rm = T) #position
  #m2<-!is.na(m1)
  m3<-match(ns_g2$cor[[top]],s2)
  #ns_g2$cor[[top]][[m1]]
  m3<-sum(m3,na.rm = T)
  #sum(m2)
  #m4<-!is.na(s2[m1])
  #sum(m4)
  
  ifelse(m3!=0&m1!=0,ma[top]<-ns_g2$cor[[top]][[l]],ma[top]<-"-")
  print(ma)
  }
}
  #s2<-ma
# print(ma)
 # s4[top]<-ma[!is.na(ma)]
    #}
#s3
  #  ifelse(sum(m2)!=0,ma[top]<-ns_g2$cor[[top]][[m2]],ma[top]<-"-")
  s2
  ma
  p<-!is.na(ma)
  s4[top]<-ma[p]
  s5<-s4
  s2
  ma
  s4
#  cat(top,l,s4,"\n")

  cat(top,l,ma,"\n")
  
#   s2
# ma
# s4
# s4
  
  ls<-length(ma)
  d<-la-ls
  dsub<-c(rep("-",d))
  #if (ls>=7)
  #d5[k,7:13]<-s2
  if (ls<la){ma<-c(ma,dsub)}
 # return(ma)
  #e<-match(s2,"")
  #e<-e!=0
  #s2[e]<-"-"
#s2
# d5[k,7:14]<-ma

#  d5[k,7:13]<-ma
return(ma)
  } ################# end top_array(top)
#return(ma)
top_array(top = top)
la<-length(top)
for (top in 1:la){
  
  ma<-array()
  length(ns_g2$cor[[top]])
  #for (s in 1:length(s2)){
  l<-2
  s2
  
} #end top loop
} #end getarray #
###############
lr<-length(d4$id)

s6<-matrix(nrow = la,ncol = length(d4$id))
for (r in 1:lr){
s6[r,]<-getarray(r)

} #end loop call getarray
length(getarray(114))
getarray(15)
#####################
d5[k,7:14]
ma
  s3
s2  


#d4$token[d4$num=="Subj"]


ns_g2$db[1]
#b<-insert(s2,3,11)
regx1<-"[1-3]" # if person on 2nd position push person to 3rd position of PoS tag
m1<-grepl(regx1,s2)
m2<-grep(regx1,s2)
m2v<-grep(regx1,s2,value = T)
s2[m1]

regx2<-"(Nom|Gen|Dat|Acc)"
regx3<-"PRO"
m3<-grepl(regx2,s2)
m4<-grep(regx2,s2)
m7<-match(regx3,d5$pos[k])
s2
if(sum(m1)>0){
  if (m2<4){
repl<-s2[m1]  
repl<-"-"
regx2<-"(Nom|Gen|Dat|Acc)"
m3<-grepl(regx2,s2)
m4<-grep(regx2,s2)
repl<-s2[m3]  
if (sum(m3)>0){
  if (m4<3){s2<-insert(s2,3,repl)}
  s2[m4]<-m2v}
  s2<-c(s2[1],"-",repl,s2[4:7])
  c1<-1
  s2
}
  }
#}###1st
s2
repl<-s2[m3]  
repl
m4
# if (sum(m3)>0){
#   if (m4<3){s2<-insert(s2,3,repl)}
#   s2<-c(s2[1],"-",s2[3:7])
#   c1<-1
#   s2
# }  
  m5<-grepl(regx1,s2)
  m6<-grep(regx1,s2)
  s2[m5]
s2
#m5

if(sum(m5)>0){
  if (m6!=4){
  #repl<-s2[m1]  
  repl<-c("-","-")
  
  s2<-insert(s2,2,repl)}
  c1<-1}
  if(sum(m1)==0&c1==0){
  #  if (m2!=4){
      #repl<-s2[m1]  
      repl<-c("-")
      s2<-insert(s2,4,repl)}
  
s2
m1<-grepl(regx1,s2)
m2<-grep(regx1,s2)
s2[m1]
s2
m2
###
if(sum(m1)>0){
  if (m2!=4){
    #repl<-s2[m1]  
    repl<-c("-","-")
    
    s2<-insert(s2,2,repl)}
###
  # w1<-unique(d4$case)
# w1
if(c!=1){
regx2<-"(Nom|Gen|Dat|Acc)"
m1<-grepl(regx2,s2)
nom<-grep(regx2,s2,invert = T)
repl<-s2[m1]  
if (sum(m1)>0){
if (nom<=3)#{s2<-insert(s2,3,repl)
{s2<-c(s2[1],"-",s2[m1],"-",s2[3:7])}

  }}
s2
ls<-length(s2)
#if (ls>=7)
#d5[k,7:13]<-s2
if (ls<7){s2<-c(s2,"-")}
if (ls==8&s2[8]==""){s2<-s2[1:7]}
s2
d5[k,7:13]<-s2

#    d5[k,7:12]<-s2
}
}
#### end getarray FALSE#########
s2
ds<-d5

write.csv(d5,paste0(datadir,"sesDB003.csv"))
          
s2

dns<-colnames(d)
q1<-c(".*","#TBV","","gehen",".*",".*",".*",".*",".*",".*",".*",".*",".*",".*")
sampleq<-rbind(dns,q1)
colnames(sampleq)<-dns
sampleq<-data.frame(sampleq)
###################
#sampleq$id[k]
#query[1,1]
#k<-1
q_sub<-function(set,k,query){
  #m1<-set
  set<-d4
  m1<-subset(set,grepl(query$id[k],set[,1]))
  m2<-subset(m1,grepl(query$speaker[k],m1[,2])) ### NOT with logical but grep, match etc.
  ifelse(query$token!="",
  m3<-subset(m2,query$token[k]==m2[,3]),
  m3<-subset(m2,grepl(query$token[k],m2[,3])))
  m4<-subset(m3,grepl(query$lemma[k],m3[,4]))
  m5<-subset(m4,grepl(query$pos[k],m4[,5]))
  m6<-subset(m5,grepl(query$pos.check.OK[k],m5[,6]))
  m7<-subset(m6,grepl(query$function.[k],m6[,7]))
  m8<-subset(m7,grepl(query$case[k],m7[,8]))
  m9<-subset(m8,grepl(query$num[k],m8[,9]))
  m10<-subset(m9,grepl(query$gender[k],m9[,10]))
  m11<-subset(m10,grepl(query$mode[k],m10[,11]))
  m12<-subset(m11,grepl(query$regex[k],m11$sentence))
}
# RUN: #############
#query declaration:
sampleq$id<-          ".*"
sampleq$speaker<-     "#TBU"
sampleq$token<-       ""
sampleq$lemma<-       ".*"
sampleq$pos<-         ".*"
sampleq$pos.check.OK<-".*"
sampleq$function.<-   ".*"
sampleq$case<-        ".*"
sampleq$num<-         ".*"
sampleq$gender<-      ".*"
sampleq$mode<-        ".*"
sampleq$X<-           ".*"
sampleq$snr<-         ".*"
sampleq$regex<-       "ich"
####################
query<-sampleq
m2<-q_sub(getdata(),1,query)
#set$sentence[m2]
####################
# OUTPUT:
unique(m2$sentence)
##### other method subscript
