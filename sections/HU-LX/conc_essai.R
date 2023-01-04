#13015.HU-LX concordance essai
##############################
library(readr)
getwd()
d<-read_delim("ses_vert.csv")

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
dns<-c("speaker","token","lemma","pos","function","case","num","gender","mode","X","snr","sentence")
colnames(d4)<-dns
write.csv(d4,"sesDB001.csv")     
#d4$sentence<-sp_sentence
#d4$sentence_cn<-sp_sentence_cn
dim(d3)
###### wks.
# query:
quer<-function(){
query<-list(dns)
dn2<-array(dns)
q<-data.frame(dns)
q<-as.list(dns)
q<-as.data.frame(dns[1:10])
q1<-c("GCB",".*",".*",".*",".*",".*",".*",".*",".*",".*")
qm<-rbind(dns,q1)
qm<-data.frame(qm)
colnames(qm)<-dns
qm
q1
q1<-c("#GCB","der",".*",".*",".*",".*",".*",".*",".*",".*",".*",".*")
m1<-grep(q1,d4)

m1<-q1%in%d4
q2<-"der"

#d4<-data.frame(d4)
d4$sentence
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
q<-dns
m1<-d4
m<-1
query<-q1
q
q1<-c("#GCB","das","",".*",".*",".*",".*",".*",".*",".*",".*",".*")
q_sub<-function(set,q,query){
  #m1<-set
  set<-m1
    m1<-set[grep(query[1],set[,1]),]
    m2<-m1[grep(query[2],m1[,2]),] ### NOT with logical but grep, match etc.
    m3<-m2[grep(query[3],m2[,3]),]
    m4<-m3[grep(query[4],m3[,4]),]
    m5<-m4[grep(query[5],m4[,5]),]
    m6<-m5[grep(query[6],m5[,6]),]
    m7<-m6[grep(query[7],m6[,7]),]
    m8<-m7[grep(query[8],m7[,8]),]
    m9<-m8[grep(query[9],m8[,9]),]
    m10<-m9[grep(query[10],m9[,10]),]
    m11<-m10[grep(query[11],m10[,11]),]
    m12<-m11[grep(query[12],m11[,12]),]
    
  return(m12)
  
    }
  m2
  m1[,1][grep(query[1],m1[,1])]
length(m1$token)
length(m1[,"token"])
m2<-q_sub(m1,dns,q1)
d4$sentence[m2$snr]
m2$snr
q<-"token"
m1[,q[1]]
m2


