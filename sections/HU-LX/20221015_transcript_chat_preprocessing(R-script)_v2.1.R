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
#library(memoise)
library(readr)
library(glue)
library(stringi)
# 1. global variables
#mini
setwd("~/boxHKW/21S/DH/")
#lapsi, ewa
#setwd("~/boxHKW/UNI/21S/DH/")
dirtext<-paste0(getwd(),"/local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text")
list.files(dirtext)
#dirmod<-paste0(dirtext,"modified/")
dirmod<-dirtext #after manual regex modifying in VSCode
version<-"v2_1"
dirchat<-"CHAT_5chat"
#chatfileextension<-".cha"
dirchat<-paste0("CHAT",version)
chatfileextension<-".txt"

dirtext
dirmod
dirout<-paste(dirtext,"out2",sep = "/")
dirout  
dir.create(dirout)
dirtemp<-paste(dirtext,"r-temp",sep="/")
dirtemp
#obsolete, array created from above table (create code substitution array with search/replace patterns
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
###wks.
#######
# 2.
#get source files in top directory
filelist<-list.files(dirtext,pattern="(\\.txt)")
filelist
#surface changes to transcript
#remove hardcoded linenumbers in some transcripts
#loop correction
trans_mod_array<-list()
linecor<-function(k,filelist){
cc<-readtext(paste(dirtext,filelist[k],sep = "/"))
cc1<-cc$text
#find obsolete whitespace range 2 to 200 blanks
regx1<-"[ ]{2,200}"
repl1<-" "
cc1<-gsub(regx1,repl1,cc1)
#find lines not properly introduced (false hard line breaks)
regx1<-"\n"
repl1<-"#nl#"
cc2<-gsub(regx1,repl1,cc1)
cc2
#restore newline in not numbered scripts:
regx1<-"#nl#(?=(@|[0-9]{1,3}|\\*))"
repl1<-"\n"
m<-gregexec(regx1,cc2,perl = T)
regmatches(cc2,m)
cc2b<-gsub(regx1,repl1,cc2,perl = T)
cc2b
#"(#nl#)(@|[0-9]{1,3}|\*)"
#only for linenumbered transcripts
regx1<-"(#nl#)(?=[^@|[^0-9]|[^\\*])" #newline not introduced by @ or line numbering
repl1<-" "
cc3<-gsub(regx1,repl1,cc2b,perl = T)
regx1<-"(@.egin.)(?=%|\\*)" #second obsolete @Begin tag
repl1<-""
cc3<-gsub(regx1,repl1,cc2b,perl = T)
#restore linebreaks
regx1<-"#nl#"
repl1<-"\n"
cc4<-gsub(regx1,repl1,cc3)
#wks.
dir.create(dirout)
#delete hard line numbering
regx1<-"[0-9]{1,3}.[^\n](\\*)"
repl1<-"\\1"
cc5<-gsub(regx1,repl1,cc4)
kids<-strsplit(filelist,"\\.")
#kids[[2]][1]
corfilename<-paste0(kids[[k]][1],"_cor03.txt")
writeLines(cc5,paste(dirout,corfilename,sep = "/"))
#writeLines(cc5,paste(trans_mod_temp,corfilename,sep = "/"))
writeLines(cc5,paste(trans_mod_tempdir,corfilename,sep = "/"))
trans_mod_array[k]<-"cc5"
}
#call line correction function over source files array
filelist1<-list.files(dirtext,pattern="(\\.txt)")
filelist1
#temporary directory where output is saved during session and accessed in
#section 3.
trans_mod_tempdir<-tempdir("trans_temp")
for (k in 1:length(filelist1)){
linecor(k,filelist1)
 trans_mod_array[k]<-linecor(k,filelist1)
}
### end linecorrection
#wks.
############
# 3.
#get modified files from temp dir
filelist2<-list.files(trans_mod_tempdir,pattern="(\\.txt)")
filelist2
#wks.
#here insert 4 & 5
#change codes from table to valid regex formula
#external codes .csv table
codes_cpt <- read_delim(paste0(dirtext,"/r-temp/codes_cpt3mod.csv"), 
                        delim = ";", escape_double = T)
