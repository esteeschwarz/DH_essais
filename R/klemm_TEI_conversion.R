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
txt<-readLines(src)
#wks.
#txtm<-stri_replace_all_regex(txt,regx1,repl1)
#######################
teiwork<-function(src){
txt<-src
repl1<-'<div type="scene"><head>\\1 \\2</head><stage>'
regx1<-"(Erster|Zweyter|Dritter|Vierter|Fünfter|Sechster|Siebenter|Achter|Neunter) (Auftritt. )"
#stri_extract_all_regex(txtm,regx3)
txtm<-gsub(regx1,repl1,txt,perl = T)
#txtm
#wks.
regx2<-"</pb.{1,2}>"
txtm<-gsub(regx2," ",txtm,perl = T)
###
speaker.pt<-"(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)"
regx3<-"(<stage>.*?\\.)"
repl3<-"\\1</stage>"
txtm<-gsub(regx3,repl3,txtm,perl = T)
#txtm
regx4<-"> "
regx5<-" <"
repl4<-">"
repl5<-"<"
txtm<-gsub(regx4,repl4,txtm,perl = T)
txtm<-gsub(regx5,repl5,txtm,perl = T)
#txtm
regx6<-paste0("(</stage>)",speaker.pt)
repl6<-"\\1<sp><speaker>\\2</speaker>"
txtm<-gsub(regx6,repl6,txtm,perl = T)
txtm<-gsub(regx4,repl4,txtm,perl = T)
txtm<-gsub(regx5,repl5,txtm,perl = T)
txtm<-gsub("Der Besuch. ","",txtm,perl = T)
return(txtm)
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
regx7<-"(</speaker>)((.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))"
###regexr: regx7<-"(<\/speaker>)((.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))"
stri_extract_all_regex(txtm,regx7)

####################### \1 ####\2#\3###\4###
repl7<-"\\1<l>\\3</l></sp><sp><speaker>\\4</speaker><l>"
txtm<-gsub(regx7,repl7,txtm,perl = T)
txtm<-gsub(regx4,repl4,txtm,perl = T)
txtm<-gsub(regx5,repl5,txtm,perl = T)
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
m<-gregexec(regx8,txtm8,perl = T)
regmatches(txtm8,m)
#no.
#12235.
#hint: escape [<,>] for lookarounds
regx8<-"(<l>)((.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))(?!<)"
#immer noch nicht... basteln.
#.1 in R no escape of <> possible.
#.2 groups: from 1 uo into folded
se<-"\\. "
speaker.post<-"(Celimene\\. |Erast\\. |Chlorinde\\. |Damis\\. |Cydalise\\. |Finette\\. )"
regx8<-paste0("((<l>)((.*?)",speaker.post,"))")

m<-gregexec(regx8,txtm9,perl = T)
regmatches(txtm9,m)
m
txtm9<-removegaps(txtm8)
repl8<-"<l>\\4</l></sp><sp><speaker>\\5</speaker><l>"
# for some reason in regmatches the groups are one index higher than needed for replace by groups.
# half wks
txtm9<-gsub(regx8,repl8,txtm9,perl = T)
regx7a<-", Erast."
repl7a<-", Erast-."
regx8a<-"\\.([A-Za-z])"
repl8a<-". \\1"
txtm<-gsub(regx7a,repl7a,txtm,perl = T)
txtm9<-gsub(regx8a,repl8a,txtm9,perl = T)

txtm
txtm8
library(clipr)
write_clip(txtm)
