#13407.hu-lx reformatting
#20221007(20.35)
#20221015(18.12) please download the most recent version of the script always
#here: https://github.com/esteeschwarz/DH_essais/blob/main/sections/HU-LX/20221015_transcript_chat_preprocessing(R-script).R
#important: the script as provided in the box (.md instead of .R) will not work in R language
#since all escaped (e.g. "\\.") characters are converted to standard markdown ("\."),
#saying if you want to have the script run in R you have to use the github version.
#NT: script is now in .txt for convenient view
#also all source transcript files are referenced locally and are accessible only via your HU-box.
################
library(R.utils)
library(readtext)

#mini
#setwd("~/boxHKW/21S/DH/local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text")
#lapsi, ewa
setwd("~/boxHKW/UNI/21S/DH/")
dirtext<-paste0(getwd(),"/local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text")
list.files(dirtext)
#dirmod<-paste0(dirtext,"modified/")
dirmod<-dirtext #after manual regex modifying in VSCode
dirchat<-"CHAT_4"
dirtext
dirmod
dirout<-paste(dirtext,"out2",sep = "/")
dirout  
dir.create(dirout)

#create code substitution array with search/replace patterns
getms<-function(){
  rn01a<-"(#9semantics#)|(#9semantics)"
  rp01a<-"%NSS: nonstandard semantics:"
  rn02a<-"#9nst agmt.?#"
  rp02a<-"%NSA: nonstandard agreement:"
  rn03a<-"(#9nst prep#)|(#9nst prep\\.)"
  rp03a<-"%NSP: nonstandard preposition:"
  rn04b<-"(#90 art#)|(#90 art)|(#90 art\\.)|(#90 art\\.#)" # dash!
  rp04b<-"%0-A: zero article:"
  rn05b<-"#90 obj.?#"
  rp05b<-"%0-O: zero object:"
  rn06c<-"#check tape#"
  rp06c<-"%COM: check tape"
  rn07c<-"#.achen#"
  rp07c<-"%COM: laughter"
  rn08a<-"#9nst#"
  rp08a<-"%NST: nonstandard:"
  rn09b<-"(#90 subj#)|(#90 subj)"
  rp09b<-"%0-S: zero subject:"
  rn10c<-"(#.?unclear script#)|(#script unclear#)"
  rp10c<-"%COM: script unclear"
  rn11c<-"#unverstaendlich#"
  rp11c<-"%COM: unintelligible"
  rn12a<-"#9nst verb#"
  rp12a<-"%NSV: nonstandard verbform:"
  #rn13<-"#script unclear#"
  #rp13<-"%COM: script unclear"
  rn14a<-"#9nst conditional#"
  rp14a<-"%NSC: nonstandard conditional:"
  rn15a<-"(#9nst gen#)|(#9nst gen)"
  rp15a<-"%NSG: nonstandard genus:"
  rn16a<-"#9nst pers#"
  rp16a<-"%NSP: nonstandard person:"
  rn17b<-"#9no pl/num#"
  rp17b<-"%0-N: no plural/numeral marker:"
  rn18a<-"#9nst compar\\.#"
  rp18a<-"%NSR: nonstandard comparison:"
  rn19c<-"#9misunderstand#"
  rp19c<-"%COM: misunderstanding"
  rn20a<-"#9nst w\\.o\\.#"
  rp20a<-"%NSW: nonstandard word order:"
  rn21b<-"#90 verb#"
  rp21b<-"%0-V: zero VP:"
  #rn22<-"#90 subj"
  #rp22<-"%0-S: zero subject:"
  rn23b<-"(#90 prep#)|(#90 prep\\.#)"
  rp23b<-"%0-P: zero preposition:"
  #rn24<-"#9semantics"
  #rp24<-"%NSS: nonstandard semantics:"
  rn26b<-"#90 refl#"
  rp26b<-"%0-R: zero reflexive:"
  rn27e<-"#\\*#"
  rp27e<-"#*#: pause (inline)"
  rn28a<-"#9nst i.o.#"
  rp28a<-"%N-?: nonstandard i dont know"
  rn29a<-"#9rel#"
  rp29a<-"%N-?: nonstandard i dont know"
  rncpt<-c(rn01a,rn02a,rn03a,rn20a,rn12a,rn14a,rn15a,rn16a,rn18a,rn08a,rn28a,rn29a,rn04b,rn05b,rn09b,rn17b,rn21b,rn23b,rn26b,rn06c,rn10c,rn11c,rn19c,rn27e)
  rpcpt<-c(rp01a,rp02a,rp03a,rp20a,rp12a,rp14a,rp15a,rp16a,rp18a,rp08a,rp28a,rp29a,rp04b,rp05b,rp09b,rp17b,rp21b,rp23b,rp26b,rp06c,rp10c,rp11c,rp19c,rp27e)
  
    #rpcpt<-c(rp1,rp2,rp3,rp4,rp5,rp6,rp7,rp8,rp9,rp10,rp11,rp12,rp14,rp15,rp16,rp17,rp18,rp19,rp20,rp21,rp23)
  rpall<-cbind(rncpt,rpcpt)
}

