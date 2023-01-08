#13015.HU-LX concordance essai
##############################
library(readr)
library(stringi)
library(R.utils)
getwd()
datadir<-"local/HU-LX/SES"

# now again from base DB
getwd()
setwd(datadir)

list.files(datadir)
d1<-read_delim("ses_vert.csv")
set<-d2
cleandb<-function(set){
  #set
  # delete <g/>, <s>, </s> rows
  # grep
  regx1<-"(<g/>)"
  regx2<-"(<s>)"
  regx3<-"(</s>)"
  regx4<-"#|%|:"
  m1<-grep(regx1,set$token)
  m2<-grep(regx2,set$token)
  m3<-grep(regx3,set$token)
  m4<-grep(regx4,set$token)
  # exclude
  ex<-c(m1,m2,m3,m4)
  set$gilt<-T
  set$gilt[ex]<-F
  #exin<-match(ex,set$X.1)
  d2<-subset(set,set$gilt==T)
}

#d3<-cleandb(d2)
#d<-d1
set<-d1
preprocess_temp<-function(set){
d<-set
ms<-grep("(#[A-Z]{3})",d$token) #speaker lines #"(#[A-Z]{3})" = 4942 matches in raw data
# distinct speakers:
ms2<-grep("(#[A-Z]{3})",d$token,value = T) #speaker lines #"(#[A-Z]{3})" = 4942 matches in raw data
spk<-unique(ms2)
spk_array<-c("GCB","GCC","GDA","GDB","GDC","GDD","GDE","GDF","TAD","TAH","TAI","TBD","TBE","TBS","TBT","TBU","TBV","INT")
spk_array2<-paste0("#",spk_array)
#spk_grep<-paste0(spk_array2,"|")
spk_grep2<-paste0(spk_array2,collapse = "|")
spk_grep3<-paste0("(",spk_grep2,")")
spk_grep3
ms3<-grep(spk_grep3,d$token) #speaker lines #"(#[A-Z]{3})" = 4942 matches in raw data
spk
# try put column with flowing speaker declaration
sp_d<-array()
sp_ds<-array()
sp_sentence_nr<-array()
sp_sentence<-array()
sp_sentence_cn<-array()
sp_s_cn<-array()
#k<-25
ms<-ms3
d$sentence_temp<-"---"
d$speaker<-"---"

### output sentence
for (k in 1:length(ms)){
  sp_sentence_cn<-array()
  
      sp_s<-ms[k]
    sp_p1<-ms[k]
    
    if (k<=length(ms))
    sp_e<-ms[k+1]-1
    if (k==length(ms))
      sp_e<-length(d$token)
    sp_p2<-ms[k+1]-1
    
  sp_ns<-d$token[sp_s]
    sp_s_cn<-paste(d$token[sp_s:sp_e],collapse = " ")
  d$sentence_temp[sp_s:sp_e]<-sp_s_cn
  d$speaker[sp_s:sp_e]<-sp_ns  
} #end sentence loop
  ################ wks.
library(stringi)
  
#ann<-data.frame(stri_split_fixed(d$cat,".",simplify = T))
#anns<-c("")
#ann<-c(rep("-",8))
d3<-cbind(d,"-","-","-","-","-","-","-","-") # empty POS rows
#d3<-cbind(d2$speaker,d2$token,d2$lemma,d2$X1,d2$X2,d2$X3,d2$X4,d2$X5,d2$X6,d2$X7,d2$sentence,d2$sentence_cn)
getwd()
#cleanup
regx<-("<s>|</s>|<g/>")
repl<-""
d4<-d3

d4$sentence<-gsub(regx,repl,d$sentence_temp)
#d3[10,]
print(d4[19,])
print(length(d4[1,]))
#dns<-c("id","speaker","token","lemma","pos",",pos.check.OK","function","case","num","gender","mode","X","snr","sentence")
# dns<-c("speaker","token","lemma","pos","cat","p1","p2","p3","p4","p5","sen_temp","sentence")
d4<-data.frame(d4[,1:12],x8="-",d4$sentence)
dns<-c("token","cat","lemma","sentence_temp","speaker","x1","x2","x3","x4","x5","x6","x7","x8","sentence")
colnames(d4)<-dns
#write.csv(d4,"sesDB001.csv")     
#d4$sentence<-sp_sentence
#d4$sentence_cn<-sp_sentence_cn
dim(d3)
return(data.frame(d4))
} # end preprocess
###### wks.
d3<-data.frame(d2)

