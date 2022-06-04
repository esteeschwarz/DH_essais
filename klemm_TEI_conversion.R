#12231.TEI conversion essai
#20220604(10.25)
###########################
getwd()
src<-"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/klemm_TEI.xml"
src<-"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/klemm(1765)_clean.txt"

#library(stringi)
txt<-readLines(src)
library(stringi)
regx<-"(</speaker>)(?!.*<p>)(.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)"
repl<-("\\1<p>\\2</p></sp><sp><speaker>\\3</speaker>")

stri_detect_regex(txt,regx)
sub(regx,repl,txt,fixed=F)
gsub()
stri_replace_all(txt,repl,regx)
strirepl
#regx<-"(</speaker>)(?!<p>)"
grep(regx,txt,perl=T,value = T)
txt[21]
gregexpr(regx,txt,perl = T)
stri_extract_all_regex(txt,regx)
txtm<-stri_replace_all_regex(txt,regx,"\\1")
txt[21]
regx1<-"(</speaker>)(.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)"
stri_extract_all_regex(txt,regx3)

# .03 (<div type="scene">)(Erster|Zweyter|Dritter|Vierter|Fünfter|Sechster|Siebenter|Achter|Neunter)( Auftritt.)
# .04 <div type="scene"><head>\2\3</head>
# .05 (</stage>)(Celimene.|Erast.|Chlorinde.|Damis.|Cydalise.|Finette.)
# .06a \1<sp><speaker>\2</speaker>
# .06b \1<p>\2</p></sp><sp><speaker>\3</speaker>
  
regx2<-"(</stage>)(.*)(Celimene.|Erast.|Chlorinde.|Damis.|Cydalise.|Finette.)"
regx3<-"<stage>(Celimene.*|Erast.*|Chlorinde.*|Damis.*|Cydalise.*|Finette.*)</stage>(<sp>)"
regx4<-"(<stage>)(Celimene.*|und.*|Erast.*|Chlorinde.*|Damis.*|Cydalise.*|Finette.*)(</stage>).*(Celimene.|und.|Erast.|Chlorinde.|Damis.|Cydalise.|Finette.)"
stri_extract_all_regex(txtm[19],regx4)
txtm<-stri_replace_all_regex(txt,regx4,"\\1")
txt[[22]]
txtm[21]
txtm
txt
stri_extract_all_regex(txt,"> ")
txtm<-stri_replace_all_regex(txtm,"> ",">")
txtm[19]
########
#neu from clean text.
regx1<-"(Erster|Zweyter|Dritter|Vierter|Fünfter|Sechster|Siebenter|Achter|Neunter) (Auftritt. )"
stri_extract_all_regex(txt,regx2)
#wks.
#txtm<-stri_replace_all_regex(txt,regx1,repl1)
repl1<-'<div type="scene">\\1 \\2<stage>'
txtm<-gsub(regx1,repl1,txt,perl = T)
txtm
#wks.
library(clipr)
write_clip(txtm)
regx2<-"</pb.{1,2}>"
txtm<-gsub(regx2,"",txtm,perl = T)
