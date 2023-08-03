#13062.NPRG_003 audio analysis, praat
#20230205(10.35)
d<-read.csv("nprg003b.csv",colClasses = c("character","character","character","numeric","numeric","numeric"))
d1<-subset(d,d$tn=="f")
d2<-subset(d,d$tn=="m")
ds<-d

s1<-mean(d1$pitch[d1$condition=="critic"])
s2<-mean(d1$pitch[d1$condition=="doubt"])
s3<-mean(d1$pitch[d1$condition=="name"])
s4<-mean(d1$pitch[d1$condition=="request"])
s5<-mean(d1$pitch[d1$condition=="offer"])
s6<-mean(d1$intensity[d1$condition=="critic"])
s7<-mean(d1$intensity[d1$condition=="doubt"])
s8<-mean(d1$intensity[d1$condition=="name"])
s9<-mean(d1$intensity[d1$condition=="request"])
s10<-mean(d1$intensity[d1$condition=="offer"])

df1<-matrix(critic_pitch=s1,intensity_pitch=s6,doubt_pitch=s2,doubt_intensity=s7,name_pitch=s3,name_intensity=s8,request_pitch=s4,request_intensity=s9,offer_pitch=s5,offer_intensity=s10)
df2<-c(s1,s2,s3,s4,s5,s6,s7,s8,s9,s10)
barplot(df1[1,],beside = F)
barplot(df2)
boxplot(d$pitch)

# boxplot(d$pitch[d$condition=="critic"],d$pitch[d$condition=="doubt"],d$pitch[d$condition=="doubt"],
#         d$pitch[d$condition=="name"],d$pitch[d$condition=="request"],d$pitch[d$condition=="offer"])
output<-"pitch"
d<-d1
boxout<-function(set,output){
  d<-set
df3<-data.frame(critic=d[,output][d$condition=="critic"],doubt=d[,output][d$condition=="doubt"],
  name=d[,output][d$condition=="name"],request=d[,output][d$condition=="request"],offer=d[,output][d$condition=="offer"])
#boxplot(df3)}
}
b1<-boxout(d1,"pitch")

b2<-boxout(d2,"pitch")
boxplot(b1,col=2)
#par(new=T)
boxplot(b2,col=2)
df4<-data.frame(critic=d$intensity[d$condition=="critic"],doubt=d$intensity[d$condition=="doubt"],
                name=d$intensity[d$condition=="name"],request=d$intensity[d$condition=="request"],offer=d$intensity[d$condition=="offer"])
boxplot(df4)
s2<-mean(d$pitch[d$condition=="doubt"])
s3<-mean(d$pitch[d$condition=="name"])
s4<-mean(d$pitch[d$condition=="request"])
s5<-mean(d$pitch[d$condition=="offer"])
s6<-mean(d$intensity[d$condition=="critic"])
s7<-mean(d$intensity[d$condition=="doubt"])
s8<-mean(d$intensity[d$condition=="name"])
s9<-mean(d$intensity[d$condition=="request"])
s10<-mean(d$intensity[d$condition=="offer"])
