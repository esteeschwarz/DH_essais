#external script for Rmd frontend
writeimage<-function(top){

  #top<-100000
a<-sample(top,top)
c<-sqrt(length(a))
b<-matrix(a,c,c)
#add
image(b)
}