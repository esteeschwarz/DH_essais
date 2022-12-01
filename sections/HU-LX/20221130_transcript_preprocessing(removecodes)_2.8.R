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
library(clipr)
library(fs)
# 1. global variables
#setwd("~")
#getwd()
path_home()
#codesource<-paste0(path_home(),"/Documents/GitHub/DH_essais/sections/HU-LX/codes_cpt4mod.csv")
#######
#mini
setwd("~/boxHKW/21S/DH/")
#lapsi, ewa
#setwd("~/boxHKW/UNI/21S/DH/")
dirtext<-paste0(getwd(),"/local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text")
#codesource<-"/r-temp/codes_cpt3mod.csv"
codesource<-"gith/DH_essais/sections/HU-LX/codes_cpt4mod.csv"

list.files(dirtext)
#dirmod<-paste0(dirtext,"modified/")
dirmod<-dirtext #after manual regex modifying in VSCode
version<-"13485"
version<-"v2_8_wo_Codes"
version<-"v2_8"
dirchat<-paste0("SES_CHAT_transcripts_",version)
dirchat<-paste0("SES_transcripts_clean-without-codes_",version)
#dirchat<-paste0("CHAT_temp",version)
chatvmodified<-paste0(version,"_mod")
transextension<-"_sanscodes"
chatfileextension<-".txt"
#for export in .cha format to import into exmaralda
#dirchat<-paste0(dirchat,"_cha_",version)
#chatfileextension<-".cha"

dirtext
dirmod
dirout<-paste(dirtext,"out2",sep = "/")
dirout  
dir.create(dirout)
dirtemp<-paste(dirtext,"r-temp",sep="/")
dirtemp
#obsolete, array created from fix .csv table (create code substitution array with search/replace patterns
###wks.
#external codes .csv table
codes_cpt <- read_delim(codesource, 
                        delim = ";", escape_double = T)

