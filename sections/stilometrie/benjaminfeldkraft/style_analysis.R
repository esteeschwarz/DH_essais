getwd()
setwd("~/Documents/GitHub/DH_essais/sections/stilometrie/benjaminfeldkraft")

d<-read.csv("SketchE_eval.csv")
d
NperS<-d$count[3]/d$count[1]
d$eval[3]<-NperS
d$eval[4]<-d$count[4]/d$count[1]
d$eval[5]<-d$count[5]/d$count[1]
d$eval[6]<-d$count[6]/d$count[1]
d$eval[2]<-d$count[2]/d$count[1]
d$eval[7]<-d$count[7]/d$count[1]