#tail(codes_cpt$regex)
regxcor<-function(codeset,subset){
  #subset codes
  codes_cpt<-subset(codeset,codeset$category==subset[1]|codeset$category==subset[2]|codeset$category==subset[3]|codeset$category==subset[4]|codeset$category==subset[5])
  codelength<-length(codes_cpt$codes)
 # k<-60
  codes_cpt$feature[55:67]
 #regxa<-"(mostly)"
  for (k in 1:codelength){
    regxa<-codes_cpt$codes[k]
    regx1<-"\\?"
    repl1<-"\\\\?"
    regxb<-gsub(regx1,repl1,regxa)
    regx2<-"\\."
    repl2<-"\\\\."
    regxc<-gsub(regx2,repl2,regxb)
    regx3<-'"'
    #codes_cpt$codes[70]
    #minunderstands "wann"?#
    repl3<-"."
    regxd<-gsub(regx3,repl3,regxc)
    regx4<-"\\("
    repl4<-"\\\\("
    regxe<-gsub(regx4,repl4,regxd)
    regx4<-"\\)"
    repl4<-"\\\\)"
    regxf<-gsub(regx4,repl4,regxe)
    
    codes_cpt[k,"regexcor"]<-regxd
    codes_cpt[k,"version"]<-version
  }
  return(codes_cpt)
}
### correct codes with escaped characters
codes_cpt2<-regxcor(codes_cpt,c(1,2,3,3,3))


regxmean<-function(set){
  #get regex gefräszigkeit, sort array by
  #loop
  #k<-15
  codes_cpt<-set
  regxout<-array()
  nfiles<-length(filelist2)
  regxmatrix<-matrix(nrow = length(codes_cpt$codes),ncol = nfiles+1)
  for (f in 1:length(filelist2)){
    tbu<-readtext(paste(trans_mod_tempdir,filelist2[f],sep = "/"))
    for (k in 1:length(codes_cpt$codes)){
      regx1<-codes_cpt$regexcor[k]
      regxout<-stri_extract_all(tbu$text,regex=regx1)
      regxmatrix[k,f]<-mean(stri_count_boundaries(regxout[[1]],"character"),na.rm = T)
      regxmatrix[k,nfiles+1]<-mean(regxmatrix[k,],na.rm = T)
      
    }
    #regxmatrix[,nfiles+1]<-lapply(regxmatrix,mean)
    codes_cpt$regxmean<-regxmatrix[,nfiles+1]
  }
  return(codes_cpt)
}

#wks.
#
#then create neues regex combined array from escape corrected codes
getcodescpt<-function(set,codes){
  pre3<-paste0(set$pre2,set$pre3)
  chna<-!is.na(pre3)
  chna
  pre3<-pre3[chna]
  pre2<-set$pre2
  chna<-!is.na(pre2)
  chna
  pre2<-pre2[chna]
  prephrase<-set$phrase
  chna<-!is.na(prephrase)
  chna
  prephrase<-prephrase[chna]
  postphrase<-set$subst
  chna<-!is.na(postphrase)
  chna
  postphrase<-postphrase[chna]
  rpform<-data.frame()
  
  for(k in 1:length(postphrase)){
    ####wks.rp4<-subset(set$codes,set$subst==postphrase[k])          
    rp4<-subset(set$regexcor,set$subst==postphrase[k])          
    
    rpformX<-glue_collapse(rp4,sep = ")|(")          
    rpformXA<-paste0('(',rpformX,')')
    rpform[k,1]<-rpformXA
    #rpform[k,2]<-set$pre3[k]
    rpform[k,2]<-postphrase[k]
    #rpform[k,2]<-
  }
  return(rpform) #codesarray
}
#get feature array
getfeature<-function(set){
feat_array<-data.frame()
#set<-subwocom
#set<-codes_cpt2
length(set[[1]])
for (k in 1:length(set[[1]])){
  feat_array[k,1]<-paste0(set$pre1[k],set$pre2[k],
                          set$pre3[k],": ",set$phrase[k]," ",set$feature[k])
  
}
return(feat_array)
}
#subwocom["subst"]<-feat_array[,1]
feat_array<-getfeature(codes_cpt2)
codes_cpt2["subst"]<-feat_array[,1]


#codesarray<-getcodes(codes_cpt2,regexcor)
codesarray<-getcodescpt(codes_cpt2,regexcor)
#157 cpt
#codesarray[50,1]
#
ar<-unique(codesarray$V2)
codes_cpt2["ar"]<-match(codes_cpt2$subst,ar)

