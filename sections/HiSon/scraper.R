#13307.HiSon.dialect.diachron
#20230721(18.31)
#prepare dataset j. salmons
#task: get information on dialect appearance/notion
###########################

library(xml2)
library(readr)
library(httr)
library(purrr)
library(clipr)

src<-"data/concordance_preloaded_detenten20_rft3_20230721183028_ext2.xml"
src2<-"data/concordance_preloaded_detenten20_rft3_20230721180519_ext2.csv"
f<-list.files("data")
fcsv<-paste("data",f[5],sep = "/")
fxml<-paste("data",f[6],sep = "/")
d1<-read_csv(fcsv)
d2<-read_xml(fxml)
###
ref<-d1$corpus[5]
url_df<-stri_split_regex(ref,",",simplify = T)
url_bare<-url_df[2]
t1<-GET(url_bare)
html1<-httr::content(t1,"text")
html2<-read_html(html1)
html1
write_clip(url_bare)
