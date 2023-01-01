getwd()
setwd("~/boxHKW/21S/DH/local/HU-LX/SES/conc/")
list.files()
for (k in 1:length(list.files())){
  a1<-readLines(list.files()[k])
  #head(a1)
  #headns<-c("ref","left","kwic","right")
  a1<-a1[5:length(a1)]
  writeLines(a1,paste0("mod/conc",k,".csv"))
}
files<-list.files("mod")
setwd("mod")
db1<-read.csv(files[2])
regx<-"SES_(.+?)_.*"
repl<-"\\1"
#  stri_extract(regex=regx,filelist[4])
kid<-gsub(regx,repl,filelist[f])
db1[1,]