#for (k in 1:length(codes_cpt$regexcor)){
# m<-codes_cpt$ar
codes_cpt2["regex"]<-codesarray$V1
codes_cpt4<-regxmean(codes_cpt2)
#save codes table
write_csv2(codes_cpt4,paste0(dirtemp,"/codes_cpt4",version,".csv"))
ii<-order(-codes_cpt4$regxmean)
codes_cpt4$regexcor[ii]
rpall<-as.data.frame(codes_cpt4$regex[ii])
#rpall[,1]
rpall["subst"]<-codes_cpt4$subst[ii]
rpall["category"]<-codes_cpt4$category[ii]
rpall["repl"]<-codes_cpt4$repl[ii]

###


#here insert getcode()
tempfun0<-function(zer){
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
  codes_cpt <- read_delim(paste0(dirtext,"/r-temp/codes_cpt3mod.csv"), 
                          delim = ";", escape_double = FALSE, trim_ws = TRUE)
  #rncpt2<-codes_cpt$codes         
  #rpcpt2<-paste0(codes_cpt$pre1,codes_cpt$pre2,codes_cpt$pre3)          
  #rp3<-subset(codes_cpt$codes,codes_cpt$pre3=="AG")          
  #rpformAG<-glue_collapse(rp3,sep = ")|(")          
  #rpformAG<-paste0('"(',rpformA,')"')
  #rpformAG
  #codes_cpt<-codes_cpt2
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
  #subwocom<-subset(codes_cpt,set$category!=3)
  #set<-subwocom
  #set<-codes_cpt
  ###
  # #codesarray<-getcodes(subwocom)
  # codesarray<-getcodes(codes_cpt2,regexcor)
  # codesarray[24,1]
  ###well.
  ### run after 4 codesarray
  feat_array<-data.frame()
  #set<-subwocom
  set<-codes_cpt2
  length(set[[1]])
  for (k in 1:length(set[[1]])){
    feat_array[k,1]<-paste0(set$pre1[k],set$pre2[k],
                            set$pre3[k],": ",set$phrase[k]," ",set$feature[k])
    
  }
  #subwocom["subst"]<-feat_array[,1]
  codes_cpt["subst"]<-feat_array[,1]
  getwd()
  #write regex to codescpt
  # for (k in 1:length(codes_cpt$ar)){
  #   m<-codes_cpt$ar
  #   codes_cpt2["regex"]<-codesarray$V1[m]
  #   codes_cpt2["regexcor"]<-codesarray$V1[m]
  #   
  # }
  ar<-unique(codesarray$V2)
  codes_cpt2["ar"]<-match(codes_cpt2$subst,ar)
  
  #for (k in 1:length(codes_cpt$regexcor)){
   # m<-codes_cpt$ar
    codes_cpt2["regex"]<-codesarray$V1
#    codes_cpt2["regexcor"]<-codesarray$V1[m]
    
 # }
  #codes_cpt2["ar"]<-match(codes_cpt$subst,codesarray$V2)
  
  write.csv2(codesarray,paste0(dirtext,"/r-temp/codesarray_m03.csv"))
  write.csv2(codes_cpt2,paste0(dirtext,"/r-temp/codes_cpt3.csv"))
  
} #end temp function

##################################
#from here substitute #coding#
### THIS complete replacement loop

