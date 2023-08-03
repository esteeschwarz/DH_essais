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

#list.files(datadir)
d1<-read_delim("ses_vert.csv")

#set<-d2
cleandb<-function(set){
  #set
  # delete <g/>, <s>, </s> rows
  # grep
  regx1<-"(<g/>)"
  regx2<-"(<s>)"
  regx3<-"(</s>)"
 # regx4<-"#|%|:" # NOT! exludes tokens including, e.g. #Ioanina
  m1<-grep(regx1,set$token)
  m2<-grep(regx2,set$token)
  m3<-grep(regx3,set$token)
 # m4<-grep(regx4,set$token)
  # exclude
  ex<-c(m1,m2,m3)
  set$gilt<-T
  set$gilt[ex]<-F
  #exin<-match(ex,set$X.1)
  d2<-subset(set,set$gilt==T)
}

#d3<-cleandb(d2)
#d<-d1
#set<-d1
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
#library(stringi)
  
#ann<-data.frame(stri_split_fixed(d$cat,".",simplify = T))
#anns<-c("")
#ann<-c(rep("-",8))
d3<-cbind(d,"-","-","-","-","-","-","-","-","-") # 9 empty POS columns
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
d4<-data.frame(d4[,1:12],x8="-",x9="-",d4$sentence)
dns<-c("token","cat","lemma","sentence_temp","speaker","x1","x2","x3","x4","x5","x6","x7","x8","x9","sentence")
colnames(d4)<-dns
#write.csv(d4,"sesDB001.csv")     
#d4$sentence<-sp_sentence
#d4$sentence_cn<-sp_sentence_cn
dim(d3)
return(data.frame(d4))
} # end preprocess
###### wks.
#d3<-data.frame(d2)
#######################
#######################
#######################
d2<-preprocess_temp(d1)
#d2<-d4
d3<-cleandb(d2)

#######################
#######################
#######################
#reorder
#print(d3[19,])
colnames(d3)
d4<-data.frame(d3$speaker,d3$token,d3$lemma,d3$sentence,d3$cat,d3$x1,d3$x2,d3$x3,d3$x4,d3$x5,d3$x6,d3$x7,d3$x8,d3$x9,d3$gilt)
dns<-c("speaker","token","lemma","sentence","cat","x1","x2","x3","x4","x5","x6","x7","x8","x9","gilt")
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
#set0<-d4
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
ns_g2[["cor"]][["pos"]]<-ns_g[[1]]
ns_g2[["cor"]][["cat"]]<-c("Name","Inter","Full","Pers","Pun","Reg","Aux","Dem","Def","Neg","Pos",
                           "Indef","Ans","Paren","Coord","Sup","SubFin","Poss","Rel","Mod","Comp",
                           "Verb","Refl","Zu","Deg","Other","SubInf","Gen","Adj","Noun")
ns_g2[["cor"]][["funct"]]<-c("Comma","Slash","Hyph","Aster","Subst","Sent","Left","Right","Psp","Attr","XY","Auth")
ns_g2[["cor"]][["case"]]<-c("Nom","Gen","Dat","Acc")
ns_g2[["cor"]][["pers"]]<-c(1,2,3)
ns_g2[["cor"]][["num"]]<-c("Sg","Pl")
ns_g2[["cor"]][["gender"]]<-c("Neut","Fem","Masc")
ns_g2[["cor"]][["tense"]]<-c("Pres","Past","Cont")
ns_g2[["cor"]][["mode"]]<-c("Ind","Subj") #"Subj" == conditional
return(ns_g2)
# its 9 fields! not 8
# TODO: c("zu","Auth","Sent","Psp","Cont")
} # end get_pos

ns_g2<-get_pos(d4,d1)
##################

#k<-5
# d5<-d3
# r<-21
#PoS CORRECTION LOOP
#for (k in 1:length(d4$id)){
# ma<-array()
# s3<-"-"
# s4<-s2
# s4<-array()
# la<-length(ns_g2$cor)
# sx<-getarray(12)
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
#getarray(d4,21)
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
#top<-1
#l<-2
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
#cat("check token: [",r,"], tag = ",d6[r,],"\n")
#print(d6[r,])
print(r)
}
}
#d6[pos,1:8]<-ma
} # end POS position correction
head(d6)
d6safe<-d6
###### finalise
colnames(d6)

