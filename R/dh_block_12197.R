#12197.dh.stylometrie
#20220513(14.26)
#####################
library(stylo)
#corpus<-"..data/corpora/benjamin"
#corpuscpt<-"..data/corpora/grimm-kontrastanalyse/corpus"

setup<-function(){
corpus2<-"~/PRO/git/essais/docs/DH/block/corpora/grimm-kontrastanalyse/corpus/primary_set"
corpus1<-"~/PRO/git/essais/docs/DH/block/corpora/grimm-kontrastanalyse/corpus/secondary_set"
corpus1<-"~/PRO/git/essais/docs/DH/block/corpora/benjamin/kontrast/2"
corpus2<-"~/PRO/git/essais/docs/DH/block/corpora/benjamin/kontrast/3"

}
#work<-"~/PRO/git/essais/docs/DH/block/temp"
#stylo(corpus.dir = corpus, path=work, gui = T)
#comp_e<-oppose(primary.corpus.dir=corpus1,secondary.corpus.dir=corpus2,path=work)
#funktionsfehler: setzt WD nicht von R WD aus, also path absolut bestimmen
#comp$comparison

#library(stringi)

#stri_detect_regex()
###################
#src<-"/Users/guhl/PRO/git/clones/forTEXT.net/Preprocessing mit NLTK/Werther_Saetze_neu1.txt"
#txt<-scan(src," ")
#regex<-"(.{5,20}Werther)(.{5,20})"
#regex="Werther"
#kwic<-grep(pattern=regex,txt,value=T)
#write_csv(kwic,"/Users/guhl/PRO/git/clones/forTEXT.net/Preprocessing mit NLTK/rgexout.txt")
#print(kwic)
###########
#corpus cite:
#Rauh, Christian; Schwalbach, Jan, 2020, 
#"The ParlSpeech V2 data set: Full-text corpora of 6.3 million 
#parliamentary speeches in the key legislative chambers of nine representative democracies", 
#https://doi.org/10.7910/DVN/L4OAKN, Harvard Dataverse, V1
###
#src<-"//dataverse.harvard.edu/api/access/datafile/:persistentId?persistentId=doi:10.7910/DVN/L4OAKN/PCYUNY"
#src<-"//dataverse.harvard.edu/file.xhtml?persistentId=doi:10.7910/DVN/L4OAKN/PCYUNY&version=1.0#"
#con<-gzfile(src)
#dta<-unz("https",filename=src,open = "r")

work<-"~/PRO/git/essais/docs/DH/block/temp"
wd<-"/Users/guhl/Nextcloud/UNI/21S/DH/"
src<-"/Users/guhl/Nextcloud/UNI/21S/DH/data/corpus/BT/Corp_Bundestag_V2.rds"
dta<-readRDS(src)
colnames(dta)
party<-unique(dta$party)
#sum(dta$party=="SPD",na.rm = T)
library(stringi)
mean(stri_count_words(dta$text))
#265
corp1<-dta$text[dta$party==party[1]]
corp2<-dta$text[dta$party==party[2]]
corp3<-dta$text[dta$party==party[3]]
corp4<-dta$text[dta$party==party[4]]
corp5<-dta$text[dta$party==party[5]]
corp6<-dta$text[dta$party==party[6]]
corp7<-dta$text[dta$party==party[7]]
corp8<-dta$text[dta$party==party[8]]
corpus<-rbind(corp1,corp2,corp3,corp4,corp5,corp6,corp7,corp8)
library(stylo)
library(dplyr)
##############
#lehrjahre1<-c(2335,2336,2337,2338,2339,2340,2341,2342)
#lehrjahre2<-c("goethe","goethe","goethe","goethe","goethe","goethe","goethe","goethe")
lehrjahre3<-c("WMeister1","WMeister2","WMeister3","WMeister4","WMeister5","WMeister6","WMeister7","WMeister8")
lehrjahre4<-c("goethe_WMeister1.txt","goethe_WMeister2.txt","goethe_WMeister3.txt","goethe_WMeister4.txt","goethe_WMeister5.txt","goethe_WMeister6.txt","goethe_WMeister7.txt","goethe_WMeister8.txt")
partyns<-cbind(party)
partyns[7]<-"k_A"
partyns<-cbind("cdu","linke","spd","fdp","gruene","independent","k_a" ,"afd")
partyns
###
path <- wd
dir.create(path, showWarnings = TRUE)
dir.create(paste0(path, "/temp"))
dir.create(paste0(path, "/data/corpus/BT/temp"))

path2 <- paste0(wd,"/data/corpus/BT/temp/")

for (row in 1:length(partyns)){
  bookname <- partyns[row]
  stylotext <- corpus[,row]
#  stylotext <- select(dta, text)
  write.table(stylotext, file = paste0(path2, bookname,".txt"), sep="", row.names = FALSE)
}
cat("files written")
#stylotext <- select(dta, text)
#write.table(stylotext, file = "data/hegel.txt", sep="", row.names = FALSE)

#corpus[1,1]
#snc
#12202.re
