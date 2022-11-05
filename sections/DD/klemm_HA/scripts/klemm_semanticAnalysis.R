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
speakerdir<-paste0(root,"/gith/DH_essais/sections/DD/klemm_HA/stylo/corpus/")
dir.create(speakerdir)
for (k in 1:length(dtatxt$label)){
  speakerfile<-paste0(speakerdir,"klemm_",dtatxt$id[k],".txt")
  writeLines(dtatxt$text[[k]],speakerfile)
#  writeLines(dtatxt$text[[k]],paste0(speakerdir,dtatxt$label[k],"test.txt"))
  
  }
#stilometrie, get MFW / edges list
setwd(paste0(root,"/gith/DH_essais/sections/DD/klemm_HA/stylo"))
getwd()
#corpusdir<-
stylo(gui=T,corpus.dir = speakerdir)
stylo
#network according to MFW
#dtanet<-read.csv("stylo_Consensus_100-100_MFWs_Culled_0__Classic Delta_C_0.5_EDGES.csv")
edges <- read.csv("stylo_Consensus_100-100_MFWs_Culled_0__Classic Delta_C_0.5_EDGES.csv")
net <- graph_from_data_frame(d=edges, 
                             directed=FALSE) 
n <- 25 # für die Knotengröße
col <- "orange" # für die Knotenfarbe
V(net)$name<-dtatxt$label

# Knotengröße ändern
plot(net, edge.arrow.size=.4,vertex.label=NA, 
     vertex.size=n)

# Gekrümmte Kanten (edge.curved=.4) :
plot(net, edge.arrow.size=.4,
     vertex.size=n, vertex.color=col,
     vertex.label=V(net)$name,
     vertex.label.cex=.8, edge.curved=.5)
#net
x<-1
x<-stylo(mfw.min = 100,mfw.max = 100,analysis.type = "CA",corpus.dir<-speakerdir,output="screen")
install.packages("networkD3")
library(networkD3)
#stylo(corpus.dir = path2, analysis.type = "CA", mfw.min = 100, mfw.max = 3000, custom.graph.title = "Klemm vs. Others", write.png.file = TRUE, gui = FALSE)
# BCT or CA
#stylo(corpus.dir = path2, gui = T)
nodes<-x$list.of.nodes
edges<-x$list.of.edges
net2 <- graph_from_data_frame(d=edges, vertices=nodes,directed=FALSE) 
