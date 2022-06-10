#12231.TEI conversion essai
#20220604(10.25)
###########################
getwd()
#src<-"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/klemm_TEI.xml"
#src<-"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/klemm(1765)_clean.txt"
src<-"https://raw.githubusercontent.com/esteeschwarz/DH_essais/main/data/corpus/klemm_besuch/klemm(1765)_clean.txt"
#library(stringi)
txt<-readLines(src)
library(stringi)
# regx<-"(</speaker>)(?!.*<p>)(.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)"
# repl<-("\\1<p>\\2</p></sp><sp><speaker>\\3</speaker>")
# 
# stri_detect_regex(txt,regx)
# sub(regx,repl,txt,fixed=F)
# gsub()
# stri_replace_all(txt,repl,regx)
# strirepl
# #regx<-"(</speaker>)(?!<p>)"
# grep(regx,txt,perl=T,value = T)
# txt[21]
# gregexpr(regx,txt,perl = T)
# stri_extract_all_regex(txt,regx)
# txtm<-stri_replace_all_regex(txt,regx,"\\1")
# txt[21]
# regx1<-"(</speaker>)(.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)"
# stri_extract_all_regex(txt,regx3)
# 
# # .03 (<div type="scene">)(Erster|Zweyter|Dritter|Vierter|Fünfter|Sechster|Siebenter|Achter|Neunter)( Auftritt.)
# # .04 <div type="scene"><head>\2\3</head>
# # .05 (</stage>)(Celimene.|Erast.|Chlorinde.|Damis.|Cydalise.|Finette.)
# # .06a \1<sp><speaker>\2</speaker>
# # .06b \1<p>\2</p></sp><sp><speaker>\3</speaker>
#   
# regx2<-"(</stage>)(.*)(Celimene.|Erast.|Chlorinde.|Damis.|Cydalise.|Finette.)"
# regx3<-"<stage>(Celimene.*|Erast.*|Chlorinde.*|Damis.*|Cydalise.*|Finette.*)</stage>(<sp>)"
# regx4<-"(<stage>)(Celimene.*|und.*|Erast.*|Chlorinde.*|Damis.*|Cydalise.*|Finette.*)(</stage>).*(Celimene.|und.|Erast.|Chlorinde.|Damis.|Cydalise.|Finette.)"
# stri_extract_all_regex(txtm[19],regx4)
# txtm<-stri_replace_all_regex(txt,regx4,"\\1")
# txt[[22]]
# txtm[21]
# txtm
# txt
# stri_extract_all_regex(txt,"> ")
# txtm<-stri_replace_all_regex(txtm,"> ",">")
# txtm[19]
######################
#####################
#neu from clean text.
# txt<-readLines(src)
# regextable<-function(){
# regxsafe.ns<-c("stage","r_regx","r_repl","oxygen_regx","oxygen_repl","vsc_regx","vsc_repl","text")
# regxsafe<-matrix(nrow=30,ncol=8)
# colnames(regxsafe)<-regxsafe.ns
# regxsafe[1:10,1]<-1:10
# return(regxsafe)
# }
#txtm<-stri_replace_all_regex(txt,regx1,repl1)
#######################
#regxsafe<-regextable()

