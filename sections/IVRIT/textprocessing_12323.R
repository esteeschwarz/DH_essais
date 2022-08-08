#12323.SFB ivrit transcription
#20220808(20.02)
################
#replace content in oxygen doesnt work on all issues caused by RTL text direction
library(readtext)
src<-"https://github.com/esteeschwarz/DH_essais/raw/main/sections/IVRIT/kitre_stage002.txt"
dta<-readtext(src)
txt<-dta$text
regx1<-"\\(.+?\\)"
repl1<-"#BILD#"
# no. causes disorder
m<-gregexpr("\\(.+?\\)",txt)
regmatches(txt,m)
txtm1<-gsub(regx1,repl1,txt)
txtm1
library(clipr)

cl<-read_clip() #oxygen clipboard copy of text
cl
regx1<-"(...31..............)"
#m<-gregexpr(regx1,cl)
m<-gregexpr(regx1,txt)

#cl[28]
regmatches(txt,m)
repl1<-"#repl1#"
txtm2<-gsub(regx1,repl1,cl)
txtm2
writeLines(txtm2,"kitre_stage003.txt")
