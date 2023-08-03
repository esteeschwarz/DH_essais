#13222.playground essais
########################
# 1.
x<-array()
y<-array()
z<-array()
z1<-array()
z2<-array()

for (t in 1:100){
  for (k in 1:t){
    n <- k
    x[k]<-n/sum(1:n)*n
    y[k]<-2-x[k]
    z[k]<-x[k]*y[k]
    x1<-sum(z)
    z1<-z*x1
  }
  x
  #plot(x)
  #plot(y)
  #plot(z)
  #z
  #x1<-sum(z)
  #plot(z1)
  z2[t]<-sum(z1)
  #x2<-z2*z
  #z2[k]<-z1
}
plot(z2)  
z2
################