#neuropragmatik conversationsanalyse
#20221205(14.32)
################
library(readr)
getwd()
path<-paste0(getwd(),"/local/CA/PRG/nprg_ca_002/")
path
src<-paste0(path,"output/nprg_ca_002_csv.csv")
dta<-read_delim(src,"\t",skip = 1,col_names = c("spk1","t","spk2","text","start","end","tier"))
trp<-1
dta$source<-0
dta$target<-0
source<-spk0
dta$trp<-NA
for (k in 1:length(dta$spk2)){
  spk0<-dta$spk2[k]
  spk1<-dta$spk2[k+1]
   #print(spk)
  ifelse (spk0==spk1,dta$source[k]<-spk0,
          dta$source[k]<-spk0)
  ifelse (spk0==spk1,dta$target[k]<-spk0,
          dta$target[k]<-spk1)
  ifelse (spk0==spk1,dta$trp[k]<-NA,
          dta$trp[k]<-paste0(k,": ",spk0," > ",spk1))
  
    ifelse (spk0==spk1,target<-spk0,target<-spk1)
  ifelse (spk0==spk1,source<-spk0,source<-spk1)

  
  print(trp)
#  dta$source[k]<-source
 # dta$target[k]<-target
  #if (k!=1){dta$target[k-1]<-target}
  #if (k!=1){dta$source[k-1]<-source}
  
}
dta$gap0<-0
dta$gap1<-0
dta$gap<-0
###wks df
###try compute gaps
for (k in 1:length(dta$spk2)){
  spk0<-dta$source[k]
  spk1<-dta$target[k]
  if (spk0!=spk1){
    dta$gap0[k]<-dta$end[k-1]
    dta$gap1[k+1]<-dta$start[k]
  
      #   for (i in k:1){
  #     spx0<-dta$spk2[i]
  #     ifelse(spx0!=spk0,dta$gap0[k]<-dta$end[k],dta$gap0<-0)
  #     
  # }
  }
  dta$gap[k]<-dta$gap0[k]-dta$gap1[k]
#dont.  
}
#try über pausen mean
dta$length_p<-dta$end-dta$start
sum(dta$length)
dta$length_p[dta$spk2=="SPK2"]<-0
#dta$length[dta$spk2=="SPK2"]<-0
x<-sum(dta$length)-sum(dta$length_p) #pausen duration complete
pa<-length(dta$spk2[dta$spk2=="SPK2"]) #pausen count complete
avg_pa<-x/pa #avg pausen duration
median(dta$length[dta$spk2=="SPK2"])