# 2.
#get source files in top directory
filelist<-list.files(dirtext,pattern="(\\.txt)")
filelist
# chatv1<-grepl("CHAT",filelist)
# #filelist<-filelist[chatv1==F]
# #from here skip with already CHAT transformed transcript to second run
# filelist3<-filelist[chatv1]
#secondrun(filelist[chatv1==T])
#surface changes to transcript
#remove hardcoded linenumbers in some transcripts
#loop correction
trans_mod_array<-list()
#k<-8
#f<-8
#TODO: the following function has must be applied only to the transcript, not to the header section
#try create subscript of transcript containing just the interview section
#maybe apply part of postprocessing routine first to tag discrete coding in header
#precodesfun<-function(set,f){
#f<-8
linecor<-function(k,filelist){
  #     
  #   precodes<-subset(codes_cpt,codes_cpt$category==7)
  # # for (f in length(filelist)){
  # #   tbu<-readLines(paste(dirtext,filelist[f],sep = "/"))
  # #   tbu<-gsub(precodes$regex,precodes$repl,tbu)
  # # }
  # #find transcript start
  # #for (f in 1:length(filelist2)){
  #   tbu<-readLines(paste(dirtext,filelist[f],sep = "/"))
  #   
  # mstart<-grep("^\\*",tbu)[1]
  # tbub<-tbu[mstart:length(tbu)]
  # tbusafe<-tbu
  # tbuheader<-tbu[1:mstart-1]
  # tbu<-tbuheader
  # rpall<-precodes
  # #for (k in 1:length(rpall$regex)) {
  #   m<-grep(rpall$regex,tbu)
  #   tbu<-gsub(rpall$regex,rpall$repl,tbu,perl = T)
  #  # ifelse(m!=0,tbu<-insert(tbu,m+1,rpall$subst[k]),m<-"no")
  # #}
  # tburec<-c(tbu,tbub)
  # tburec
  # zzfil<-tempfile("kidschar")
  # #zz<-file(zzfil,"wb")
  # #nc<-nchar(tburec)
  # writeLines(tburec,zzfil,sep="§%#nl#§%")
  #return(zz)
  #}
  #write_clip(tburec)
  #k<-8
  # linecor<-function(k,filelist){
  ###single run
  #  readtext(zz)
  cc<-readtext(paste(dirtext,filelist[k],sep = "/"))
  #cc<-readtext(zzfil)
  # cc1<-readtext(precodesfun(codes_cpt,f))
  #cc<-precodesfun(codes_cpt,f)
  cc1<-cc$text
  #cc1<-readChar(cc,nchars=nchar(cc))
  #zzfil<-tempfile("kidschar")
  cc1
  #   zz<-file(zzfil,"rb")
  #readChar(zz,nc)
  #    cc1<-readChar(zz,nchar(tburec)+8)
  #find obsolete whitespace range 2 to 200 blanks
  regx1<-"[ ]{2,200}"
  repl1<-" "
  cc1<-gsub(regx1,repl1,cc1)
  #find all line breaks
  regx1<-"\n"
  repl1<-"§%#nl#§%"
  cc2<-gsub(regx1,repl1,cc1)
  cc2
  write_clip(cc2)
  
  regx1<-"(§%#nl#§%)([A-Za-z#%\\.,;'-\\(\\)])" #newline starting with character or special character
  repl1<-" \\2"
  cc3<-gsub(regx1,repl1,cc2,perl = T)
  write_clip(cc3)
  
  
  #only for linenumbered transcripts
  #delete linenumbering & hard breaks within IP
  #regex groups: 1:newline 2:linenumbering 3:phrase
  regx1<-"(?<=(§%#nl#§%))([0-9]{0,3}). " 
  repl1<-""
  cc3<-gsub(regx1,repl1,cc3,perl = T)
  write_clip(cc3)
  #solve: " '
  regx1<-'"'
  repl<-"'"
  cc3<-gsub(regx1,repl1,cc3,perl = T)
  write_clip(cc3)
  
  regx1<-"(?<=(\\*[A-Z]{3}))(\\*)" #doubled false * after speaker spec
  repl1<-""
  m<-gregexec(regx1,cc2,perl = T)
  regmatches(cc2,m)
  cc2b<-gsub(regx1,repl1,cc3,perl = T)
  cc3<-cc2b
  
  ###: solve "*TAH: Oh Lachen*INT: Nein is ist gar keine schwere" (source) (not linebreaked IP)
  regx1<-"(?<!(§%#nl#§%))(\\*[A-Z]{3})"
  repl1<-"§%#nl#§%\\2"
  cc3<-gsub(regx1,repl1,cc3,perl = T)
  
  regx1<-"§%#nl#§%(?=(@|[0-9]{1,3}|\\*))"
  repl1<-"\n"
  m<-gregexec(regx1,cc2,perl = T)
  regmatches(cc2,m)
  cc2b<-gsub(regx1,repl1,cc3,perl = T)
  cc3<-cc2b
  
  
  #restore linebreaks
  regx1<-"§%#nl#§%"
  repl1<-"\n"
  cc4<-gsub(regx1,repl1,cc3)
  write_clip(cc4)
  cc5<-cc4
  #wks.
  dir.create(dirout)
  #delete hard line numbering
  # regx1<-"[0-9]{1,3}.[^\n](\\*)"
  # repl1<-"\\1"
  # cc5<-gsub(regx1,repl1,cc4)
  kids<-strsplit(filelist,"\\.")
  #kids[[2]][1]
  corfilename<-paste0(kids[[k]][1],"_cor03.txt")
  writeLines(cc5,paste(dirout,corfilename,sep = "/"))
  #writeLines(cc5,paste(trans_mod_temp,corfilename,sep = "/"))
  writeLines(cc5,paste(trans_mod_tempdir,corfilename,sep = "/"))
  trans_mod_array[k]<-cc5
  return(cc5)
}
#cc5
#call line correction function over source files array
filelist1<-list.files(dirtext,pattern="(\\.txt)")
filelist1
#temporary directory where output is saved during session and accessed in
#section 3.
#k<-8
#unlink("trans_temp") #not wks deleting tempdir
trans_mod_tempdir<-tempdir("trans_temp")
for (k in 1:length(filelist1)){
  linecor(k,filelist1)
  trans_mod_array[k]<-linecor(k,filelist1)
}
#k<-8
filelist
cctemp<-linecor(k,filelist)
cat(cctemp)
trans_mod_array[k]
### end linecorrection
#wks.
#13435.fail newest linecorrection,

