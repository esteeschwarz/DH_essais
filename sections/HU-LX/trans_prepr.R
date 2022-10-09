#13407.hu-lx reformatting
#20221007(20.35)
################
library(R.utils)
setwd("~/boxHKW/21S/DH/local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text")
getms<-function(){
  rn1<-"#9semantics#"
  rp1<-"%NSS: nonstandard semantics:"
  rn2<-"#9nst agmt.?#"
  rp2<-"%NSA: nonstandard agreement:"
  rn3<-"#9nst prep#"
  rp3<-"%NSP: nonstandard preposition:"
  rn4<-"#90 art#"
  rp4<-"%0-A: ZERO article:"
  rn5<-"#90 obj.?#"
  rp5<-"%0-O: ZERO object:"
  rn6<-"#check tape#"
  rp6<-"%COM: check tape"
  rn7<-"#.achen#"
  rp7<-"%COM: Lachen"
  rn8<-"#9nst#"
  rp8<-"%NST: nonstandard:"
  rn9<-"#90 subj#"
  rp9<-"%0-S: ZERO subject:"
  rn10<-"#.?unclear script#"
  rp10<-"%COM: script unclear"
  rn11<-"#unverstaendlich#"
  rp11<-"%COM: unverstaendlich"
  rn12<-"#9nst verb#"
  rp12<-"%NSV: nonstandard verbform:"
  rn13<-"#script unclear#"
  rp13<-"%COM: script unclear"
  rn14<-"#9nst conditional#"
  rp14<-"%NSC: nonstandard conditional:"
  rn15<-"#9nst gen#"
  rp15<-"%NSG: nonstandard genus:"
  rn16<-"#9nst pers#"
  rp16<-"%NSP: nonstandard person:"
  rn17<-"#9no pl/num#"
  rp17<-"%NSP: no plural/numeral:"
  rn18<-"#9nst compar\\.#"
  rp18<-"%NSR: nonstandard comparison"
  rn19<-"#9misunderstand#"
  rp19<-"%NSM: misunderstanding"
  rn20<-"#9nst w\\.o\\.#"
  rp20<-"%NSW: nonstandard word order"
  rn21<-"#90 verb#"
  rp21<-"0-V: ZERO VP"
  rn22<-"#90 subj"
  rp22<-"%0-S: ZERO subject:"
  rn23<-"#90 prep#"
  rp23<-"%0-P: ZERO preposition"
  rn24<-"#9semantics"
  rp24<-"%NSS: nonstandard semantics:"
  rncpt<-c(rn1,rn2,rn3,rn4,rn5,rn6,rn7,rn8,rn9,rn10,rn11,rn12,rn13,rn14,rn15,rn16,rn17,rn18,rn19,rn20,rn21,rn22,rn23,rn24)
  rpcpt<-c(rp1,rp2,rp3,rp4,rp5,rp6,rp7,rp8,rp9,rp10,rp11,rp12,rp13,rp14,rp15,rp16,rp17,rp18,rp19,rp20,rp21,rp22,rp23,rp24)
  rpall<-cbind(rncpt,rpcpt)
}

#tbu<-readLines("local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text/SES_TUR_Tbu_m_13.txt")

###
# rnss<-"(#9semantics#)"
# m<-gregexec(rnss,tbu)
# regmatches(tbu, m)
# 
# tbu
# match(tbu)
# m<-grep(rnss,tbu)
# #m<-(grepl(rnss,tbu))
# tbu[m]
# sum(m)
# tbu[m+1]<-"%NSS: #9semantics#"
# tbu[m+1]
# dim(m)
# m
# 
# rna<-"(#9nst agmt#)"
# n<-grep(rna,tbu)
# tbu[n]
# tbu[n+1]<-"%NSA: nonstandard agreement:"
# tbu[n+1]
# m<-grep(rna,tbu)
# tbu[m]
# rncpt<-c(sprintf("rn%d",1:17))
# rn3<-c(as.array (rncpt))
# as.character.factor (rncpt)
# print(as.name(rncpt[3]))
# rna<-"(#.+?#)"
#m<-grep(rna,tbu)
#tbu[m]

#rncpt[3]
#k<-1
########
# for (k in 1:length(rpall[,"rncpt"])) {
#   m<-grep(rpall[k,"rncpt"],tbu)
# tbu<-insert(tbu,m+1,rpall[k,"rpcpt"])
# #tbu
# 
# }
# length(rpall[,"rncpt"])
# tbu
# for (k in 1:length(rpall[,"rncpt"])) {
#   tbu<-gsub(rpall[k,"rncpt"],"#%#",tbu)
#   #tbu<-gsub
#   # m<-grep(rpall[k,"rncpt"],tbu)
#   # tbu<-insert(tbu,m+1,rpall[k,"rpcpt"])
#   # #tbu
#   # 
# }  
# tbu
############### wks.
# 1:length(rpall[rncpt])
# rpall[4,rncpt]
# tbu
#writeLines(tbu,"local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text/SES_TUR_Tbu_m_13_CHAT.txt")
# m<-grep(rpall[1,"rncpt"],tbu)
# m
# ar<-c(2,4,6,8)
# x<-1:20
# for(k in ar){
# insert(x,ar+k,"a")
# }
#   x
# ar[2]
# length(ar)
#        for (k in 1:length(rpall[rncpt])){
#  # print(rpall[k,"rncpt"])
#   m<-grep(rpall[k,"rncpt"],tbu)
#   #print(tbu[m])
#   print(tbu[m+1])
#   }
# 
# tail(tbu)
# for (k in 4){
#   print(k)
#         }
# x2<-insert(x,ar+1,99)
# x2

#dir.create("local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text/CHAT")
rpall<-getms()
f<-1
filelist<-list.files(pattern="(\\.txt)")
for (f in 1:length(filelist)){
tbu<-readLines(filelist[f])
#tbu
p<-grep("@.oding",tbu)
tbu<-insert(tbu,p+1,"@TIER descriptions:")
for (k in 1:length(rpall[,1])) {
  m<-grep(rpall[k,"rncpt"],tbu)
  
  m<-insert(m,1,p+1)
  tbu<-insert(tbu,m+1,unique(rpall[k,"rpcpt"]))
}
for (k in 1:length(rpall[,"rncpt"])) {
  tbu<-gsub(rpall[k,"rncpt"],"#%#",tbu)
}
# kids<-strsplit(filelist,"\\.")
# kids[[2]][1]
chatfilename<-paste0("CHAT_2/",kids[[f]][1],"_CHAT.txt")
writeLines(tbu,chatfilename)
}
file.info(filelist[1])
