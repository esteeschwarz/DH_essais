#13472.N-PRG.CA
#20221120(08.46)
#neuropragmatik conversation analysis
################
#mini
setwd("~/boxHKW/21S/DH/")
#lapsi, ewa
#setwd("~/boxHKW/UNI/21S/DH/")

path1<-"local/CA/PRG/expo/"
src<-list.files(path1)
src<-paste0(path1,src)
trans_ns<-c("tier","type","speaker","text","start","end","category","label")
dta<-read.csv2(src,header=F,sep = "\t",col.names = trans_ns)
library(readr)
dta <- read_delim("local/CA/PRG/expo/PRG_CA_elanSF-chat002EoutEX-OX-EX.csv", 
                  delim = "\t", escape_double = FALSE, 
                  col_names = trans_ns, trim_ws = TRUE)

###
trp<-dta$category=="TRP"
trp1<-dta$start[trp]
trp2<-c(dta$start[1],trp1)
trp3<-c(trp1,dta$end[length(dta$end)])
trp4<-trp3-trp2
barplot(trp4)
library(syuzhet)
trp5<-get_transformed_values(trp4)
plot(trp5,type = "h")
plot(trp5,type="h",main="TRP evaluation",ylab="relative length of phase",xlab="flow of conversation",col=2)
points(trp5, cex = .2, col = "dark red")
###wks.
spk0<-dta$speaker=="SPK_SP0"&dta$category=="main"
spk1<-dta$speaker=="SPK_SP1"&dta$category=="main"
spk2<-dta$end[spk0]
spk3<-dta$end[spk1]
spk4<-dta$start[spk0]
spk5<-spk2-spk4 #
spk5[spk0]
sum(spk0)
sum(spk1)
spk6<-dta$start[spk1]
spk7<-spk3-spk6
sum(spk7)
sum(spk5)
spk8<-get_transformed_values(spk5)
spk9<-get_transformed_values(spk7)
plot(spk8,type="h",main="utterance length ~ dialog",ylab="relative length of phase (ms)",xlab="flow of conversation",col=2)
par(new=T)
plot(spk9,type="h",ann = F,col=3,yaxt="n")
spk10<-(1/spk9-1/spk8)
#spk10<-sqrt(spk10*spk10)
#spk10<-get_transformed_values(spk10)
par(new=T)
plot(spk10,type="l",ann = F,col=4,yaxt="n")
download.file()
speval$time<-1:10
cbind("alp"=1:10,"bald"=21:30)

?embed_file
getwd()
setwd
library(clipr)
?citation
write_clip(toBibtex(citation("syuzhet")))
###
list(title = "Syuzhet: Extract Sentiment and Plot Arcs from Text", author = list(list(given = c("Matthew", "L."), family = "Jockers", role = NULL, email = NULL, comment = NULL)), year = "2015", url = "https://github.com/mjockers/syuzhet")
@Manual{,
  title = {Syuzhet: Extract Sentiment and Plot Arcs from Text},
  author = {Matthew L. Jockers},
  year = {2015},
  url = {https://github.com/mjockers/syuzhet},
}

library(httr)

x<-GET("https://api.zotero.org/groups/4713246/collections/YTVL6QLM/items/top?format=bibtex")
bib<-content(x,"text")
y<-tempfile("ref",fileext = ".bib")
write_lines(bib,y)
readLines(y)
writel
y
###DYN plotting
par(new=T)
plot(spk10,type="l",ann = F,col=4,yaxt="n")

