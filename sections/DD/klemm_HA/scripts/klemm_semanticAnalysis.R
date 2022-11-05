#13451.klemm semantic stylometry
#20221105(08.04)
#aftermath klemm_HA
###################
library(httr)
library(jsonlite)
library(purrr)
library(stylo)
library(igraph)


src<-"https://dracor.org/api/corpora/ger/play/klemm-der-besuch/spoken-text-by-character.json"
#dtajson<-GET(src)
dtatxt<-fromJSON(src)
dtatxt$label
###
#write textfiles
root<-"~/boxHKW/21S/DH"
getwd()
k<-2
typeof(dtatxt$text[[k]])
speakerdir<-paste0(root,"/gith/DH_essais/sections/DD/klemm_HA/data/speaker/")
dir.create(speakerdir)
for (k in 1:length(dtatxt$label)){
  speakerfile<-paste0(speakerdir,"klemm_",dtatxt$id[k],".txt")
  writeLines(dtatxt$text[[k]],speakerfile)
#  writeLines(dtatxt$text[[k]],paste0(speakerdir,dtatxt$label[k],"test.txt"))
  
  }
#stilometrie
setwd(paste0(root,"/gith/DH_essais/sections/DD/klemm_HA/stylo"))
getwd()
#corpusdir<-
stylo(gui=T,corpus.dir = speakerdir)
#network
dtanet<-read.csv("stylo_Consensus_100-100_MFWs_Culled_0__Classic Delta_C_0.5_EDGES.csv")
net <- read_graph("stylo_Consensus_100-100_MFWs_Culled_0__Classic Delta_C_0.5_EDGES.csv", format="edgelist")