############
# 3.
#get modified files from temp dir
filelist2<-list.files(trans_mod_tempdir,pattern="(\\.txt)")
filelist2[k]
#wks.
#here insert 4 & 5
#change codes from table to valid regex formula
# #external codes .csv table
####
# codeset <- read_delim(codesource, delim = ";", escape_double = T)
#subset<-c(1,2,3,4,4)
####
 #tail(codes_cpt$regex)
regxcor<-function(codeset,subset){
  #subset codes
  codes_cpt<-subset(codeset,codeset$category==subset[1]|codeset$category==subset[2]|codeset$category==subset[3]|codeset$category==subset[4]|codeset$category==subset[5])
  codelength<-length(codes_cpt$codes)
  # k<-60
  codes_cpt$feature[55:67]
  codes_cpt$codes[55:67]
  
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
    
    codes_cpt[k,"regexcor"]<-regxf
    codes_cpt[k,"version"]<-version
  }
  return(codes_cpt)
}
codes_cpt$regexcor[55:67]
### correct codes with escaped characters, argument c() = categories, 1-4
codes_cpt2<-regxcor(codes_cpt,c(1,2,3,4,3))


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
rpall["shortcode"]<-paste0(codes_cpt4$pre1[ii],codes_cpt4$pre2[ii],codes_cpt4$pre3[ii])

###


#here insert getcode()