d2<-preprocess_temp(d1)
#d2<-d4
d3<-cleandb(d2)

##########
#reorder
print(d3[19,])
colnames(d3)
d4<-data.frame(d3$speaker,d3$token,d3$lemma,d3$sentence,d3$cat,d3$x1,d3$x2,d3$x3,d3$x4,d3$x5,d3$x6,d3$x7,d3$x8,d3$gilt)
dns<-c("speaker","token","lemma","sentence","cat","x1","x2","x3","x4","x5","x6","x7","x8","gilt")
colnames(d4)<-dns
colnames(d4)
# getdata<-function(){
#src<-paste(datadir,"sesDB002.csv",sep = "/")
#d<-read.csv(src,sep = ";")
#d$pos.check.OK<-0
#d4<-d
# d$pos_cpt<-paste(d4$function.,d4$case,d4$num,d4$gender,d4$mode,d4$X,sep = "-")
# dns<-c("id","speaker","token","lemma","pos","pos.check.OK","funct","cat","case","pers","num","gender","tense","mode","snr","sentence","pos_cpt")
# d4<-d
# #data.frame(dns[7:14])
# ma<-matrix(dns[7:14],ncol = 8)
# d5<-cbind(d4[,1:6],ma,d4[,13:15])
# colnames(d5)<-dns
# d5[,7:14]<-""
# d3<-d5
# #dns<-c("id","speaker","token","lemma","pos","pos.check.OK","funct","cat","case","pers","num","gender","mode","snr","sentence","pos_cpt")
# }
# 
# #d3<-getdata()
# #d4<-d3
# #d5<-cbind(d4[,1:12],"fun",d4[,13:15])
# #colnames(d5)<-dns
# #ds<-d5
# #d5<-d3
# 
#7:12
#s1<-d5$pos_cpt[18]
#correct POS tag
#k<-5
#d4<-d3
#d5<-insert(d5[1,],13,"fun")
#### new
get_pos<-function(set,set0){
d4<-set
dns[7:14]
ann<-data.frame(stri_split_fixed(set0$cat,".",simplify = T))
ns_g<-list()

ns_g[[1]]<-unique(ann$X1)
ns_g
ns_g[[2]]<-unique(ann$X2)
ns_g[[3]]<-unique(ann$X3)
ns_g[[4]]<-unique(ann$X4)
ns_g[[5]]<-unique(ann$X5)
ns_g[[6]]<-unique(ann$X6)
ns_g[[7]]<-unique(ann$X7)
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
return(ns_g2)
} # end get_pos

ns_g2<-get_pos(d4,d1)
##################

#k<-5
d5<-d3
r<-21
#PoS CORRECTION LOOP
#for (k in 1:length(d4$id)){
ma<-array()
s3<-"-"
s4<-s2
s4<-array()
la<-length(ns_g2$cor)
sx<-getarray(12)
######################
getarray<-function(set,r){
d5<-set
#s1<-d5$pos_cpt[r]
s1<-d4$cat[r]
#s1<-d4$cat[119]

s1
mxcolumns<-grep("x",colnames(d4))
s2<-stri_split_regex(s1,"\\.",simplify = T)
a<-c(s2)
s2<-a
rstar<-match(s2,"*")
s2[rstar==T]<-"-"
print(s2)
return(s2)
}
getarray(d4,21)
# for (top in 1:length(s2)){
# top_sub<-top_array(s2,top)
# }
# top<-2
#############################
# NEW:
# get codes cpt, grep value of useable values in code, output to useable value standard position
#d5<-getdata()
d5<-d4
#r<-11
#top<-5
d6<-d5
#ma<-array()
#s2
#d6<-matrix(nrow = length(d5$id),ncol = 8)
top<-1
l<-2
for (r in 1:length(d5$cat)){
#s2<- d5$pos_cpt[r]
s2<-getarray(d4,r)
for (top in 1:length(ns_g2$cor)){
for (l in 1:length(ns_g2$cor[[top]])){
m1<-match(ns_g2$cor[[top]][[l]],s2)
#s2[m1]
mxcolumns<-grep("x",colnames(d4))

pos<-mxcolumns[1]-1+top
ifelse (m1!=0,d6[r,pos]<-s2[m1],d6[r,pos]<-"-")
print(s2)
}
}
#d6[pos,1:8]<-ma
}
head(d6)
#finalise
write.csv(d6,"sesDB006.csv")
#wks.
##################################################


#### end getarray FALSE#########
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
