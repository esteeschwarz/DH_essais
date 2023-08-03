source("hux_ha_src.R")
install.packages("lmerTest")
speed<-dta$timeinterval/dta$char
mean(speed)
speed<-dset$timeinterval/dset$char
speed<-dset$char/dset$timeinterval
dset$charsec<-speed*mean(dset$char)
boxplot(dset$charsec~dset$group,outline=F, notch=T,range=0.4,
        main="reading speed / phrase & group",
        xlab=paste0("observations limited to ",xlab),ylab = "speed")
dsub1<-subset(dset,dset$target==0)
b1<-boxplot(dsub1$addproctbychar~dsub1$group,outline=F, notch=T,range=0.4,
        main="reading speed / phrase & group",
        xlab=paste0("observations limited to ",xlab),ylab = "speed")
b1$conf
b1$stats
ev<-"SM > ISM > EM = LC"
bar_df_3[order(bar_df_3[order(bar_df_3$LZ),]$RT),]