dns_x<-c("pos","category","funct","case","pers","num","gender","tense","mode")
mxcolumns<-grep("x",colnames(d6))
dns_o<-colnames(d6)
pos_ok<-"PoS_ok_check"
dns_n<-c(dns_o[1:5],pos_ok,dns_x,dns_o[length(dns_o)])
dns_o
dns_n
d7<-data.frame(d6$speaker,d6$token,d6$lemma,d6$sentence,d6$cat,PoS_ok_check=1,d6$x1,d6$x2,d6$x3,d6$x4,d6$x5,d6$x6,d6$x7,d6$x8,d6$x9,d6$gilt)
head(d7)
# dns_n<-c(1:length(dns_o))
# dns_n[1:mxcolumns[1]-1]<-dns_o[1:mxcolumns[1]-1]
# dns_n[mxcolumns[1]:mxcolumns[length(mxcolumns)]]<-dns_x
# dns_n[mxcolumns[length(mxcolumns)]+1]<-
#   dns_o[mxcolumns[length(mxcolumns)]+1:length(dns_o)]
# dns_n[mxcolumns[1]:mxcolumns[length(mxcolumns)]]<-dns_x
#d7<-d6
dns_n
colnames(d7)<-dns_n
#### post processing ##########################
# reread DB
#d7
m1<-grep("(sansHiCod)",d7$token)
d7$token[m1[3]]
m4<-grep("(</sansHiCod)",d7$token) #transcript end
# d7$token[m2[1]]
m3<-grep("(<sansHiCod id)",d7$token) #transcript start
m5<-grep("(SES_.*)(sketchE)",d7$token,value = T)
#m5<-grepl("(SES_.*)(sketchE)",d7$token)
m6<-gsub(".*(SES_.*)(_sketchE).*","\\1",m5) #kids
d8<-d7

# m6
 k<-1
 r<-1
 l<-1
 # first define 0 values to columns!
 d8$interview<-0
 d8$part_L1<-0
 d8$part_gender<-0
 d8$part_age<-0
 
for (l in 1:length(m6)){
  li<-array()
  #repl<-0
  for (k in 1:length(m3)){
    li<-m3[k]:m4[k] # define array of interview according to match start/end
    repl<-m6[k] # transcript name in array
    print(repl)
    typeof(repl)
    length(repl)
    ### 4. add participant metadata for analysis
    m1<-stri_split_fixed(repl,"_",simplify = T)
    d8$interview[li]<-m1[2]
    m2<-stri_split_boundaries(m1[,2],type="character",simplify = T)
    d8$part_L1[li]<-m2[1]
    d8$part_gender[li]<-m1[3]
    d8$part_age[li]<-m1[4]
    #}
  }
  
}
 # wks., check:
   d8$interview[2750:3400]
   ##############
   # delete transcript references obsolete entries
   m<-grepl("(sansHiCod)",d8$token)
   d8$speaker[m]<-"---"
   d8$lemma[m]<-"---"
   d8$sentence[m]<-"---"
   d8$cat[m]<-"---"
   d8$PoS_ok_check[m]<-"---"
   d8$pos[m]<-"---"
   d8$category[m]<-"---"
   d8$funct[m]<-"---"
   d8$case[m]<-"---"
   d8$pers[m]<-"---"
   d8$num[m]<-"---"
   d8$gender[m]<-"---"
   d8$tense[m]<-"---"
   d8$mode[m]<-"---"
   d8$gilt[m]<-"---"
   #m_end_c[r]<-m  
   tail(d8)
   lemma_a<-stri_split_boundaries(d8$lemma,type="word")
   ll<-list()
   x<-lapply(lemma_a,unlist)
         for (k in 1:length(d8$lemma)){
     ll[k]<-x[[k]][1]
   }
   lemmalist<-unlist(ll)
   m<-grep("[^A-Za-z]",lemmalist)
   lemmalist[m]<-""
   #lemma_c<-gsub("[^A-Za-z]","",d8$lemma)
   #length(lemmalist)
   #lemmalist[7]
   d8$lemma_c<-lemmalist
   #   x<-lemma_a[[1:length(d8$lemma)]][1]
   # c<-c(1:10)
   #    d8$lemma_c[1:length(d8$lemma),]<-lemma_a[[1:length(d8$lemma),]][1]

      
   #    
   #       write.csv(d8,"20230111(14.15)_SES_database_by_tokens+PoS_check_column.csv")
   # write.csv(d8,"sesDB008.csv")
   #wks.
   
    #tail(d8$interview)