for (f in 1:length(filelist2)){
  tbu<-readLines(paste(trans_mod_tempdir,filelist2[f],sep = "/"))
  p1<-grep(".ctivities",tbu)
  tbu[p1[1]]
  tbu<-insert(tbu,p1[1]+1,"@Elicitation files: (placeholder)")
  p2<-grep("@.oding",tbu)
  tbu[p2[1]]
    tbu<-insert(tbu,p2[1]+1,"@TIER descriptions:")
    p3<-grep("@.roofer:",tbu)
    ifelse(!is.na(tbu[p3[1]]),tbu[p3[1]]<-"@Annotation checked:",
           tbu<-insert(tbu,p2[1]+1,"@Annotation checked:"))
    tbu[p1[1]+2]
      #get unique alphabetically sorted tier description
    rp3<-paste0("@",rpall$subst)
    rpall["headex"]<-rp3
    #rp4
    is<-order(rp3)
    rp3<-rpall$subst[is]
    rp3
    #add @ to tier explanations
    rpcom<-rpall$category!=3
    rp5<-unique(rpall$headex[rpcom])
    is<-order(rp5)
    rp5<-rp5[is]
    rp5
    tbu<-append(tbu,rp5,after = p2[1]+1)
    #tbu
    #####################################
    ### this section main replacement ###
    ##### wks.
    #find transcript start
    mstart<-grep("^\\*",tbu)[1]
    tbub<-tbu[mstart:length(tbu)]
    tbusafe<-tbu
    tbuheader<-tbu[1:mstart-1]
    tbu<-tbub
    for (k in 1:length(rpall[,1])) {
            m<-grep(rpall[k,1],tbu)
            tbu<-gsub(rpall[k,1],rpall[k,"repl"],tbu)
            ifelse(m!=0,tbu<-insert(tbu,m+1,rpall$subst[k]),m<-"no")
    }
    #tbu[105:130]
  #####################################
  kids<-strsplit(filelist2,"\\.")
  kids[[f]][1]
  dirtext
  dir.create(paste(dirtext,dirchat,sep = "/"))
  chatfilename<-paste0(kids[[f]][1],"_CHAT",chatfileextension)
  chatfilename
  #delete hardcoded linenumbers
  tbu_cpt<-c(tbuheader,tbu)
  tbu<-tbu_cpt
  rn25<-"([0-9]{1,3}\\. )(?=\\*|@)"
  tbum<-gsub(rn25,"",tbu,perl = T)
tail(tbum)
codesarray$V1[61]
  #################################
    #post processing substitutes
  #this routine data TODO fetch from external array
set<-codes_cpt
  (codes_cpt$regex[codes_cpt$category==4])
 #   postprocess<-function(set,tbum,mstart){
  depr<-function(){
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
  rnb06<-"\\.\\.\\.@" #inline pauses
  #rpb06<-rpall[24,2] # global pause replacement, set up in getms()
  rnbcpt<-c(rnb01,rnb02,rnb03,rnb04,rnb05)
  rpbcpt<-c(rpb01,rpb02,rpb03,rpb04,rpb05)
  rpball<-cbind(rnbcpt,rpbcpt)
   for (l in 1:length(rpball[,"rnbcpt"])) {
        tbu_e<-gsub(rpball[l,"rnbcpt"],rpball[l,"rpbcpt"],tbu_cpt)
   }
  }#edn depr
  #only transcript 
  postcodes<-subset(set,set$category==4|set$category==5|set$category==6)
  transcodes<-subset(postcodes,postcodes$category==4|postcodes$category==5)
  postcodes<-transcodes
  #postcodes$regex<-stri_unescape_unicode(postcodes$regex)
  typeof(postcodes)
  #rm(codes)
  ii<-!is.na(postcodes$regex)
  postcodes<-subset(postcodes,ii)
  postcodes$regex
  regx<-stri_unescape_unicode(postcodes$regex)
  repl<-stri_unescape_unicode(postcodes$repl)
  repl
  regx
  #postcodescor$regexcor
  #postcodescor<-regxcor(postcodes,c(4,5,5,5,5))
  tbu_e<-tbum
  tbu<-tbu_e
  tbub<-tbu[mstart:length(tbu)]
  tbusafe<-tbu
  tbuheader<-tbu[1:mstart-1]
  tbu_e<-tbub
  #transcript post
  for (l in 1:length(regx)) {
    tbu_e<-gsub(regx[l],repl[l],tbu_e)
  }
  tbu_e[1:50]
  postcodes<-subset(set,set$category==4|set$category==5|set$category==6)
  headcodes<-subset(postcodes,postcodes$category==6)
  postcodes<-headcodes
    #postcodes$regex<-stri_unescape_unicode(postcodes$regex)
  typeof(postcodes)
  #rm(codes)
  ii<-!is.na(postcodes$regex)
  postcodes<-subset(postcodes,ii)
  postcodes$repl
  regx<-stri_unescape_unicode(postcodes$regex)
  repl<-stri_unescape_unicode(postcodes$repl)
  repl
  tbuheader
    for (l in 1:length(regx)) {
    tbuheader<-gsub(regx[l],repl[l],tbuheader)
  }
  #tbu_e[1:50]
    tbu_cpt<-c(tbuheader,tbu_e)
  tbu_e<-tbu_cpt
  
  #tbu_e[52]
  #tbu_e[148]
  writeLines(tbu_e,paste(dirtext,dirchat,chatfilename,sep = "/"))
  #  }
  #  postprocess(codes_cpt,tbum)
    
    }
### END replacement loop #########

tail(codes_cpt["repl"])
#call replacement loop with last tbum(transcript) and set(codeset) as arguments
