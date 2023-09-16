showcommunities<-function(){
# library(igraph)
# #install.packages("lsa")
# library(lsa)

src<-"https://dracor.org/api/corpora/ger/play/klemm-der-besuch/networkdata/graphml"
src2<-"https://dracor.org/api/corpora/ger/play/klemm-der-besuch/networkdata/csv"
src3<-"https://dracor.org/api/corpora/ger/play/klemm-der-besuch/cast/csv"
# Möglichkeit 1: graphml Datei als igraph-Objekt einlesen
net <- read_graph(src, format="graphml")
nodes <- read.csv(src3, header=T, as.is=T) #nodelist ist cast list (list of characters) !!!> src3
edges <- read.csv(src2, header=T, as.is=T) #edgelist ist network data" !!!> src2
indeg <- degree(net, mode = "in",  # mode = "out" für outdegree centrality, "all" für gesamte Dichte
                   v = V(net), # V(net) ohne Zugriff auf eine spezielle Spalte bedeutet, dass ids verwendet werden
                   loops = TRUE, normalized = FALSE)

nodes["indegree"] = indeg
#nodes$name[nodes$indegree >= 4] # Figuren mit indegree größer oder gleich 4 
#nodes$name[max(nodes$indegree)] # Figur mit dem höchsten indegree Wert


# # Graph mit Knotengröße nach Grad skaliert
# plot(net, edge.arrow.size=.4,
#      vertex.size=indeg, vertex.color=col,
#      vertex.label=V(net)$name.label,
#      vertex.label.cex=.6)
# 
# # Kantendicke nach Gewicht skalieren
# plot(net, edge.arrow.size=.4,
#      vertex.cex=.6, vertex.color="white",
#      vertex.label=V(net)$name, vertex.label.cex = .6,
#      edge.weight=2, edge.width=(E(net)$weight/5))
# 
# # 5. Netzwerklayout ändern
# 
# layout_1 <- layout_in_circle(net, order = V(net))
# layout_2 <- layout_with_fr(net)
# 
# plot(net, edge.arrow.size=.4,
#      vertex.cex=.6, vertex.color="white",
#      vertex.label=V(net)$media, vertex.label.cex = .6,
#      edge.weight=2, edge.width=(E(net)$weight/5),
#      layout = layout_1)
# 
# 6. Community Detection

layout_3 <- layout_with_fr(net)

# "greedy-Methode" anwenden 
c1 = cluster_fast_greedy(net)
#modularity(c1)
# modularity matrix erstellen
B = modularity_matrix(net, membership(c1))
#round(B[1,],2)
# Anzahl Communities
#length(c1)
# Größe der Communities
#sizes(c1)
# Communities mit Knotenfarbe unterscheiden
n<-15
# plot(net, edge.arrow.size=.4,
#      vertex.size=n, vertex.color=membership(c1),
#      vertex.label=V(net)$id,
#      vertex.label.cex=.6, 
#      layout=layout_3)
# Communities mit farbigem Hintergrund umrahmen 
plot(c1, net, edge.arrow.size=.4,
     vertex.size=n, vertex.color=membership(c1),
     vertex.label=V(net)$gender,
     vertex.label.cex=.8, 
     layout=layout_3)
#####################
# Tutorial mit verschiedenen Methoden zur Identifizierung von Communities:
# https://users.dimi.uniud.it/~massimo.franceschet/R/communities.html

coords<-layout_3
g<-net
c4 = cluster_optimal(net)
#plot(c4, net, layout=layout_3)
#c3 = cluster_edge_betweenness(net)
#plot_dendrogram(c3)
#plot(net, vertex.color=membership(c3), layout=layout_3)
#plot(c4, g, layout=coords)

# hierarchical clustering
A = get.adjacency(g, sparse=FALSE)

# cosine similarity

S = cosine(A)

# distance matrix
D = 1-S

# distance object
d = as.dist(D)

# average-linkage clustering method
cc = hclust(d, method = "average")
#cc$labels
# plot dendrogram
plot(cc,labels = nodes$name)
#plot
# draw blue borders around clusters
clusters.list = rect.hclust(cc, k = 3, border="blue")
}