teiwork<-function(src){

txt<-src
# ground:
library(purrr)
ground<-function(set){
  regx1<-"Der Besuch. "
  repl1<-""
  regx2<-", Erast."
  repl2<-", Erast-."
  regx3<-"\\.([A-Za-z])"
  repl3<-". \\1"
  regx4<-", Cydalise."
  repl4<-", Cydalise-."
  txtm9<-gsub(regx8a,repl8a,txt,perl = T)
  regx.ground<-rbind(regx1,regx2,regx3,regx4)
  repl.ground<-rbind(repl1,repl2,repl3,repl4)
  formground<-cbind(regx.ground,repl.ground)
  cground<-cbind(formground,txt)
  cground[1,3]<-gsub(cground[1,1],cground[1,2],txt,perl = T)
  cground[2,3]<-gsub(cground[2,1],cground[2,2],cground[1,3],perl = T)
  cground[3,3]<-gsub(cground[3,1],cground[3,2],cground[2,3],perl = T)
  cground[4,3]<-gsub(cground[4,1],cground[4,2],cground[3,3],perl = T)
  txt<-cground[4,3]
}
txt<-ground(txt)
#txt

#regexsafe<-regextable()
repl1<-'<div type="scene"><head>\\1 \\2</head><stage>'
regx1<-"(Erster|Zweyter|Dritter|Vierter|Fünfter|Sechster|Siebenter|Achter|Neunter) (Auftritt. )"
#stri_extract_all_regex(txtm,regx3)
txtm1<-gsub(regx1,repl1,txt,perl = T)
#txtm
#wks.
regx2<-"</pb.{1,2}>"
repl2<-" "
txtm2<-gsub(regx2,repl2,txtm1,perl = T)
###
speaker.pt<-"(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)"
regx3<-"(<stage>.*?\\.)"
repl3<-"\\1</stage>"
txtm3<-gsub(regx3,repl3,txtm2,perl = T)
#txtm
regx4<-"> "
regx5<-" <"
repl4<-">"
repl5<-"<"
txtm4<-gsub(regx4,repl4,txtm3,perl = T)
txtm5<-gsub(regx5,repl5,txtm4,perl = T)
#txtm
regx6<-paste0("(</stage>)",speaker.pt)
repl6<-"\\1<sp><speaker>\\2</speaker>"
txtm6<-gsub(regx6,repl6,txtm5,perl = T)
txtm7<-gsub(regx4,repl4,txtm6,perl = T)
txtm8<-gsub(regx5,repl5,txtm7,perl = T)

# 
# 
# map(cground,gsub,x=cground[,3],pattern=cground[,1],replacement=cground[,2])
# #no.
# regxsafe[1,2]<-regx1
# regxsafe[2,2]<-regx2
# regxsafe[3,2]<-regx3
# regxsafe[4,2]<-regx4
# regxsafe[5,2]<-regx5
# regxsafe[6,2]<-regx6
# regxsafe[7,2]<-regx4
# regxsafe[8,2]<-regx5
# regxsafe[9,2]<-regx8a
# 
# regxsafe[1,"r_repl"]<-repl1
# regxsafe[2,"r_repl"]<-repl2
# regxsafe[3,"r_repl"]<-repl3
# regxsafe[4,"r_repl"]<-repl4
# regxsafe[5,"r_repl"]<-repl5
# regxsafe[6,"r_repl"]<-repl6
# regxsafe[7,"r_repl"]<-repl4
# regxsafe[8,"r_repl"]<-repl5
# regxsafe[9,"r_repl"]<-repl8a
# 
# regxsafe[1,"text"]<-txtm1
# regxsafe[2,"text"]<-txtm2
# regxsafe[3,"text"]<-txtm3
# regxsafe[4,"text"]<-txtm4
# regxsafe[5,"text"]<-txtm5
# regxsafe[6,"text"]<-txtm6
# regxsafe[7,"text"]<-txtm7
# regxsafe[8,"text"]<-txtm8
# regxsafe[9,"text"]<-txtm9
# #regxsafe[10,"text"]<-txtm9
# 
# return(regxsafe)
}
txtm<-teiwork(txt)
#wks.
regx4<-"> "
regx5<-" <"
repl4<-">"
repl5<-"<"

#regx7<-paste0("(</speaker>.*)?",speaker.pt)
#regx7<-"(</speaker>).*?(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)"
###wkshalf: regx7<-"(</speaker>).*?(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)"
#regx7<-"(</speaker>)(.*?(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)).+?(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)"
#regx7<-"(</speaker>)(.+?(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))"
#regx7<-"(</speaker>)((.+?(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)).+?(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))"
#### this crashes: regx7<-"(</speaker>)((.+?(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)).+?(Celimene\\.).+?(Erast\\.).+?(Chlorinde\\.).+?(Damis\\.).+?(Cydalise\\.).+?(Finette\\.))"
regx10<-"(</speaker>)((.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))"
###regexr: regx7<-"(<\/speaker>)((.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))"
#stri_extract_all_regex(txtm[9,"text"],regx10)

####################### \1 ####\2#\3###\4###
regx10<-"(</speaker>)((.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))"
repl10<-"\\1<l>\\3</l></sp><sp><speaker>\\4</speaker><l>"
txtm10<-gsub(regx10,repl10,txtm[9,"text"],perl = T)
txtm10<-gsub(regx10,repl10,txtm,perl = T)

# regxsafe<-txtm
# regxsafe[10,2]<-regx10
# regxsafe[10,"r_repl"]<-repl10
# regxsafe[10,"text"]<-txtm10

