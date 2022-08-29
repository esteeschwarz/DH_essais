install.packages("gutenbergr")
library(gutenbergr)
library(devtools)
library(dplyr)
path2 <- "corpus/"

csvlist = "https://docs.google.com/spreadsheets/d/e/2PACX-1vT87reVxrWeaYiRL6hP-fnPB9MX6Rq4eZHdEURjbzY5MbY7Q5Y59MWZYc309CqIqLxBmdaRog5BhbWn/pub?gid=0&single=true&output=csv"

booklist <- read.csv(csvlist, header = TRUE, stringsAsFactors=FALSE)
for (row in 1:nrow(booklist)){
  bookname <- booklist[row,4]
  stylotext <- gutenberg_download(booklist[row,1])
  stylotext <- select(stylotext, text)
  write.table(stylotext, file = paste0(path2, bookname), sep="", row.names = FALSE)
}
dta<-gutenberg_works(languages = "de")
kant1<-subset(dta,dta$author=="Kant, Immanuel")
kant1<-gutenberg_download(kant1)
m<-gregexpr("deutsch",kant_txt)
regmatches(kant_txt,m)
kant_txt<-kant1$text
kant_txt
library(stringi)
stri_extract_all_regex(kant_txt,"d")
sum(x[[2]]=="d",na.rm = T)
x[[1]]
x[[2]]
length(x[[2]])
