#13407.hu-lx reformatting
#20221007(20.35)
################
tbu<-readLines("~/boxHKW/UNI/21S/DH/local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text/SES_TUR_Tbu_m_13.txt")

###
rnss<-"(#9semantics#)"
m<-gregexec(rnss,tbu)
regmatches(tbu, m)

tbu
match(tbu)
m<-grep(rnss,tbu)
#m<-(grepl(rnss,tbu))
tbu[m]
sum(m)
tbu[m+1]<-"%NSS: #9semantics#"
tbu[m+1]
dim(m)
m

rna<-"(#9nst agmt#)"
n<-grep(rna,tbu)
tbu[n]
tbu[n+1]<-"%NSA: nonstandard agreement:"
tbu[n+1]
m<-grep(rna,tbu)
tbu[m]
getms<-function(){
rn1<-"#9semantics#"
rp1<-"%NSS: nonstandard semantics:"
rn2<-"#9nst agmt#"
rp2<-"%NSA: nonstandard egreement:"
rn3<-"#9nst prep#"
rp3<-"%NSP: nonstandard preposition:"
rn4<-"#90 art#"
rp4<-"%0-A: 0 article:"
rn5<-"#90 obj#"
rp5<-"%0-O: 0 object:"
rn6<-"#check tape#"
rp6<-"COM: check tape"
rn7<-"#.achen#"
rp7<-"%COM: Lachen"
rn8<-"#9nst#"
rp8<-"%NST: nonstandard:"
rn9<-"#90 subj#"
rp9<-"0-S: 0 subject:"
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
rn17<-"#9 no pl/num#"
rp17<-"%NSP: no plural/numeral:"
rncpt<-c(rn1,rn2,rn3,rn4,rn5,rn6,rn7,rn8,rn9,rn10,rn11,rn12,rn13,rn14,rn15,rn16,rn17)
rpcpt<-c(rp1,rp2,rp3,rp4,rp5,rp6,rp7,rp8,rp9,rp10,rp11,rp12,rp13,rp14,rp15,rp16,rp17)
rpall<-cbind(rncpt,rpcpt)
}
# rncpt<-c(sprintf("rn%d",1:17))
# rn3<-c(as.array (rncpt))
# as.character.factor (rncpt)
# print(as.name(rncpt[3]))
# rna<-"(#.+?#)"
#m<-grep(rna,tbu)
#tbu[m]

rncpt[3]
rpall<-getms()
for (k in 1:17) {
  m<-grep(rpall[k,"rncpt"],tbu)
  #tbu[m]
 #append(tbu,rpall[k,"rpcpt"],m)
insert(tbu,m+1,rpall[k,"rpcpt"])
  }  
1:length(rpall[rncpt])
rpall[4,rncpt]
tbu
m<-grep(rpall[1,"rncpt"],tbu)
m
ar<-c(2,4,6,8)
for(k in 1:length(ar)){
x<-insert(1:20,ar+k,5)
}
  x
ar[2]
       for (k in 1:length(rpall[rncpt])){
 # print(rpall[k,"rncpt"])
  m<-grep(rpall[k,"rncpt"],tbu)
  #print(tbu[m])
  print(tbu[m+1])
  }

tail(tbu)
library(R.utils)
for (k in 1:4){
  print(k)
        }
}