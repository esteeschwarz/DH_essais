#12261.wiki epub conversion to SCHATTENDRUCK template
#20220625(08.12)
################
src<-"~/Documents/GitHub/DH_essais/data/corpus/klemm_besuch/Klemm_wikiepub.xhtml"
dta<-scan(src,"")
set<-dta
###
#regex:
# .24
formground<-cbind(regx1,repl1)
formground
regrep<-(regx1,repl1)
regx1<-array()
repl1<-array()
regx1[1]<-'<span class="Page.+?</span><b><a.+?</span></span>'
repl1[1]<-""
# [2]5 0
# [2]6 
regx1[2]<-"<div style.+?>(.+?)</p>"
# [2]7 
repl1[2]<-"<p>\1</p>"
# [2]8 
regx1[3]<-'<span style="letter-spacing.+?>(.+?)</span>'
# [2]9 
repl1[3]<-"\1"
# [3]0 
regx1[4]<-"<span style=.+?>(.+?)</span>"# ZIRKULAR, missing </span>
# [3]1 
repl1[4]<-"\1"
# [3]0b 
regx1[5]<-"<span style=.+?>"
# [3]1b 0
repl1[5]<-""
# [3]2 
regx1[6]<-'<span class="Annotation"'
# [3]3 0
repl1[6]<-""
# [3]4 
regx1[7]<-'<span typeof=".+</span>'
# [3]4 0
repl1[7]<-""
# [3]5 
regx1[8]<-"<\\?xml.+?>"
# [3]5 0
repl1[8]<-""
# [3]6 
regx1[9]<-"<section.+?>"
# [3]6 0
repl1[9]<-""
# [3]7 
regx1[10]<-"<span.+?<p>"
# [3]7 0
repl1[10]<-""
# [8] 
regx1[11]<-"</p<" #wo kommt das her?
# [8] 
repl1[11]<-"</p>"
# [9] 
regx1[12]<-"<.{0,1}tt>" #french lettering
# [9] [SPACE]
repl1[12]<-" "
# [0] 
regx1[13]<-"</div>" #stray
# [0] 0
repl1[13]<-""
# [1] 
regx1[14]<-"</section>"# stray
# [1] 0
repl1[14]<-""
# [2] 
regx1[15]<-"<body.+?>"
# [2] 
repl1[15]<-"<body>"
# [3] 
regx1[16]<-"<meta.+?>"
repl1[16]<-"" 
regx1[17]<-"<link.+?>"
repl1[17]<-""
####################
regx0a<-"\n"
repl0a<-""
txtm0a<-gsub(regx0a,repl0a,set,perl = T)
set
dta<-readtext(src)
set<-dta$text
formground<-cbind(regx1,repl1)
regx1a<-'<span class="Page.+?</span><b><a.+?</span></span>'
repl1a<-""
m<-gregexec(regx1a,set,perl = T)
regmatches(set,m)
txtm1a<-gsub(regx1a,repl1a,set,perl = T)

regx1b<-'<div style.+?>(.+?)</p>'
repl1b<-"<p>\\1</p>"
m<-gregexec(regx1b,set,perl = T)
regmatches(set,m)
txtm1b<-gsub(regx1b,repl1b,txtm1a,perl = T)

func.repl<-function(set,regx,repl){
  m<-gregexec(regx,set,perl = T)
  regmatches(set,m)
  txtm.out<-gsub(regx,repl,set,perl = T)
}
txt<-set
x<-c(1:17)
y<-c(1:17)
xx<-cbind (x,y)
regx1<-matrix(20)
repl1<-matrix(20)
##################
regx.ground<-rbind(regx1[1:17])
repl.ground<-rbind(repl1[1:17])
formground<-cbind(regx1,repl1)
formground<-cbind(regx.ground,repl.ground)
cground<-cbind(formground,txtm0a)
cground[1,3]<-gsub(cground[1,1],cground[1,2],txt,perl = T)
cground[2,3]<-gsub(cground[2,1],cground[2,2],cground[1,3],perl = T)
cground[3,3]<-gsub(cground[3,1],cground[3,2],cground[2,3],perl = T)
cground[4,3]<-gsub(cground[4,1],cground[4,2],cground[3,3],perl = T)
txt<-cground[4,3]
for (k in 2:length(cground)){
  cground[1]<-txtm0a
  cground[k]<-gsub(regx1[k],repl1[k],cground[k-1],perl = T)
  
}
cground[16]

cground<-matrix(1:17)
cground[1]<-set
cground[1]
cground[2]<-gsub(regx1[1],repl1[1],cground[1],perl = T)
cground[2]
dim(dta$text)
dim(cground[2,3])
cground[1]<-gsub(cground[1,1],cground[1,2],txt,perl = T)
typeof(cground)
length(cground)
regx1b<-'<div style.+?>(.+?)</p>'
repl1b<-"<p>\\1</p>"
m<-gregexec(regx1b,set,perl = T)
regmatches(set,m)
txtm1b<-gsub(regx1b,repl1b,txtm1a,perl = T)

regx1b<-'<div style.+?>(.+?)</p>'
repl1b<-"<p>\\1</p>"
m<-gregexec(regx1b,set,perl = T)
regmatches(set,m)
txtm1b<-gsub(regx1b,repl1b,txtm1a,perl = T)

regx1b<-'<div style.+?>(.+?)</p>'
repl1b<-"<p>\\1</p>"
m<-gregexec(regx1b,set,perl = T)
regmatches(set,m)
txtm1b<-gsub(regx1b,repl1b,txtm1a,perl = T)

regx1b<-'<div style.+?>(.+?)</p>'
repl1b<-"<p>\\1</p>"
m<-gregexec(regx1b,set,perl = T)
regmatches(set,m)
txtm1b<-gsub(regx1b,repl1b,txtm1a,perl = T)

regx1b<-'<div style.+?>(.+?)</p>'
repl1b<-"<p>\\1</p>"
m<-gregexec(regx1b,set,perl = T)
regmatches(set,m)
txtm1b<-gsub(regx1b,repl1b,txtm1a,perl = T)

regx1b<-'<div style.+?>(.+?)</p>'
repl1b<-"<p>\\1</p>"
m<-gregexec(regx1b,set,perl = T)
regmatches(set,m)
txtm1b<-gsub(regx1b,repl1b,txtm1a,perl = T)

regx1b<-'<div style.+?>(.+?)</p>'
repl1b<-"<p>\\1</p>"
m<-gregexec(regx1b,set,perl = T)
regmatches(set,m)
txtm1b<-gsub(regx1b,repl1b,txtm1a,perl = T)
