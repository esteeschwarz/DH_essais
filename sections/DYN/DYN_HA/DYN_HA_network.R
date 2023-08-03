#13451.klemm semantic stylometry
#20221105(08.04)
#aftermath klemm_HA
###################
#library(httr)
#library(jsonlite)
#library(purrr)
library(stylo)
library(igraph)
#library(network)


# src<-"https://dracor.org/api/corpora/ger/play/klemm-der-besuch/spoken-text-by-character.json"
# #dtajson<-GET(src)
# dtatxt<-fromJSON(src)
# dtatxt$label
###
#write textfiles
root<-"~/boxHKW/21S/DH"
# getwd()
# k<-2
# typeof(dtatxt$text[[k]])
# speakerdir<-paste0(root,"/gith/DH_essais/sections/DD/klemm_HA/stylo/corpus/")
# dir.create(speakerdir)
# for (k in 1:length(dtatxt$label)){
#   speakerfile<-paste0(speakerdir,"klemm_",dtatxt$id[k],".txt")
#   writeLines(dtatxt$text[[k]],speakerfile)
# #  writeLines(dtatxt$text[[k]],paste0(speakerdir,dtatxt$label[k],"test.txt"))
#   
#   }
#stilometrie, get MFW / edges list
# setwd(paste0(root,"/local/DYN/db_sf/corpus"))
# speakerdir<-(paste0(root,"/local/DYN/db_sf/corpus"))
getwd()
workdir<-paste(root,"local/DYN/network",sep = "/")
setwd(workdir)
library(xfun)

#corpusdir<-
stylo(gui=T,corpus.dir = speakerdir)
stylo
x<-stylo(mfw.min = 30,mfw.max = 70,analysis.type = "CA",corpus.dir<-workdir,output="screen")

#network according to MFW
#dtanet<-read.csv("stylo_Consensus_100-100_MFWs_Culled_0__Classic Delta_C_0.5_EDGES.csv")
f<-list.files(workdir)
f
iscsv<-grep("csv", file_ext(f))
src<-f[iscsv][2]
#edges <- read.csv("stylo_Consensus_100-100_MFWs_Culled_0__Classic Delta_C_0.5_EDGES.csv")
edges <- read.csv(src)
net <- graph_from_data_frame(d=edges, 
                             directed=FALSE) 
n <- 5 # für die Knotengröße
col <- "orange" # für die Knotenfarbe
V(net)$name<-dta_t$head

# Knotengröße ändern
# Gekrümmte Kanten (edge.curved=.4) :
plot(net, edge.arrow.size=.5,
     vertex.size=n, vertex.color=col,
     vertex.label=V(net)$name,
     vertex.label.cex=.5, edge.curved=.6)
#net
# x<-1
# install.packages("networkD3")
# library(networkD3)
# #stylo(corpus.dir = path2, analysis.type = "CA", mfw.min = 100, mfw.max = 3000, custom.graph.title = "Klemm vs. Others", write.png.file = TRUE, gui = FALSE)
# # BCT or CA
# #stylo(corpus.dir = path2, gui = T)
# nodes<-x$list.of.nodes
# edges<-x$list.of.edges
# net2 <- graph_from_data_frame(d=edges) 
# edges<- edges[,c("Source", "Target", "Weight")]
#  edges # überprüfen
# # # neue Kantenliste speichern
# # write.csv(edges_df, "ger000577-klemm-der-besuch_edges.csv", quote=FALSE, row.names=FALSE) # alte Kantenliste überschreiben
# # 
# # # Kantenliste neu einlesen: 
# # edges <- read.csv("ger000577-klemm-der-besuch_edges.csv", header=T, as.is=T) 
# #
#  
# network(x,vertices=x$list.of.nodes)
# is.network(edges_df$Weight)
# 
# # simple networks with vertices =======================================================
# simple_edge_df <- data.frame(
#   from = c("b", "c", "c", "d", "a"),
#   to = c("a", "b", "a", "a", "b"),
#   weight = c(1, 1, 2, 2, 3),
#   stringsAsFactors = FALSE
# )
# simple_edge_df
# simple_vertex_df <- data.frame(
#   name = letters[1:5],
#   residence = c("urban", "rural", "suburban", "suburban", "rural")
# )
# simple_vertex_df
# 
# net3<-(as.network(simple_edge_df, vertices = simple_vertex_df))
# plot(net3, edge.arrow.size=.4,label=simple_vertex_df$name, 
#      vertex.size=n)
# simple_vertex_df$residence
#   plot(net4,label=nodes$id)
# 
#   
#   a1<-data.frame(
#     from = edges$Source,
#     to = edges$Target,
#     weight = edges$Weight)
#   net4<-as.network(a1)
#   speaker<-paste0("klemm_",nodes$id)
#   nodes$speaker<-speaker  
# nodes
# 
# library(syuzhet)
# a2<-get_sentiment(dtatxt$text[5[1:4]],method = "syuzhet",language = "german")
# a2
# dtatxt$text[[5]][1:4]