##################################
#from here substitute #coding#
### section D
### THIS complete replacement loop
f<-5
for (f in 1:length(filelist2)){
  tbu<-readLines(paste(trans_mod_tempdir,filelist2[f],sep = "/"))
  p1<-grep(".ctivities",tbu)
  tbu[p1[1]]
  tbu<-insert(tbu,p1[1]+1,"@Elicitation files: box.FU folder:00_SES Documents (to revise) for BERLANGDEV")
  p2<-grep("@.oding",tbu)
  tbu[p2[1]]
  tbu<-insert(tbu,p2[1]+1,"@TIER descriptions:")
  p3<-grep("@.roofer:",tbu)
  ifelse(!is.na(tbu[p3[1]]),tbu[p3[1]]<-"@Annotation checked:",
         tbu<-insert(tbu,p2[1]+1,"@Annotation checked:"))
  tbu[p1[1]+2]
  #delete evtl. second obsolete @Begin tag
  p3<-grep("@.egin",tbu)
  p3
  if (length(p3)>=1){tbu[p3[2:3]]<-""}
  #           tbu<-insert(tbu,p2[1]+1,"@Annotation checked:"))
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
  ### > add codes decription in header:
  #tbu<-append(tbu,rp5,after = p2[1]+1) #removed for codeless transcripts
  tbu[p2[1]+1]<-"@TIER descriptions: removed for unannotated transcript"
    #####################################
  tbu
  rptiers<-subset(rpall,rpall$category==1|rpall$category==2|rpall$category==3)
  #####################################
  ### this section main replacement ###
  ##### wks.
  #find transcript start
  mstart<-grep("^\\*",tbu)[1]
  tbub<-tbu[mstart:length(tbu)] #transcript section
  tbusafe<-tbu
  tbuheader<-tbu[1:mstart-1] #header section
  tbu<-tbub
  for (k in 1:length(rpall[,1])) {
    flag<-1
    m<-grep(rpall[k,1],tbu)
    tier<-rpall$category[k]
    ############################################
    ### main: 13485 outcommented to remove codes
#    tbu<-gsub(rpall[k,1],rpall[k,"repl"],tbu) # decomment 
    ### try remove all codes instead of replacing formerly:
    tbu<-gsub(rpall[k,1],"<#coding removed#>",tbu) # comment in for original replacement
    #ifelse(m!=0&tier!=4,tbu<-insert(tbu,m+1,rpall$subst[k]),flag<-0) #removed 13485, decomment
    ### 13485###################################
    ###extra, essai: note number of instances/code in header
    mh<-grep(rpall$subst[k],tbuheader) #grep headercodedescription line
    tier<-rpall$category[k]
#    tbu<-gsub(rpall[k,1],rpall[k,"repl"],tbu)
  #  ifelse(m!=0&tier!=4,tbuheader<-
    ### this adds number of occurences of code to header description of code, has to be formatted
            ifelse (length(m)!=0,tbuheader<-gsub(rpall$headex[k],
                       paste0(rpall$headex[k]," n = ",length(m)),tbuheader),flag<-0)
          #  tbuheader<- gsub(" #: 0","#todeletespace#",tbuheader)
          #  tbuheader<- gsub("#todeletespace#","",tbuheader)
         rpall[k,5+f]<-length(m)   
    #rpall$instance[k]<-c(f,length(m))
    } #replace coding with replacement + add extra tier with code below speakerline
  #TODO: create table of code instances in transcript:
  
  
  #tbu[105:130]
  #####################################
  kids<-strsplit(filelist2,"\\.")
  kids[[1]][1]
  dirtext
  dir.create(paste(dirtext,dirchat,sep = "/"))
  
  #nameschemeing the files
  #write_clip(filelist2)
  regx1<-"(.+_[0-9]{1,2}).+(\\.txt)"
  repl1<-"\\1\\2"
  
  kids1<-gsub(regx1,repl1,filelist2)
  kids1
  regx2<-".+(ELL|TUR)_([A-Za-z]{3}).+"
  repl2<-"\\2"
  kids2<-gsub(regx2,repl2,kids1)
  kids2
  kids3<-toupper(kids2)
  #length(rpall)
 # colnames(rpall)<-c("regex","subst","category","repl","headex",kids3)
  # k<-1
  kids4<-array()
  for (k in 1:length(filelist2)){
    # regx1<-"(.+_[0-9]{1,2}).+(\\.txt)"
    # repl1<-"\\1\\2"
    # filelist_ren<-gsub(regx1,repl1,filelist2[k])
  #  regx3<-"(?<=(ELL|TUR)_)([A-Za-z]{3})"
    regx3<-"(ELL|TUR)_([A-Za-z]{3})"
    
    # repl2<-"\\2"
    # filekids<-gsub(regx2,repl2,filelist_ren)
    kids4[k]<-gsub(regx3,kids3[k],kids1[k],perl = T)
  }
  kids4<-strsplit(kids4,"\\.")
 # codestable<-rpall[5:length(rpall)]
#  sum(codestable[1,6:length(codestable)]) #check for instance in line
  # for (k in 1:length(codestable$headex) ){
  # if (sum(codestable[k,6:length(codestable)])!=0){
  #   codest2<-rbind (codestable[k,6:length(codestable)]
  # 
  #   write.csv(codestable,paste0(dirtext,"/r-temp/kidscodestable.csv"))
 # getwd()
  #filelist2<-kids4
  ################
  
  chatfilename<-paste0(kids4[[f]][1],transextension,chatfileextension)
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
  regx<-stri_unescape_unicode(transcodes$regex)
  repl<-stri_unescape_unicode(transcodes$repl)
  
   for (l in 1:length(regx)) {
    tbu_e<-gsub(regx[l],repl[l],tbu_e)
  }
  tbub
  tbu_e[1:50]
  tbum
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
#  regx<-stri_unescape_unicode(transcodes$regex)
#  repl<-stri_unescape_unicode(transcodes$repl)
 # for (l in 1:length(regx)) {
  #  tbub<-gsub(regx[l],repl[l],tbub)
#  }
  
    #tbu_e[1:50]
  tbu_cpt<-c(tbuheader,tbu_e)
  tbu_e<-tbu_cpt
  
  #tbu_e[52]
  #tbu_e[148]
  ### final write transformed transcript according to scheme:
  writeLines(tbu_e,paste(dirtext,dirchat,chatfilename,sep = "/"))
  ##########################################################
    #  }
  #  postprocess(codes_cpt,tbum)
  
}
### END replacement loop #########

