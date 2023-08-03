#12373.klemm HA analysen
#20220905(08.25)
################
#LERA prepare 1st / 2nd edition
#src1<-"data/editions/klemm_raw_LERA_1765.txt"
#src2<-"data/editions/klemm_raw_LERA_1767.txt"
src1<-"data/editions/klemm_besuch(1765).txt"
src2<-"data/editions/klemm_besuch(1767).txt"

library(readtext)
library(stringi)

dta1<-readtext(src1)
dta2<-readtext(src2)
src<-src2
dta1$text
dta2$text
txt<-dta2$text

normalise<-function(src){
  dta1<-readtext(src)
  
  txt<-dta1$text
regx1<-"  "
repl1<-" "
txtm1<-gsub(regx1,repl1,txt,perl = T)
# 3 runs
m<-sum(grep(regx1,txtm1))
m<-m+1
for(k in 1:m){
  txtm2<-gsub(regx1,repl1,txtm1,perl = T)
txtm1<-txtm2
grep(regx1,txtm1)
}
###
tmp<-readtext("data/UTF-8.txt")
tmpU<-utf8ToInt(tmp$text)
tmpU # dashes replace by minus: 8211 > 45
tmpU1<-utf8ToInt(txtm1)
sum(match(tmpU1,8211),na.rm = T)
sum(match(tmpU1,8212),na.rm = T)

#tmpU1b<-tmpU1
tmpU1
m<-grep(8211,tmpU1)
m2<-grep(8212,tmpU1)

#grep
tmpU1<-replace(tmpU1,m,45)
tmpU1<-replace(tmpU1,m2,45)

tmpUtxt1<-intToUtf8(tmpU1)
tmpUtxt1
#tmpU1
txtm2<-tmpUtxt1
#tmpU1<-utf8ToInt(txtm2)

###
#txtm2
regx1<-"- -"
repl1<-"--"
txtm2<-gsub(regx1,repl1,txtm2,perl = T)
txtm2

spkr<-"(Celimene\\.|Erast\\.|Chlorinde\\.|Cydalise\\.|Finette\\.|Damis\\.|Ein Bedienter\\.)"
regx2<-paste0("(--)(.+?)",spkr)
m<-gregexec(regx2,txtm2)
regmatches(txtm2,m)
repl2<-"-.\\2\\3"
#regx1<-"- -"
#repl1<-"--"
m<-grep(regx2,txtm2)
m<-m+1
for(k in 1:m){
txtm2<-gsub(regx2,repl2,txtm2,perl = T)
txtm2
}
regx2<-"\\.-"
repl2<-"\\."
m<-sum(grep(regx2,txtm2))
#m<-1
m<-m+1
for(k in 1:m){
  txtm2<-gsub(regx2,repl2,txtm2,perl = T)
}
#txtm2<-gsub(regx1,repl1,txtm2,perl = T)
#txtm2
regx1<-"\\.\\."
repl1<-"\\."
txtm2<-gsub(regx1,repl1,txtm2,perl = T)

regx2<-" \\."
repl2<-"\\."
m<-sum(grep(regx2,txtm2))
#m<-1
m<-m+1
for(k in 1:m){
  txtm2<-gsub(regx2,repl2,txtm2,perl = T)
}

###
regx1<-"(\\? )(Der Besuch\\.)"
repl1<-"\\1"
m<-gregexec(regx1,txtm2)
regmatches(txtm1,m)

 txtm2<-gsub(regx1,repl1,txtm2,perl = T)
 
# regx1<-"in der größten Verwirrung"
# repl1<-"in der größten Verwirrung"
# m<-gregexec(regx1,txtm2)
# regmatches(txtm2,m)
# 
# txtm2<-gsub(regx1,repl1,txtm2,perl = T)
# regx1<-"ein Lustspiel"
# repl1<-""
# m<-gregexec(regx1,txtm2)
# regmatches(txtm2,m)
# txtm2<-gsub(regx1,repl1,txtm2,perl = T)

# regx1<-"(\\. )(.)"
# m<-gregexec(regx1,txtm2)
# mm<-regmatches(txtm2,m)
# mc<-capitalize(mm[[1]])
 txtm3<-stri_split_boundaries(txtm2,type="sentence")

}

export1<-normalise(src1)[[1]]
export2<-normalise(src2)[[1]]

writeLines(export1,"data/editions/klemm_lera_sent_1765.txt")
writeLines(export2,"data/editions/klemm_lera_sent_1767.txt")
library(Hmisc)
capitalize("(")


###
txtm3<-stri_split_boundaries(txtm2,type="sentence")
writeLines(txtm3[[1]],"data/editions/klemm_lera_sent_1765.txt")
txtm4<-stri_split_boundaries(txtm2,type="sentence")
writeLines(txtm4[[1]],"data/editions/klemm_lera_sent_1767.txt")

###