#list.files(dirtext)
#search-replace array from which to read subsitutions
rpall<-getms()
#f<-1
#dirmod
#filelist
#filelist<-list.files(dirtext,pattern="(\\.txt)")
#filelist

#paste0(dirchat,"/",kids[[f]][1],"_CHAT.txt")
#paste(dirtext,dirchat,chatfilename,sep = "/")
#file.info(filelist[1])
###wks.

#remove hardcoded linenumbers in some transcripts
#loop correction
#k<-16
#filelist[k]


linecor<-function(k){
cc<-readtext(paste(dirtext,filelist[k],sep = "/"))
cc1<-cc$text
#library(clipr)
#find obsolete whitespace range 2 to 200 blanks
regx1<-"[ ]{2,200}"
repl1<-" "
cc1<-gsub(regx1,repl1,cc1)
#writeLines(cc1,paste0(dirtext,"/r-temp/da1.txt"))

#find lines not properly introduced (false hard line breaks)
regx1<-"\n"
#write_clip(cc2)
repl1<-"#nl#"
cc2<-gsub(regx1,repl1,cc1)
cc2
#writeLines(cc2,paste0(dirtext,"/r-temp/bu2.txt"))
#"#nl#[^@|\*]" #newline not introduced by @ or * (trans not linenumbered)
#newlines
#"(#nl#)([^0-9]{1,3})"
#restore newline in not numbered scripts:
regx1<-"#nl#(?=(@|[0-9]{1,3}|\\*))"
repl1<-"\n"
m<-gregexec(regx1,cc2,perl = T)
regmatches(cc2,m)
cc2b<-gsub(regx1,repl1,cc2,perl = T)
#writeLines(cc2b,paste0(dirtext,"/r-temp/bu2.txt"))
cc2b
#"(#nl#)(@|[0-9]{1,3}|\*)"
#only for linenumbered transcripts
#regx1<-"(#nl#)(?=[^@|[^0-9])" #remove newline not introduced by @ or line numbering

regx1<-"(#nl#)(?=[^@|[^0-9]|[^\\*])" #newline not introduced by @ or line numbering
repl1<-" "
cc3<-gsub(regx1,repl1,cc2b,perl = T)
#writeLines(cc3,paste0(dirtext,"/r-temp/bu2.txt"))

regx1<-"(@.egin.)(?=%|\\*)" #second obsolete @Begin tag
repl1<-""
cc3<-gsub(regx1,repl1,cc2b,perl = T)

#restore linebreaks
regx1<-"#nl#"
repl1<-"\n"
cc4<-gsub(regx1,repl1,cc3)
#writeLines(cc4,paste0(dirtext,"/r-temp/da4.txt"))

#wks.
dir.create(paste(dirtext,dirout,sep = "/"))
#writeLines(cc5,paste0(dirmod,"SES_ELL_GCC_f_9.txt"))
#delete hard line numbering
regx1<-"[0-9]{1,3}.[^\n](\\*)"
repl1<-"\\1"
cc5<-gsub(regx1,repl1,cc4)
#writeLines(cc5,paste0(dirtext,"/r-temp/cc5.txt"))
corfilename<-paste0(kids[[k]][1],"_mod.txt")
writeLines(cc5,paste(dirout,corfilename,sep = "/"))
corfilename
#paste0(dirmod,corfilename)
#"~/boxHKW/UNI/21S/DH/local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text/modified"
dirmod
#dirtext
#cc5
}
#call line correction function over source files array
filelist<-list.files(dirtext,pattern="(\\.txt)")
filelist
kids<-strsplit(filelist,"\\.")
kids[[2]][1]

