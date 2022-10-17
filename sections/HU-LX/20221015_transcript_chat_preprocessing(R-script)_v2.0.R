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
library(memoise)
library(readr)
library(glue)
#mini
#setwd("~/boxHKW/21S/DH/")
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
  rp01a<-c("#%#","%NSS:", "nonstandard semantics:")
  rn02a<-"#9nst agmt.?#"
  rp02a<-c("#%#","%NSA:", "nonstandard agreement:")
  rn03a<-"(#9nst prep#)|(#9nst prep\\.)|(#9nst prep\\.#)|(#9nst prep)|(#90 prep)"
  rp03a<-c("#%#","%NSP:" ,"nonstandard preposition:")
  rn04b<-"(#90 art#)|(#90 art)|(#90 art\\.)|(#90 art\\.#)|(90 art#)" # dash!
  rp04b<-c("#%#","%0-A:", "zero article:")
  rn05b<-"#90 obj.?#"
  rp05b<-c("#%#","%0-O:" ,"zero object:")
  rn06c<-"#check tape#"
  rp06c<-c("#%#","%COM:", "check tape")
  rn07c<-"#.achen#"
  rp07c<-c("#%#","%COM:", "laughter")
  rn08a<-"(#9nst#)|(#9nst #)"
  rp08a<-c("#%#","%NST:" ,"nonstandard:")
  rn09b<-"(#90 subj#)|(#90 subj)"
  rp09b<-c("#%#","%0-S:" ,"zero subject:")
  rn10c<-"(#.?unclear script#)|(#script unclear#)"
  rp10c<-c("#%#","%COM:" ,"script unclear")
  rn11c<-"#unverstaendlich#"
  rp11c<-c("#%#","%COM:", "unintelligible")
  rn12a<-"#9nst verb#"
  rp12a<-c("#%#","%NSV:", "nonstandard verbform:")
  #rn13<-"#script unclear#"
  #rp13<-"%COM: script unclear"
  rn14a<-"#9nst conditional#"
  rp14a<-c("#%#","%NSC:" ,"nonstandard conditional:")
  rn15a<-"(#9nst gen#)|(#9nst gen)"
  rp15a<-c("#%#","%NSG:", "nonstandard genus:")
  rn16a<-"#9nst pers#"
  rp16a<-c("#%#","%NSP:", "nonstandard person:")
  rn17b<-"#9no pl/num#"
  rp17b<-c("#%#","%0-N:", "no plural/numeral marker:")
  rn18a<-"#9nst compar\\.#"
  rp18a<-c("#%#","%NSR:", "nonstandard comparison:")
  rn19c<-"#9misunderstand#"
  rp19c<-c("#%#","%COM:", "misunderstanding")
  rn20a<-"#9nst w\\.o\\.#"
  rp20a<-c("#%#","%NSW:" ,"nonstandard word order:")
  rn21b<-"#90 verb#"
  rp21b<-c("#%#","%0-V:", "zero VP:")
  #rn22<-"#90 subj"
  #rp22<-"%0-S: zero subject:"
  rn23b<-"(#90 prep#)|(#90 prep\\.#)"
  rp23b<-c("#%#","%0-P:", "zero preposition:")
  #rn24<-"#9semantics"
  #rp24<-"%NSS: nonstandard semantics:"
  rn26b<-"#90 refl#"
  rp26b<-c("#%#","%0-R:", "zero reflexive:")
  rn27e<-"#\\*#"
  rp27e<-c("#*#","#*#: ", "pause (inline)")
  rn28a<-"#9nst i.o.#"
  rp28a<-c("#%#","%N-?:", "nonstandard i dont know")
  rn29a<-"#9rel#"
  rp29a<-c("#%#","%N-?:", "nonstandard i dont know")
  rn30b<-"#90 aux #"
  rp30b<-c("#%#","%0-X","zero auxiliary:")
  "90 art"
  "90 verb"
  "90 cop"
  "9nst agmt"
  "9nst gen"
  "90 prep"
  "90 subj"
  rncpt<-c(rn01a,rn02a,rn03a,rn20a,rn12a,rn14a,rn15a,rn16a,rn18a,rn08a,rn28a,rn29a,rn30b,rn04b,rn05b,rn09b,rn17b,rn21b,rn23b,rn26b,rn06c,rn10c,rn11c,rn19c,rn27e)
  rpcpt1<-c(rp01a[1],rp02a[1],rp03a[1],rp20a[1],rp12a[1],rp14a[1],rp15a[1],rp16a[1],rp18a[1],rp08a[1],rp28a[1],rp29a[1],rp30b[1],rp04b[1],rp05b[1],rp09b[1],rp17b[1],rp21b[1],rp23b[1],rp26b[1],rp06c[1],rp10c[1],rp11c[1],rp19c[1],rp27e[1])
  rpcpt2<-c(rp01a[2],rp02a[2],rp03a[2],rp20a[2],rp12a[2],rp14a[2],rp15a[2],rp16a[2],rp18a[2],rp08a[2],rp28a[2],rp29a[2],rp30b[2],rp04b[2],rp05b[2],rp09b[2],rp17b[2],rp21b[2],rp23b[2],rp26b[2],rp06c[2],rp10c[2],rp11c[2],rp19c[2],rp27e[2])
  rpcpt3<-c(rp01a[3],rp02a[3],rp03a[3],rp20a[3],rp12a[3],rp14a[3],rp15a[3],rp16a[3],rp18a[3],rp08a[3],rp28a[3],rp29a[3],rp30b[3],rp04b[3],rp05b[3],rp09b[3],rp17b[3],rp21b[3],rp23b[3],rp26b[3],rp06c[3],rp10c[3],rp11c[3],rp19c[3],rp27e[3])
  
    #rpcpt<-c(rp1,rp2,rp3,rp4,rp5,rp6,rp7,rp8,rp9,rp10,rp11,rp12,rp14,rp15,rp16,rp17,rp18,rp19,rp20,rp21,rp23)
  rpall<-cbind(rncpt,rpcpt1,rpcpt2,rpcpt3)
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
trans_mod_array<-list()

