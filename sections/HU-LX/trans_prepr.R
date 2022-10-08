#13407.hu-lx reformatting
#20221007(20.35)
################
tbu<-readLines("~/boxHKW/UNI/21S/DH/local/HU-LX/000_SES_REFORMATTED_transcripts/Formatted with header info/text/SES_TUR_Tbu_m_13.txt")

###
rnss<-"(#9semantics#)(.+?)(\n)"
m<-gregexec(rnss,tbu)
regmatches(tbu, m)