##############################
   ############## TODO:
   # add coded feature columns
   ms2<-grep("(#[A-Z]{3})",d8$sentence,value = T) #speaker lines #"(#[A-Z]{3})" = 4942 matches in raw data
   spk<-unique(ms2)
   spk_array<-c("GCB","GCC","GDA","GDB","GDC","GDD","GDE","GDF","TAD","TAH","TAI","TBD","TBE","TBS","TBT","TBU","TBV","INT")
   spk_array2<-paste0("#",spk_array)
   #spk_grep<-paste0(spk_array2,"|")
   spk_grep2<-paste0(spk_array2,collapse = "|")
   spk_grep3<-paste0("(",spk_grep2,")")
   spk_grep3
   #ms3<-grep(spk_grep3,d$token) #speaker lines #"(#[A-Z]{3})" = 4942 matches in raw data
   #spk
   # grep codes
   grepc<-paste0("(")
   ms4<-grep("(#[A-Z]{3})",d8$sentence,value = T)
   # simple: delete speaker codes in sentence to grep only coded features
   sent1<-gsub(spk_grep3,"%000%",d8$sentence)
   sent1[3000]
   ms5<-grep("(#[A-Z]{3,3}|0[A-Z]{1,2})",sent1)
ms6<-head(unique(ms5))
ms6
# x<-ms6
# codec<-function(x){x+10}
# l<-c(1,2,3,4,5)   
# lapply(l,codec)
codef<-function(x) stri_extract_all_regex(x,"(#[A-Z]{3})")
   #ms7<-lapply(ms6, codef)
   ms7<-lapply(sent1, codef)
  # unlist(head(ms7[ms5][]))
   d8[,22:34]<-"---"
   #codem<-matrix(ms7[ms5])
   r<-115
   repl<-unlist(ms7[[r]])
   for (r in 1:length(sent1)){
     repl<-unlist(ms7[[r]])
     l<-length(repl)
     le<-22+l-1
     d8[r,22:le]<-repl
   }
   ms8<-grep("([A-Z]{3,3})",sent1,value=T)
   ms8<-grepl("([A-Z]{3,3})",sent1)
#   head(ms7[ms5][][])
#   unique(sent1[ms8])
#   sent1[95]
   # 13024.
mna<-is.na(d8[])
d8[mna]<-"---"
lns<-length(d8[1,])-22
dns_code<-paste0("C",1:lns)
colnames(d8)[22:37]<-dns_code
# TODO: sort columns priority
# sentence preceding interviewer line
# transcript lines references column, thus numbering lines in transkript
###
#################
# preceding line:
###
#d<-d8
postprocess_precede<-function(set){
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
  #spk
  # try put column with flowing speaker declaration
  sp_d<-array()
  sp_ds<-array()
  sp_sentence_nr<-array()
  sp_sentence<-array()
  sp_sentence_cn<-array()
  sp_s_cn<-array()
  #k<-25
  ms<-ms3
  #d$sentence_temp<-"---"
  #d$speaker<-"---"
  d$line_precede<-""
  k<-2
  ### output sentence
  for (k in 1:length(ms)){
   # sp_sentence_cn<-array()
    sp_precede<-array()
    sp_s<-ms[k]
    sp_p1<-ms[k]
    
    if (k<=length(ms))
      sp_e<-ms[k+1]-1
    if (k==length(ms))
      sp_e<-length(d$token)
    sp_p2<-ms[k+1]-1
    spk_c<-d$speaker[sp_s]
    if (spk_c!="#INT"){
    line_precede<-d$sentence[sp_s-1]
    }
    d$line_precede[sp_s:sp_e]<-line_precede
    #sp_s_cn<-paste(d$token[sp_s:sp_e],collapse = " ")
    #d$sentence_temp[sp_s:sp_e]<-sp_s_cn
    #d$speaker[sp_s:sp_e]<-sp_ns  
  } #end sentence loop
  ################ wks.
  #library(stringi)
  d$line_precede[d$speaker=="#INT"]<-""
  
  return(d)
} # end preprocess_precede
#check column
#d$checkline<-d$sentence
#apply:
d9<-postprocess_precede(d8)
d8$lemma_c<-""
write.csv(d9,"20230111(19.46)_SES_database_by_tokens+PoS_check_column.csv")
write.csv(d9,"sesDB009.csv")
#typeof(lemmalist)
##############################################################################
# DB created above, read DB from .csv to make queries and concordances
# 
##############################################################################
# queries ######################
#d8<-read.csv("sesDB007.csv")
#sampleq$id[k]
#query[1,1]
#k<-1
q_sub<-function(set,k,query){
  #m1<-set
  #set<-d7
  m1<-set
 # colnames(m1)
 # m1<-subset(set,grepl(query$id[k],set[,1]))
  m2<-subset(m1,grepl(query$speaker[k],m1$speaker)) ### NOT with logical but grep, match etc.
  ifelse(query$token!="",
  m3<-subset(m2,query$token[k]==m2$token),
  m3<-subset(m2,grepl(query$token[k],m2$token)))
  m4<-subset(m3,grepl(query$lemma[k],m3$lemma))
  m5<-subset(m4,grepl(query$pos[k],m4$pos))
 # m6<-subset(m5,grepl(query$pos.check.OK[k],m5[,6]))
  m7<-subset(m5,grepl(query$funct[k],m5$funct))
  m8<-subset(m7,grepl(query$case[k],m7$case))
  m9<-subset(m8,grepl(query$num[k],m8$num))
  m10<-subset(m9,grepl(query$gender[k],m9$gender))
  m11<-subset(m10,grepl(query$mode[k],m10$mode))
  m12<-subset(m11,grepl(query$regex[k],m11$sentence))
  m13<-subset(m12,grepl(query$tense[k],m12$tense))
  m14<-subset(m13,grepl(query$pers[k],m13$pers))
  m15<-subset(m14,grepl(query$category[k],m14$category))
#  m16<-subset(m15,grepl(query$tense[k],m12$tense))
  }