linecor<-function(k,filelist){
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
dir.create(dirout)
#writeLines(cc5,paste0(dirmod,"SES_ELL_GCC_f_9.txt"))
#delete hard line numbering
regx1<-"[0-9]{1,3}.[^\n](\\*)"
repl1<-"\\1"
cc5<-gsub(regx1,repl1,cc4)
#writeLines(cc5,paste0(dirtext,"/r-temp/cc5.txt"))
corfilename<-paste0(kids[[k]][1],"_mod.txt")
writeLines(cc5,paste(dirout,corfilename,sep = "/"))
# trans_mod_temp<-tempdir("trans_temp")
# writeLines(cc5,paste(trans_mod_temp,corfilename,sep = "/"))
writeLines(cc5,paste(trans_mod_tempdir,corfilename,sep = "/"))
 trans_mod_array[k]<-"cc5"

corfilename
#paste0(dirmod,corfilename)
#"~/boxHKW/UNI/21S/DH/local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text/modified"
#dirmod
#dirtext
#cc5
output<-cc5
#help("cat")
}
#call line correction function over source files array
#filelist1<-list.files(trans_temp,pattern="(\\.txt)")

filelist1<-list.files(dirtext,pattern="(\\.txt)")
filelist1
kids<-strsplit(filelist1,"\\.")
kids[[2]][1]
#trans_mod_array<-list()
trans_mod_tempdir<-tempdir("trans_temp")


for (k in 1:length(filelist1)){
linecor(k,filelist1)
 trans_mod_array[k]<-linecor(k,filelist1)
 # writeLines(trans_mod_array[[k]],paste(trans_mod_tempdir,corfilename,sep = "/"))
 
 }
