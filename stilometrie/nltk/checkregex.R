library(stringi)
library(readr)
src<-"/Users/guhl/PRO/git/clones/forTEXT.net/Preprocessing mit NLTK/Werther_Saetze_neu1.txt"
regex<-("(.{5,20}Werther)(.{5,20})")
kwic<-grep(src,pattern=regex)
#write_csv(kwic,"/Users/guhl/PRO/git/clones/forTEXT.net/Preprocessing mit NLTK/rgexout.txt")
print(kwic)