for (k in 1:length(filelist)){
linecor(k)
}

filelist
#wks.
#vs search unlabeled lines
#"^\*[^A-Z]"
############
#from here substitute #coding#
rpall<-getms()

filelist<-list.files(dirout,pattern="(\\.txt)")
filelist
#kids<-strsplit(filelist,"\\.")
#kids[[2]][1]

for (f in 1:length(filelist)){
  #print(f)}
  tbu<-readLines(paste(dirout,filelist[f],sep = "/"))
  #tbu
  p1<-grep(".ctivities",tbu)
  tbu<-insert(tbu,p1+1,"@Elicitation files: (placeholder)")
  p2<-grep("@.oding",tbu)
  
    tbu<-insert(tbu,p2+1,"@TIER descriptions:")
  for (k in 1:length(rpall[,1])) {
    m<-grep(rpall[k,"rncpt"],tbu)
    
    m<-insert(m,1,p2+1)
    tbu<-insert(tbu,m+1,unique(rpall[k,"rpcpt"]))
  }
    m
    tbu
  for (k in 1:length(rpall[,"rncpt"])) {
    tbu<-gsub(rpall[k,"rncpt"],"#%#",tbu)
  }
  kids<-strsplit(filelist,"\\.")
  kids[[f]][1]
  dirtext
  #dirchat<-"CHAT_3/"
  dir.create(paste(dirtext,dirchat,sep = "/"))
  chatfilename<-paste0(kids[[f]][1],"_CHAT.txt")
#delete hardcoded linenumbers
    rn25<-"([0-9]{1,3}\\. )(?=\\*|@)"
  tbum<-gsub(rn25,"",tbu,perl = T)

    #post processing substitutes
  rnb01<-"STATIC(a|b|c|d|e|f)"
  rpb01<-"STATIC-\\1"
  rnb02<-"(but the some of the interviewer’s utterances)"
  rpb02<-"but the interviewer’s utterances"
  rnb03<-"(\\(mostly\\))"
  rpb03<-"roughly"
  rnb04<-"(\\(family_language-with_parents-with\\))"
  rpb04<-"(family_language-with_parents-with_siblings)"
  rnb05<-"\\., see the Elicitation documentation files\\."
  rpb05<-"; see reference @Elicitation files."
  rnb06<-""
  
  rnbcpt<-c(rnb01,rnb02,rnb03,rnb04,rnb05)
  rpbcpt<-c(rpb01,rpb02,rpb03,rpb04,rpb05)
  rpball<-cbind(rnbcpt,rpbcpt)
  tbu_e<-tbum
  for (l in 1:length(rpball[,"rnbcpt"])) {
    tbu_e<-gsub(rpball[l,"rnbcpt"],rpball[l,"rpbcpt"],tbu_e)
  }
  
  
  writeLines(tbu_e,paste(dirtext,dirchat,chatfilename,sep = "/"))
  
}
#k<-3
#length(rpball[,"rnbcpt"])
#for (k in 1:length(rpball[,"rnbcpt"])) {
#  tbu_e<-gsub(rpball[k,1],rpball[k,2],tbum_e)
#}
#tbu_e<-gsub(rpball[3,1],rpball[3,2],tbum)
#rpball[3,1]
#m<-gregexec(rnb03,tbu_e,perl = T)
#(regmatches(tbu_e,m))
#tbu_e[[39]]
#post processing substitutes