# tail(codes_cpt["repl"])
# #call replacement loop with last tbum(transcript) and set(codeset) as arguments
# ######
#nameschemeing the files
#write_clip(filelist2)
# regx1<-"(.+_[0-9]{1,2}).+(\\.txt)"
# repl1<-"\\1\\2"
# kids1<-gsub(regx1,repl1,filelist2)
# regx2<-".+(ELL|TUR)_([A-Za-z]{3}).+"
# repl2<-"\\2"
# kids2<-gsub(regx2,repl2,kids1)
# kids3<-toupper(kids2)
# k<-1
# kids4<-array()
# for (k in 1:length(filelist2)){
#   # regx1<-"(.+_[0-9]{1,2}).+(\\.txt)"
#   # repl1<-"\\1\\2"
#   # filelist_ren<-gsub(regx1,repl1,filelist2[k])
#   regx3<-"(?<=(ELL|TUR)_)([A-Za-z]{3})"
#   # repl2<-"\\2"
#   # filekids<-gsub(regx2,repl2,filelist_ren)
#   kids4[k]<-gsub(regx3,kids3[k],kids1[k],perl = T)
# }
# kids4
# filelist2<-kids4
#complete filelist of all converted files:
dirchat
translist<-list.files(paste(dirtext,dirchat,sep="/"),pattern="(\\.txt)")
#write_clip(filelist)
#date()
#format(Sys.time(), "%a %b %e %H:%M:%S %Y")
datestamp<-format(Sys.time(), "%Y%m%d(%H.%M)")
#translistname<-paste0("CHAT_transcripts_list_",datestamp,".txt")
#writeLines(translist,paste(dirtemp,translistname,sep = "/"))
##########
##### ----
#second run
#13475.
chatv1<-grepl("CHAT",filelist)
#filelist<-filelist[chatv1==F]
##############################
##############################
##############################
#from here skip with already CHAT transformed transcript to second run
postchatcoding<-function(){
##############################
filelist3<-filelist[chatv1]


for (f in 1:length(filelist3)){
  tbu<-readLines(paste(dirtext,filelist3[f],sep = "/"))
  # p1<-grep(".ctivities",tbu)
  # tbu[p1[1]]
  # tbu<-insert(tbu,p1[1]+1,"@Elicitation files: box.FU folder:00_SES Documents (to revise) for BERLANGDEV")
  # p2<-grep("@.oding",tbu)
  # tbu[p2[1]]
  # tbu<-insert(tbu,p2[1]+1,"@TIER descriptions:")
  # p3<-grep("@.roofer:",tbu)
  # ifelse(!is.na(tbu[p3[1]]),tbu[p3[1]]<-"@Annotation checked:",
  #        tbu<-insert(tbu,p2[1]+1,"@Annotation checked:"))
  # tbu[p1[1]+2]
  #delete evtl. second obsolete @Begin tag
  p3<-grep("@.egin",tbu)
  
  if (length(p3)>=1){tbu[p3[2:3]]<-""}
  #           tbu<-insert(tbu,p2[1]+1,"@Annotation checked:"))
  #get unique alphabetically sorted tier description
  # rp3<-paste0("@",rpall$subst)
  # rpall["headex"]<-rp3
  # #rp4
  # is<-order(rp3)
  # rp3<-rpall$subst[is]
  # rp3
  # #add @ to tier explanations
  # rpcom<-rpall$category!=3
  # rp5<-unique(rpall$headex[rpcom])
  # is<-order(rp5)
  # rp5<-rp5[is]
  # rp5
  # tbu<-append(tbu,rp5,after = p2[1]+1)
  # #tbu
  rptiers<-subset(rpall,rpall$category==1|rpall$category==2|rpall$category==3)
  #####################################
  ### this section main replacement ###
  ##### wks.
  #find transcript start
  mstart<-grep("^\\*",tbu)[1]
  tbub<-tbu[mstart:length(tbu)] #transcript section
  tbusafe<-tbu
  tbuheader<-tbu[1:mstart-1] #header section
  tbu<-tbub
  for (k in 1:length(rpall[,1])) {
    flag<-1
    m<-grep(rpall[k,1],tbu)
    tier<-rpall$category[k]
    tbu<-gsub(rpall[k,1],rpall[k,"repl"],tbu)
    ifelse(m!=0&tier!=4,tbu<-insert(tbu,m+1,rpall$subst[k]),flag<-0)#if out 0 findings & category==4
    }
    tbuheader
    k<-79
    rpall$shortcode[k]
    ###extra, essai: note number of instances/code in header
   # regx1<-paste0(codes_cpt4$pre1[k],codes_cpt4$pre2[k],codes_cpt4$pre3[k]) #codesshortcode
regx1<-rpall$shortcode[k]
      mh<-grep(regx1,tbuheader) #position of tierdescription
  tbuheader[mh]
      #tier<-rpall$category[k]
  m<-grep(regx1,tbu)
  #sum(m)
  tbu[m]
  ifelse (length(m)!=0,tbuheader[mh]<-paste0(rpall$headex[k]," n = ",length(m)),flag<-0)
  tbuheader
    #   mh<-grep(rpall$subst[k],tbuheader) #grep headercodedescription line
    # tier<-rpall$category[k]
    # ### this adds number of occurences of code to header description of code, has to be formatted
    # ifelse (length(m)!=0,tbuheader<-gsub(rpall$headex[k],
    # paste0(rpall$headex[k]," n = ",length(m)),tbuheader),flag<-0)
    #  tbuheader<- gsub(" #: 0","#todeletespace#",tbuheader)
    #  tbuheader<- gsub("#todeletespace#","",tbuheader)
    rpall[k,5+f]<-length(m) # writes instances into array
    #rpall$instance[k]<-c(f,length(m))
  } #replace coding with replacement + add extra tier with code below speakerline
  #TODO: create table of code instances in transcript:
  
  
  #tbu[105:130]
  #####################################
  kids<-strsplit(filelist3,"\\.")
  kids[[1]][1]
  dirtext
  dir.create(paste(dirtext,chatvmodified,sep = "/"))
  
  #nameschemeing the files
  #write_clip(filelist2)
  regx1<-"(.+_[0-9]{1,2}).+(\\.txt)"
  repl1<-"\\1\\2"
  
  kids1<-gsub(regx1,repl1,filelist3)
  kids1
  regx2<-".+(ELL|TUR)_([A-Za-z]{3}).+"
  repl2<-"\\2"
  kids2<-gsub(regx2,repl2,kids1)
  kids2
  kids3<-toupper(kids2)
  #length(rpall)
  # colnames(rpall)<-c("regex","subst","category","repl","headex",kids3)
  # k<-1
  kids4<-array()
  for (k in 1:length(filelist3)){
    # regx1<-"(.+_[0-9]{1,2}).+(\\.txt)"
    # repl1<-"\\1\\2"
    # filelist_ren<-gsub(regx1,repl1,filelist2[k])
    #  regx3<-"(?<=(ELL|TUR)_)([A-Za-z]{3})"
    regx3<-"(ELL|TUR)_([A-Za-z]{3})"
    
    # repl2<-"\\2"
    # filekids<-gsub(regx2,repl2,filelist_ren)
    kids4[k]<-gsub(regx3,kids3[k],kids1[k],perl = T)
  }
  kids4<-strsplit(kids4,"\\.")
  # codestable<-rpall[5:length(rpall)]
  #  sum(codestable[1,6:length(codestable)]) #check for instance in line
  # for (k in 1:length(codestable$headex) ){
  # if (sum(codestable[k,6:length(codestable)])!=0){
  #   codest2<-rbind (codestable[k,6:length(codestable)]
  # 
  #   write.csv(codestable,paste0(dirtext,"/r-temp/kidscodestable.csv"))
  # getwd()
  #filelist2<-kids4
  ################
  
  chatfilename<-paste0(kids4[[f]][1],"_CHAT_2nd",chatfileextension)
  chatfilename
  #delete hardcoded linenumbers
  tbu_cpt<-c(tbuheader,tbu)
  tbu<-tbu_cpt
  # rn25<-"([0-9]{1,3}\\. )(?=\\*|@)"
  # tbum<-gsub(rn25,"",tbu,perl = T)
  # tail(tbum)
  # codesarray$V1[61]
  # #################################
  # #post processing substitutes
  # #this routine data TODO fetch from external array
  # set<-codes_cpt
  # (codes_cpt$regex[codes_cpt$category==4])
  # #   postprocess<-function(set,tbum,mstart){
  # depr<-function(){
  #   rnb01<-"STATIC(a|b|c|d|e|f)"
  #   rpb01<-"STATIC-\\1"
  #   rnb02<-"(but the some of the interviewer’s utterances)"
  #   rpb02<-"but the interviewer’s utterances"
  #   rnb03<-"(\\(mostly\\))"
  #   rpb03<-"roughly"
  #   rnb04<-"(\\(family_language-with_parents-with\\))"
  #   rpb04<-"(family_language-with_parents-with_siblings)"
  #   rnb05<-"\\., see the Elicitation documentation files\\."
  #   rpb05<-"; see reference @Elicitation files."
  #   rnb06<-"\\.\\.\\.@" #inline pauses
  #   #rpb06<-rpall[24,2] # global pause replacement, set up in getms()
  #   rnbcpt<-c(rnb01,rnb02,rnb03,rnb04,rnb05)
  #   rpbcpt<-c(rpb01,rpb02,rpb03,rpb04,rpb05)
  #   rpball<-cbind(rnbcpt,rpbcpt)
  #   for (l in 1:length(rpball[,"rnbcpt"])) {
  #     tbu_e<-gsub(rpball[l,"rnbcpt"],rpball[l,"rpbcpt"],tbu_cpt)
  #   }
  # }#edn depr
  # #only transcript 
  # postcodes<-subset(set,set$category==4|set$category==5|set$category==6)
  # transcodes<-subset(postcodes,postcodes$category==4|postcodes$category==5)
  # postcodes<-transcodes
  # #postcodes$regex<-stri_unescape_unicode(postcodes$regex)
  # typeof(postcodes)
  # #rm(codes)
  # ii<-!is.na(postcodes$regex)
  # postcodes<-subset(postcodes,ii)
  # postcodes$regex
  # regx<-stri_unescape_unicode(postcodes$regex)
  # repl<-stri_unescape_unicode(postcodes$repl)
  # repl
  # regx
  # #postcodescor$regexcor
  # #postcodescor<-regxcor(postcodes,c(4,5,5,5,5))
  # tbu_e<-tbum
  # tbu<-tbu_e
  # tbub<-tbu[mstart:length(tbu)]
  # tbusafe<-tbu
  # tbuheader<-tbu[1:mstart-1]
  # tbu_e<-tbub
  # #transcript post
  # for (l in 1:length(regx)) {
  #   tbu_e<-gsub(regx[l],repl[l],tbu_e)
  # }
  # tbu_e[1:50]
  # postcodes<-subset(set,set$category==4|set$category==5|set$category==6)
  # headcodes<-subset(postcodes,postcodes$category==6)
  # postcodes<-headcodes
  # #postcodes$regex<-stri_unescape_unicode(postcodes$regex)
  # typeof(postcodes)
  # #rm(codes)
  # ii<-!is.na(postcodes$regex)
  # postcodes<-subset(postcodes,ii)
  # postcodes$repl
  # regx<-stri_unescape_unicode(postcodes$regex)
  # repl<-stri_unescape_unicode(postcodes$repl)
  # repl
  # tbuheader
  # for (l in 1:length(regx)) {
  #   tbuheader<-gsub(regx[l],repl[l],tbuheader)
  # }
  # #tbu_e[1:50]
  # tbu_cpt<-c(tbuheader,tbu_e)
  # tbu_e<-tbu_cpt
  
  #tbu_e[52]
  #tbu_e[148]
tbu_e<-tbu
    writeLines(tbu_e,paste(dirtext,chatvmodified,chatfilename,sep = "/"))
  #  }
  #  postprocess(codes_cpt,tbum)
  
}
#end postchatcoding temp function, not called
### END replacement loop #########
