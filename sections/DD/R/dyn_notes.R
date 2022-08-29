extracted<-1
getwd()
ld1<-0
le1<-0
ld3<-0
le3<-0
filename<-"samplex"
# Create a corpus object
dta<-("data/samplepdf.pdf")
dta<-"data/wolfout_mod.txt"
library(quanteda)
dta_cor <- corpus(d1)

# Preliminary information about the corpus
tokenInfo <- summary(dta_cor, 109)
tokenInfo 
tokens(d1)
sumcorp<-summary(d1)
sumcorp
if (extracted==1){
  
textpdf<-pdf_text("data/samplepdf.pdf")
d1<-textpdf
d2<-stri_extract_all_words(d1)
ld1<-length(d2[[1]])
extract_types<-unique(d2[[1]])
ld3<-length(extract_types)
}
extracted<-2

if (extracted==2){
  texttxt<-readtext("data/wolfout_mod.txt")$text
  e1<-texttxt
  e2<-stri_extract_all_words(e1)
  le1<-length(e2[[1]])
  extract_types<-unique(e2[[1]])
  le3<-length(extract_types)
  match(extract_types[1:le3],e2)
 sum( extract_types[2] %in% e2[[1]])
 duplicated(e2[[1]])
}
e2[[1]]
match ("aaron",e2[[1]])
cat("extracted data overview:\n")
cat(filename,"\n")
cat("tokens:",l1<-ld1+le1,"\n")
cat("types: ",l3<-ld3+le3,"\n")
cat("type/token relatio:",l3/l1,"\n")
cat("-------\n")
ns<-c("lfd","type","file")
typetable<-cbind(1:length(extract_types),extract_types,filename)
colnames(typetable)<-ns
print(typeof(typetable))
# colnames(extract_types)<-ns
# write.csv(extract_types,tempfile("temp.csv"))
#read.csv("temp.csv")
print(extract_types)
print(typetable)
cat(typetable,sep = "\n")
write(typetable,"")
library(clipr)
(write.csv(typetable))
cat("...",for (k in 1:4000){cat(k)})
