#12373.klemm HA analysen
#20220905(08.25)
################
#LERA prepare 1st / 2nd edition
src1<-"data/editions/klemm_raw_LERA_1765.txt"
src2<-"data/editions/klemm_raw_LERA_1767.txt"

library(readtext)
dta1<-readtext(src1)
dta2<-readtext(src2)

dta1$text
dta2$text

txt<-dta1$text
regx1<-"  "
repl1<-" "
txtm1<-gsub(regx1,repl1,txt,perl = T)
# 3 runs
m<-grep(regx1,txtm1)
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
#tmpU1b<-tmpU1
tmpU1
m<-grep(8211,tmpU1)
#grep
tmpU1<-replace(tmpU1,m,45)
tmpUtxt1<-intToUtf8(tmpU1)
tmpUtxt1
tmpU1
