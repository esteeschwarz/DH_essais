#13407.hu-lx reformatting
#20221007(20.35)
#20221015(18.12) please download the most recent version of the script always
#here: https://github.com/esteeschwarz/DH_essais/blob/main/sections/HU-LX/20221015_transcript_chat_preprocessing(R-script).R
################
library(R.utils)
#mini
setwd("~/boxHKW/21S/DH/local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text")
#lapsi, ewa
setwd("~/boxHKW/UNI/21S/DH/")

getms<-function(){
  rn1<-"(#9semantics#)|(#9semantics)"
  rp1<-"%NSS: nonstandard semantics:"
  rn2<-"#9nst agmt.?#"
  rp2<-"%NSA: nonstandard agreement:"
  rn3<-"(#9nst prep#)|(#9nst prep\\.)"
  rp3<-"%NSP: nonstandard preposition:"
  rn4<-"(#90 art#)|(#90 art)|(#90 art\\.)(#90 art\.#)"
  rp4<-"%0-A: ZERO article:"
  rn5<-"#90 obj.?#"
  rp5<-"%0-O: ZERO object:"
  rn6<-"#check tape#"
  rp6<-"%COM: check tape"
  rn7<-"#.achen#"
  rp7<-"%COM: Lachen"
  rn8<-"#9nst#"
  rp8<-"%NST: nonstandard:"
  rn9<-"(#90 subj#)|(#90 subj)"
  rp9<-"%0-S: ZERO subject:"
  rn10<-"(#.?unclear script#)|(#script unclear#)"
  rp10<-"%COM: script unclear"
  rn11<-"#unverstaendlich#"
  rp11<-"%COM: unverstaendlich"
  rn12<-"#9nst verb#"
  rp12<-"%NSV: nonstandard verbform:"
  #rn13<-"#script unclear#"
  #rp13<-"%COM: script unclear"
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
  rp21<-"%0-V: ZERO VP"
  #rn22<-"#90 subj"
  #rp22<-"%0-S: ZERO subject:"
  rn23<-"#90 prep#"
  rp23<-"%0-P: ZERO preposition"
  #rn24<-"#9semantics"
  #rp24<-"%NSS: nonstandard semantics:"
  rncpt<-c(rn1,rn2,rn3,rn4,rn5,rn6,rn7,rn8,rn9,rn10,rn11,rn12,rn14,rn15,rn16,rn17,rn18,rn19,rn20,rn21,rn23)
  rpcpt<-c(rp1,rp2,rp3,rp4,rp5,rp6,rp7,rp8,rp9,rp10,rp11,rp12,rp14,rp15,rp16,rp17,rp18,rp19,rp20,rp21,rp23)
  rpall<-cbind(rncpt,rpcpt)
}
dirtext<-paste0(getwd(),"/local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text/")
list.files(paste0(getwd(),"/local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text/"))
#tbu<-readLines("local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text/SES_TUR_Tbu_m_13.txt")
gcc<-readLines(paste0(getwd(),"/local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text/SES_ELL_GCC_f_9.txt"))
list.files(dirtext)
###
rpall<-getms()
f<-1
dirmod
filelist
filelist<-list.files(dirmod,pattern="(\\.txt)")

#from here substitute #coding#
for (f in 1:length(filelist)){
tbu<-readLines(paste0(dirmod,filelist[f]))
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
 kids<-strsplit(filelist,"\\.")
 kids[[2]][1]
 dirtext
dirchat<-"CHAT_3/"
 dir.create(paste0(dirtext,dirchat))
 chatfilename<-paste0(kids[[f]][1],"_CHAT.txt")
rn25<-"([0-9]{1,3}\\. )(?=\\*|@)"
tbum<-gsub(rn25,"",tbu,perl = T)

writeLines(tbum,paste0(dirtext,dirchat,chatfilename))

}
paste0(dirchat,kids[[f]][1],"_CHAT.txt")
paste0(dirtext,dirchat,chatfilename)
#file.info(filelist[1])
###wks.
#remove hardcoded linenumbers in some transcripts
temp<-function(){
rn25<-"([0-9]{1,3}\\. )(?=\\*|@)"
tbu<-readLines((filelist[2]))
m<-gregexec(rn26,tbum,perl = T)
regmatches(tbum,m)
tbum<-gsub(rn25,"",tbu,perl = T)
tbum
}
library(readtext)
#loop correction
k<-16
filelist[k]
linecor<-function(k){
cc<-readtext(paste0(dirtext,filelist[k]))
cc1<-cc$text
#library(clipr)
dirmod<-paste0(dirtext,"modified/")
#find obsolete whitespace
regx1<-"[ ]{2,200}"
repl1<-" "
cc1<-gsub(regx1,repl1,cc1)
writeLines(cc1,paste0(dirtext,"/r-temp/da1.txt"))

#find lines not properly introduced (false hard line breaks)
regx1<-"\n"
#write_clip(cc2)
repl1<-"#nl#"
cc2<-gsub(regx1,repl1,cc1)
cc2
writeLines(cc2,paste0(dirtext,"/r-temp/bu2.txt"))
#"#nl#[^@|\*]" #newline not introduced by @ or * (trans not linenumbered)
#newlines
#"(#nl#)([^0-9]{1,3})"
#restore newline in not numbered scripts:
regx1<-"#nl#(?=(@|[0-9]{1,3}|\\*))"
repl1<-"\n"
m<-gregexec(regx1,cc2,perl = T)
regmatches(cc2,m)
cc2b<-gsub(regx1,repl1,cc2,perl = T)
writeLines(cc2b,paste0(dirtext,"/r-temp/bu2.txt"))
cc2b
#"(#nl#)(@|[0-9]{1,3}|\*)"
#only for linenumbered transcripts
#regx1<-"(#nl#)(?=[^@|[^0-9])" #remove newline not introduced by @ or line numbering

regx1<-"(#nl#)(?=[^@|[^0-9]|[^\\*])" #newline not introduced by @ or line numbering
repl1<-" "
cc3<-gsub(regx1,repl1,cc2b,perl = T)
writeLines(cc3,paste0(dirtext,"/r-temp/bu2.txt"))

#restore linebreaks
regx1<-"#nl#"
repl1<-"\n"
cc4<-gsub(regx1,repl1,cc3)
writeLines(cc4,paste0(dirtext,"/r-temp/da4.txt"))

#wks.
#dirmod<-paste0(dirtext,"modified/")
#writeLines(cc5,paste0(dirmod,"SES_ELL_GCC_f_9.txt"))
#delete hard line numbering
regx1<-"[0-9]{1,3}.[^\n](\\*)"
repl1<-"\\1"
cc5<-gsub(regx1,repl1,cc4)
#writeLines(cc5,paste0(dirtext,"/r-temp/cc5.txt"))
corfilename<-paste0(kids[[k]][1],"_cor.txt")
writeLines(cc5,paste0(dirmod,corfilename))
corfilename
paste0(dirmod,corfilename)
#"~/boxHKW/UNI/21S/DH/local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text/modified"
dirmod
#dirtext
#cc5
}
for (k in 1:length(filelist)){
linecor(16)
}
#wks.
#vs search unlabeled lines
#"^\*[^A-Z]"




