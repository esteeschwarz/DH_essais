#13026.fsi-survey: knit
library(rmarkdown)
#getwd()
src<-"https://www.soscisurvey.de/fsi-survey/?act=Z2l4npjIZMwgHMlZB0oa7GuF"

args <- commandArgs(trailingOnly = TRUE)
id<-"ground"
uber<-args[1]
id<-args[2]
knitfile<-paste0("fsi-knit",uber,".Rmd")
#render("fsi-eval_a.Rmd",encoding="UTF-8")
#render(knitfile,encoding = "UTF-8")
print(args[1])
print(args[2])
print(knitfile)
