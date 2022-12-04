library(readtext)
path<-"/Users/lion/boxHKW/21S/DH/local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text/SES_CHAT_transcripts_v2_7 Kopie for editing"
dta<-paste0(path,"/SES_GDC_m_8_CHAT.txt")
text<-readLines(dta)

mod<-array()

m<-grep("#NSY#",text)
mt<-"#NSY#"
lm<-length(m)
feat<-text[m]

mp<-paste(mt,lm,sep = ", n = ")
sub<-c("---",mp,feat,"---")
mod<-append(mod,sub,after = length(mod))

m<-grep("#NMO#",text)
mt<-"#NMO#"
lm<-length(m)
feat<-text[m]

mp<-paste(mt,lm,sep = ", n = ")
sub<-c("---",mp,feat,"---")
mod<-append(mod,sub,after = length(mod))

m<-grep("#NSU#",text)
mt<-"#NSU#"
lm<-length(m)
feat<-text[m]
mp<-paste(mt,lm,sep = ", n = ")
sub<-c("---",mp,feat,"---")
mod<-append(mod,sub,after = length(mod))

m<-grep("#REP#",text)
mt<-"#REP#"
lm<-length(m)
feat<-text[m]
mp<-paste(mt,lm,sep = ", n = ")
sub<-c("---",mp,feat,"---")
mod<-append(mod,sub,after = length(mod))

m<-grep("#NCA#",text)
mt<-"#NCA#"
lm<-length(m)
feat<-text[m]
mp<-paste(mt,lm,sep = ", n = ")
sub<-c("---",mp,feat,"---")
mod<-append(mod,sub,after = length(mod))

###
feat<-text[m]
sub<-c("---",mp,feat,"---")
#mod<-append(mod,sub,after = length(mod))
mod[1]<-"13485.features coded in 2nd run"
writeLines(mod,"/Users/lion/boxHKW/21S/DH/local/HU-LX/meta/codesmod.txt")
