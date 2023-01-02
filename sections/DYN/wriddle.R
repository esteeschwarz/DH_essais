#13521.topic modeling fast essai
#20221224(08.45)
################
#wriddle text source: TAGESSPIEGEL 

library(tm)
library(Hmisc)  
library(stringi)
library(clipr)
dta<-"local/DYN/db/wriddle.txt"
dta<-readLines(dta)
w<-stri_extract_all_words(dta)

keys<-list()
 getkeys<-function(w){
   wstop1<-wstop
   wstopc<-capitalize(wstop1)
   wstop3<-c(wstop1,wstopc)
  for (tnr in 1:length(w)){
  w2<-w[tnr]
  df1<-unlist(w2)
  df2<-df1[!df1 %in% wstop3]
  tf<-termFreq(df2)
  f<-findMostFreqTerms(tf)
  f
  keys[[tnr]]<-f
  }
  keys[[3]]
k2<-unlist(keys)
exc<-NA
k3<-k2[!k2 %in% exc]
k4<-names(k3)
}
####################
# REF: stopwordlist obtained: https://github.com/TobiasPottgueter/StopWordList_deDE.git
source("https://github.com/esteeschwarz/DH_essais/raw/main/sections/DYN/wriddle_getstopwords.R")
keywords<-getkeys(w)
keywords
keys1<-stri_join(keywords,collapse = ",")
write_clip(keys1) # just for paste to blog entry, could be simpler...
###wks.
#######
#2nd keywordlist from: https://ske.li/wriddle_keys
keydf<-read.csv("https://github.com/esteeschwarz/DH_essais/raw/main/data/wriddle_sketchE_keys.csv")
keys2<-stri_join(keydf$item,collapse = ",")
write_clip(keys2) # just for paste to blog entry, could be simpler...
keys2
#3rd list with rank after frequency:
#key3<-order(keydf$relative.frequency.focus,decreasing = T)
#order(keydf$relative.frequency.focus,decreasing = T)
#order()
key3<-keydf[with(keydf,order(keydf$Score,decreasing=T)), ]
#for paritätische gründe select 66 highest score entries
key4<-key3$item[1:length(keywords)]
write_clip(stri_join(key4,collapse = ","))
###
intersect <- function(x, y) y[match(x, y, nomatch = 0)]
intersect # the R function in base is slightly more careful
key5<-intersect(keywords, key4) #only 4

