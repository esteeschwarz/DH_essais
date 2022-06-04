# 12172.DH
# 20220424(16.43)
#################
#goethe wilhelm meister 1-8: (2335)-(2343)
src1<-"https://gutenberg.org/ebooks/2335.txt.utf-8"
src2<-"https://gutenberg.org/ebooks/2336.txt.utf-8"
src3<-"https://gutenberg.org/ebooks/2337.txt.utf-8"
src4<-"https://gutenberg.org/ebooks/2338.txt.utf-8"
src5<-"https://gutenberg.org/ebooks/2339.txt.utf-8"
src6<-"https://gutenberg.org/ebooks/2340.txt.utf-8"
src7<-"https://gutenberg.org/ebooks/2341.txt.utf-8"
src8<-"https://gutenberg.org/ebooks/2342.txt.utf-8"

#get text
ext<-function(src){
  dta<-scan(src,"character",quote = c("\'","\""),na.strings = c(",",".",";","-"))
  start<-which(dta=="PRINT!")
  start2<-start[1]+20
  startbook<-which(dta[start[1]:start2]=="Wilhelm")
  start1<-startbook-1
  dta4<-dta[start[1]+start1:length(dta)]
  dta5<-dta4[!is.na(dta4)]
}

bd1<-ext(src1)
bd2<-ext(src2)
bd3<-ext(src3)
bd4<-ext(src4)
bd5<-ext(src5)
bd6<-ext(src6)
bd7<-ext(src7)
bd8<-ext(src8)

#get unique words
  bduni<-cbind(unique(bd1),
               unique(bd2),
               unique(bd3),
               unique(bd4),
               unique(bd5),
               unique(bd6),
               unique(bd7),
               unique(bd8))

  
barplot(cbind(
"I"=ttr1<-length(bduni[,1])/length(bd1),
"II"=ttr2<-length(bduni[,2])/length(bd2),
"III"=ttr3<-length(bduni[,3])/length(bd3),
"IV"=ttr4<-length(bduni[,4])/length(bd4),
"V"=ttr5<-length(bduni[,5])/length(bd5),
"VI"=ttr6<-length(bduni[,6])/length(bd6),
"VII"=ttr7<-length(bduni[,7])/length(bd7),
"VIII"=ttr8<-length(bduni[,8])/length(bd8)
),main="type-token ratio Wilhelm Meister 1-8")

# nice comes...
#12175.big fail: double checking the ttr with https://voyant-tools.org
#gives different results. the scan method here gets not the correct number of words.

#dta1<-scan(src1,"character", quote = c("\'","\""))
#wks.
bd1<-ext(src1)
uni1<-unique(bd1) #type count still differs due to ,.;- types
write_clip(bd1)
library(stringi)
bd11<-stri_replace(bd11,regex=c(","),replacement = "")
head(bd11)
bd12<-scan(bd11,"")
bd13<-stri_split_boundaries(bd11,"word")
unique(bd12)
