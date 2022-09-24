library(ggplot2)

ns<-c("year","mannsbild","mannsperson","heurath","heyrath","heyraht","heirath","heiraht","heirat","hochzeit")

#d<-"data/dhist-plot.perl-4.txt"
getdta<-function(){

d<-"data/dhist-plot.perl-4.txt"
d1<-read.delim(d)
#d1[,3]<-colnames(d1)[1]
d1[,3]<-ns[2]

d<-"data/dhist-plot.perl-5.txt"
d2<-read.delim(d)
d2[,3]<-ns[3]
d<-"data/dhist-plot.perl-6.txt"
d3<-read.delim(d)
d3[,3]<-ns[4]
d<-"data/dhist-plot.perl-7.txt"
d4<-read.delim(d)
d4[,3]<-ns[5]
d<-"data/dhist-plot.perl-8.txt"
d5<-read.delim(d)
d5[,3]<-ns[6]
d<-"data/dhist-plot.perl-9.txt"
d6<-read.delim(d)
d6[,3]<-ns[7]
d<-"data/dhist-plot.perl-10.txt"
d7<-read.delim(d)
d7[,3]<-ns[8]
d<-"data/dhist-plot.perl-11.txt"
d8<-read.delim(d)
d8[,3]<-ns[9]
d<-"data/dhist-plot.perl-12.txt"
d9<-read.delim(d)
d9[,3]<-ns[10]

nst<-c("count","year","token")
colnames(d1)<-nst
colnames(d2)<-nst
colnames(d3)<-nst
colnames(d4)<-nst
colnames(d5)<-nst
colnames(d6)<-nst
colnames(d7)<-nst
colnames(d8)<-nst
colnames(d9)<-nst

dr<-rbind(d1,d2,d3,d4,d5,d6,d7,d8,d9)
}
df<-as.data.frame(getdta())
dc<-getdta()
#mannsperson, heurath, heyrath, heyraht, heirath, heiraht, heirat, hochzeit
dc<-cbind(d1[2],d1[,1],d2[,1],d3[,1],d4[,1],d5[,1],d6[,1],d7[,1],d8[,1],d9[,1])
dr<-rbind(d1[,1],d2[,1],d3[,1],d4[,1],d5[,1],d6[,1],d7[,1],d8[,1],d9[,1])
d1[,1]
dr<-c(d1[,1],d2[,1],d3[,1],d4[,1],d5[,1],d6[,1],d7[,1],d8[,1],d9[,1])

#dc<-getdta()
# #nst<-c("sum","year","token")
# colnames(d1)<-nst
# colnames(d2)<-nst
# colnames(d3)<-nst
# colnames(d4)<-nst
# colnames(d5)<-nst
# colnames(d6)<-nst
# colnames(d7)<-nst
# colnames(d8)<-nst
# colnames(d1)<-nst
# colnames(d1)<-nst
# colnames(d1)
# d1[,3]<-colnames(d1)[1]
# d1
# dr<-rbind(d1,d2,d3,d4,d5,d6,d7,d8,d9)
# d1[,1]
# colnames(dc)<-ns
# rownames(dc)<-d1[,2]
#ggplot(as.data.frame(dc))
df<-as.data.frame(dc)
#p <- ggplot(data=df,mapping=aes(x=year,
                                y=count))
#p
#p + geom_point(group="token",color="black")
#library(ggplot2)

ggplot(df, aes(year, count, colour = token)) + 
  geom_line()
#plot(df$year,df$count,type="l" )
#help("plot")
