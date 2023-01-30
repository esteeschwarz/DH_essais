#13026.fsi-survey: knit
library(rmarkdown)
library(rlang)
library(purrr)

#getwd()
src<-"https://www.soscisurvey.de/fsi-survey/?act=Z2l4npjIZMwgHMlZB0oa7GuF"
args<-c("knit","","none")
args <- commandArgs(trailingOnly = TRUE)
id<-"ground"
if (length(args)==1){
  ref<-"empty"
  txt<-NA
  arg<-args[1]}
if (length(args)==2){
  ref<-args[1]
  txt<-NA
  arg<-args[2]}
if (length(args)==3){
  ref<-args[1]
  txt<-args[2]
  arg<-args[3]}
#txt<-args[2]
if (is.na(txt)){txt<-""}
if (txt=="p"){txt<-""}
head<-data.frame(ref,txt,arg)
knitfile<-paste0("fsi_eval/fsi-eval",txt,".Rmd")
render("fsi-eval_SRV.Rmd",encoding="UTF-8")
#render(knitfile,encoding = "UTF-8")
# print(args[1])
# print(args[2])
# print(knitfile)