#writeLines(trans_mod_array,paste(trans_mod_temp,corfilename,sep = "/"))

#write_lines
#trans_mod_array[4]
#t<-timeout(10)
### end linecorrection
#for (var in seq)
#a<- function(n){runif(n)}
# pause<-1:10
# pause
# t2<-t-timeout(10)
# for (p in pause){
#   t2<-t-timeout(10)
#   t3<-10+t2
#   length(pause)-p
#     cat("wait ",pause, " til modified files are written\n")
# #timeout(10)
#    # pause<-t2+p
# }
# a <- function(n) { runif(n) }
# memA <- memoise(a, ~timeout(10))
# memA(2)
# length(pause)
# filelist
#wks.
#vs search unlabeled lines
#"^\*[^A-Z]"
############
#from here substitute #coding#
rpall<-getms()

#filelist2<-list.files(dirout,pattern="(\\.txt)")
#filelist2
filelist2<-list.files(trans_mod_tempdir,pattern="(\\.txt)")
filelist2
#kids<-strsplit(filelist,"\\.")
#kids[[2]][1]

for (f in 1:length(filelist2)){
  #print(f)}
 # tbutemp<-tempfile("tbu.temp")
  #writeLines(trans_mod_array[[f]],tbutemp)
  #tbu<-readLines(tbutemp)
#  tbu<-readLines(paste(dirout,filelist2[f],sep = "/"))
    tbu<-readLines(paste(trans_mod_tempdir,filelist2[f],sep = "/"))
  
   # tbu<-readLines(trans_mod_array[1])
  p1<-grep(".ctivities",tbu)
  tbu<-insert(tbu,p1+1,"@Elicitation files: (placeholder)")
  p2<-grep("@.oding",tbu)
  
    tbu<-insert(tbu,p2+1,"@TIER descriptions:")
  for (k in 1:length(rpall[,1])) {
    m<-grep(rpall[k,"rncpt"],tbu)
    
    m<-insert(m,1,p2+1)
    #header info on tiers:
    tierhead<-unique(paste0(rpall[k,"rpcpt2"]," ",rpall[k,"rpcpt3"]))
    tbu<-insert(tbu,m+1,tierhead)
  }
    m
    tbu
    #####################################
    ### this section main replacement ###
  for (k in 1:length(rpall[,"rncpt"])) {
    tbu<-gsub(rpall[k,"rncpt"],rpall[k,"rpcpt1"],tbu)
  }
    #####################################
  kids<-strsplit(filelist2,"\\.")
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
 # rnb06<-""
  rnb06<-"\\.\\.\\.@" #inline pauses
  rpb06<-rpall[24,2] # global pause replacement, set up in getms()
  
  rnbcpt<-c(rnb01,rnb02,rnb03,rnb04,rnb05)
  rpbcpt<-c(rpb01,rpb02,rpb03,rpb04,rpb05)
  rpball<-cbind(rnbcpt,rpbcpt)
  tbu_e<-tbum
  for (l in 1:length(rpball[,"rnbcpt"])) {
    tbu_e<-gsub(rpball[l,"rnbcpt"],rpball[l,"rpbcpt"],tbu_e)
  }
  
  
  writeLines(tbu_e,paste(dirtext,dirchat,chatfilename,sep = "/"))
  
}