# RUN: #############
#query declaration:
tempfun_query<-function(){
sampleq<-data.frame(speaker=0,token=0,lemma=0,category=0,pos=0,funct=0,case=0,pers=0,num=0,gender=0,tense=0,mode=0,regex=0)
#sampleq$id<-          ".*"
sampleq$speaker<-     "#TBU"
sampleq$token<-       ""    # has to be empty or exact match, not ".*" for empty
sampleq$lemma<-       ".*"
sampleq$category<-          ".*"
sampleq$pos<-         ".*"
#sampleq$pos.check.OK<-".*"
sampleq$funct<-       ".*"
sampleq$case<-        "Gen"
sampleq$num<-         ".*"
sampleq$pers<-        ".*"
sampleq$gender<-      ".*"
sampleq$tense<-        ".*"
sampleq$mode<-        ".*"
#sampleq$X<-           ".*"
#sampleq$snr<-         ".*"
sampleq$regex<-       ".*" # is searched for in $sentence
####################
query<-sampleq
#query$
m2<-q_sub(d7,1,query)
#set$sentence[m2]
####################
# OUTPUT:
unique(m2$sentence)
m2$token
m2
##### other method subscript
}
##############################################################################
# now concordances for kids:
# 
#d8<-read.csv()
d9<-d8
# unique tokens subsets after kids
subc_int<-function(set,kid){
  d9<-set
  m1<-subset(d9,d9$interview==kid&gilt==T)
  }
subc_kids<-function(set,kid){
  d9<-set
  m1<-subset(d9,d9$speaker==kid&gilt==T)
}

#GCB<-unique(subkids(d8,"#GCB")$token)
tchk<-length(subkids(d8,"#GCB")$token)
GCB<-subc_kids(d8,"GCB")
GCB_i<-subc_int(d8,"GCB")
library(quanteda)
cgcb<-corpus(unique(GCB$sentence))
#summary(c1)
c1_tokens <- tokens(cgcb)
kwic(c1_tokens, pattern = "der")
162-23
q1$from[1]
q1$pattern[1]
q1
print(c1_tokens[121])
# crosscheck with db
#d1<-read_delim("ses_vert.csv")
### sample great concordance list for GCB
GCB<-subc_kids(d8,"GCB")
GCB_i<-subc_int(d8,"GCB")
c1 <- tokens(cgcb)
to<-unique(GCB$token)
to
length(GCB$token)
t<-3
kidc1<-function(set,to){
kw<-list()
    for(t in 1:length(to)){
    c1<-corpus(unique(GCB$sentence))
    c2 <- tokens(c1)
    tns<-to[t]
    kw[[tns]][[t]]<-list(kwic(c2, pattern = to[t]))
      }
  return(kw)
  
}
GCB_c<-kidc1(GCB,t1)
