#13403.twitter body
#20221003(17.15)
################
scpath<-"~/boxHKW/21S/DH/local/twitter_a/"
s1<-paste0(scpath,"meloni_09-25_1-2189.csv")
s3<-paste0(scpath,"meloni_09-27--10-02_1-4575.csv")
s2<-paste0(scpath,"meloni_09-26_1-7892.csv")

d1<-read.csv2(s1)
d2<-read.csv2(s2)
d3<-read.csv2(s3)

# d1t<-d1$X2..Tweet
# d2t<-d2$X2..Tweet
# d3t<-d3$X2..Tweet
# d4t<-c(d1t,d2t,d3t)

library(stylo)
dim(d1[])
length(d1[,1])
length(d1$X2..Tweet)
length(d1$X6..Autor)
dir.create("~/boxHKW/21S/DH/local/twitter_a/corpus3/")
path2<-"~/boxHKW/21S/DH/local/twitter_a/corpus3/"
#strip _ from author name
regx1<-"_"
repl1<-""
d1$stripauthor<-gsub(regx1,repl1,d1$X6..Autor)
for (row in 1:length(d1$X2..Tweet)){
  bookname <- d1$stripauthor[row]
  stylotext <- d1$X2..Tweet[row]
  #  stylotext <- select(dta, text)
  write.table(stylotext, file = paste0(path2, bookname,"_",row,".txt"), sep="", row.names = FALSE)
}
d1$X6..Autor[1]

stylo(corpus.dir = path2, analysis.type = "PCR", mfw.min = 50, mfw.max = 500, custom.graph.title = "twitter body analysis", write.png.file = TRUE, gui = TRUE)

stylo(corpus.dir = path2)