###wks.
# general find #codes#
# writes global # and 9 codes in the transcripts to table
tempfun<-function(){ # wird nicht ausgeführt
regx1<-"#.+?#"
tbx<-trans_mod_array[[16]]
m<-gregexec(regx1,tbx)
#reg
regmatches(tbx,m)
f<-17
#codelist<-data.frame()
#for (f in 1:length(filelist2)){
tbu<-readLines(paste(trans_mod_tempdir,filelist2[f],sep = "/"))
regx1<-"#.+?#"
m<-gregexec(regx1,tbu)
p<-regmatches(tbu,m)
p2<-unique(unlist(p))
p3<-as.data.frame(p2)
p1<-rbind(p1,p3)

p4<-p1
colnames(p1)<-"codes"
#codelist[]<-p1
#write.table(p1,paste0(dirtemp,"#codes.csv"),append = T)
#grep(regx1,tbu,value = T)
#(p[1:32][1])


filelist2
tbu
p1
codelist[1]<-p1
getwd()
dirtemp<-"~/boxHKW/21S/DH/gith/DH_essais/sections/HU-LX/temp/"
p1<-unique(unlist(p))
length(unique(p1[,1]))
p5<-as.data.frame(unique(p1[,1]))
colnames(p5)<-"codes"
write.csv2(p5,paste0(dirtemp,"#codes.csv"))
p6<-as.data.frame(unique(p5[,1]))
colnames(p6)<-"codes"
write.csv2(p6,paste0(dirtemp,"#codes_unique.csv"))

as.data.frame(p)
unlist(p)
}

# import code .csv to create substitution array
getwd()
#read.csv2(paste0(dirtext,"/r-temp/codes_cpt.csv")
codes_cpt <- read_delim(paste0(dirtext,"/r-temp/codes_cpt3.csv"), 
    delim = ";", escape_double = FALSE, trim_ws = TRUE)
#rncpt2<-codes_cpt$codes         
#rpcpt2<-paste0(codes_cpt$pre1,codes_cpt$pre2,codes_cpt$pre3)          
#rp3<-subset(codes_cpt$codes,codes_cpt$pre3=="AG")          
#rpformAG<-glue_collapse(rp3,sep = ")|(")          
#rpformAG<-paste0('"(',rpformA,')"')
#rpformAG
pre3<-unique(codes_cpt$pre3)
chna<-!is.na(pre3)
chna
pre3<-pre3[chna]
pre2<-unique(codes_cpt$pre2)
chna<-!is.na(pre2)
chna
pre2<-pre2[chna]
prephrase<-unique(codes_cpt$phrase)
chna<-!is.na(prephrase)
chna
prephrase<-prephrase[chna]
postphrase<-unique(codes_cpt$feature)
chna<-!is.na(postphrase)
chna
postphrase<-postphrase[chna]
### w/o com fields
rpform<-data.frame()
subwocom<-subset(codes_cpt,set$category!=3)
set<-subwocom
###
getcodes<-function(set){
pre3<-unique(set$pre3)
chna<-!is.na(pre3)
chna
pre3<-pre3[chna]
pre2<-unique(set$pre2)
chna<-!is.na(pre2)
chna
pre2<-pre2[chna]
prephrase<-unique(set$phrase)
chna<-!is.na(prephrase)
chna
prephrase<-prephrase[chna]
postphrase<-unique(set$subst)
chna<-!is.na(postphrase)
chna
postphrase<-postphrase[chna]

#rpform<-data.frame()

for(k in 1:length(pre3)){
#rp4<-subset(codes_cpt$codes,codes_cpt$pre3==pre3[k],)
#rp4<-subset(set$codes,set$pre3==pre3[k],)          
rp4<-subset(set$codes,set$subst==postphrase[k],)          

rpformX<-glue_collapse(rp4,sep = ")|(")          
rpformXA<-paste0('"(',rpformX,')"')
rpform[k,1]<-rpformXA
rpform[k,2]<-pre3[k]
rpform[k,3]<-postphrase[k]
#rpform[k,2]<-
}
return(rpform)
}
codesarray<-getcodes(subwocom)

feat_array<-data.frame()
set<-subwocom
length(set[[1]])
for (k in 1:length(set[[1]])){
feat_array[k,1]<-paste0(set$pre1[k],set$pre2[k],
                    set$pre3[k],": ",set$phrase[k]," ",set$feature[k])

}
subwocom["subst"]<-feat_array[,1]
