n<-20
f<-1:20
fft<-function(n,f){
  if (n==1){return(f)}
  else {
  #  f<-1:20
    ff<-split(f,1:2)
    #fl<-length(f)
    f1<-ff$`2`
    f1<-c(0,f1)
    fl<-length(f1)
        g1<-f1[1:fl-1]
    n1<-n-2
   # lf<-split(1:length(n),1:2)
    f2<-ff$`1`
    fl<-length(f2)
    u1<-f2[1:fl]
    
        n2<-n/2
    nh<-n2-1
#    g<-fft(n/2,(ff[0],f[2],f[n-2])) #alle geraden elemente
    g<-fft(n2,g1)
    u<-fft(n2,u1) #alle ungeraden elemente
           
 #       u<-fft(n/2,(f[1],f[3],f[n-1])) #alle ungeraden elemente
    #k in 0 to n/2-1
    for (k in 1:nh){
      c[k]<-g[k]+u[k]*(exp(1))^(-2*pi*k/n)
      c[k+n2]<-g[k]-u[k]*(exp(1))^(-2*pi*k/n)
}
          return(c)
  }
}
x<-fft(20,1:20)
f[ff$`2`]
n<-10
f<-1:10
f<-c(1:10)
#step(x,2)
#c(1:10)
#cut(x,1:5)
y<-split(f,1:2)
y$`1`
lx<-length(f)
lxs<-split(1:lx,1:2)
x[lxs$`1`[1]]
#split(10,1:2)
lxs$`1`[lx-5]
n<-5
n2<-n-2
n1<-n-1
f[lxs$`2`[0:n2]]
exp(1)

  