txtm11<-gsub(regx4,repl4,txtm10,perl = T)
txtm12<-gsub(regx5,repl5,txtm11,perl = T)
# regxsafe[11,2]<-regx4
# regxsafe[11,"r_repl"]<-repl4
# regxsafe[11,"text"]<-txtm11
# regxsafe[12,2]<-regx5
# regxsafe[12,"r_repl"]<-repl5
# regxsafe[12,"text"]<-txtm12
# txtm<-regxsafe

#regx8<-"(<l>)((.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))"

removegaps<-function(set){
txtm<-set
    regx4<-"> "
  regx5<-" <"
  repl4<-">"
  repl5<-"<"
  txtm<-gsub(regx4,repl4,txtm,perl = T)
  txtm<-gsub(regx5,repl5,txtm,perl = T)
  
}
#stri_extract_all_regex(txtm,regx8)
#no.
#12235.
#hint: escape [<,>] for lookarounds
regx11<-"(<l>)((.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))(?!<)"
repl11<-"<l>\\4</l></sp><sp><speaker>\\5</speaker><l>"

m<-gregexec(regx11,txtm[12,8],perl = T)
regmatches(txtm[12,8],m)

#immer noch nicht... basteln.
#.1 in R no escape of <> possible.
#.2 groups: from 1 up into folded
se<-"\\. "
speaker.post<-"(Celimene\\. |Erast\\. |Chlorinde\\. |Damis\\. |Cydalise\\. |Finette\\. )"
regx8<-paste0("((<l>)((.*?)",speaker.post,"))")

m<-gregexec(regx12,txtm[12,8],perl = T)
regmatches(txtm[12,8],m)
regx12<-"(<l>)((.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))(?!<)"
repl12<-"\\1\\3</l></sp><sp><speaker>\\4</speaker><l>"
# regx12<-"(<l>)((.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))(?!<)"
# repl12<-"\\1\\3</l></sp><sp><speaker>\\4</speaker><l>"
# txtm13<-gsub(regx12,repl12,txtm[12,8],perl = T)
# wks
txtm[13,8]<-txtm13
txtm[13,2]<-regx12
txtm[13,3]<-repl12
m
txtm13<-removegaps(txtm13)
# for some reason in regmatches the groups are one index higher than needed for replace by groups.
# half wks
txtm14<-gsub(regx12,repl12,txtm[13,8],perl = T)
txtm15<-gsub(regx12,repl12,txtm14,perl = T)
#wks rekursiv für jeden neuen turn
#loop over text:
loopreplace<-function(set,regx,repl){
  txtmx<-gsub(regx,repl,set,perl = T)
return(removegaps(txtmx))

  }
#zwei durchgänge:
for (k in 1:20){
  txtm15<-loopreplace(txtm12,regx12,repl12)
}
for (k in 1:20){
  txtm15<-loopreplace(txtm15,regx12,repl12)
}

regx15a<-"(?!>)<div"
repl15a<-"</l></sp></div><div"
regx15b<-"Ende des Lustspiels."
repl15b<-"</l></sp></div><p>Ende des Lustspiels.</p>"
regx15d<-"Bediente zu Celimenen."
repl15d<-"<sp><speaker>Bediente zu Celimenen.</speaker><l>"
txtm16<-gsub(regx15a,repl15a,txtm15,perl = T)
txtm17<-gsub(regx15b,repl15b,txtm16,perl = T)
txtm17<-sub(repl15a,"<div",txtm17)
txtm18<-gsub(regx15d,repl15d,txtm17,perl = T)

txtm18<-removegaps(txtm18)
# regx7a<-", Erast."
# repl7a<-", Erast-."
# regx8a<-"\\.([A-Za-z])"
# repl8a<-". \\1"
# regx8b<-", Cydalise."
# repl8b<-", Cydalise-."
# regx8c<-"O setzen sie sich, Erast."
# repl8c<-"O setzen sie sich, Erast-."
# txtm12<-gsub(regx8b,repl8b,txtm12,perl = T)
# txtm9<-gsub(regx8a,repl8a,txtm9,perl = T)
# txtm12
# txtm
# txtm8
txtm18
# txtm[12,8]
library(clipr)
write_clip(txtm18)
library(xml2)
writeLines(txtm15,"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/klemm_TEI_Routput001.xml")
