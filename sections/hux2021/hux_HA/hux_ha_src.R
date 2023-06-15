src_d<-("https://github.com/esteeschwarz/essais/raw/main/docs/hux2021/evaluation/sprdataprepared.csv")
frame_src<-"framesample.html"

# SPR script wrapped -----------------------------------------------------------
###########################

#12144.
#20220405(08.13)
## HUX2021 evaluation, v.2.0, on base of script 12371b.R
# file keeping:
# daten original:
#src_o<-("https://github.com/esteeschwarz/essais/raw/main/docs/hux2021/evaluation/sprdata.csv")
# daten prepared
# src_d<-("https://github.com/esteeschwarz/essais/raw/main/docs/hux2021/evaluation/sprdataprepared.csv")
# evaluation script v.1.x
#src_e<-("https://github.com/esteeschwarz/essais/raw/main/docs/hux2021/evaluation/1237b.R")
###
#library(lme4)
library(lmerTest)
library(stringi)
library(readr)
#library(clipr)
library(ggplot2)
#shinydatascript<-function(set,input)#{
#mdsrc_01<-"~/boxHKW/21S/DH/gith/DH_essais/sections/hux2021/hux_ha_shinyframe01.Rmd"
#mdsrc_01<-"https://raw.githubusercontent.com/esteeschwarz/DH_essais/main/sections/hux2021/hux_ha_shinyframe01.Rmd"
#mdsrc_02<-"~/boxHKW/21S/DH/gith/essais/docs/SPUND_HA/12065.HA.meinschäfer.md"
#mdsrc_02<-"https://raw.githubusercontent.com/esteeschwarz/essais/main/docs/SPUND_HA/hux2021_HA_12304.md"
# src_d<-set
#1
dta<-read.csv2(src_d)
d1ns<-colnames(dta)
d1ns[6]<-"XvsGr"
d1ns
colnames(dta)<-d1ns
sm<-"SM"
em<-"EM"
lc<-"LC"
mm<-"MM"
vso<-"All"
ti<-"ti"
rtc<-"rtc"
rtcc<-"rtcc"
SM<-"SM"
EM<-"EM"
LC<-"LC"
MM<-"MM"
VSO<-"All"
TI<-"ti"
RTC<-"rtc"
RTCC<-"rtcc"
vsAll<-"All"
smvsa<-"SMvsAll"
emvsa<-"EMvsAll"
lcvsa<-"LCvsAll"
mmvsa<-"MMvsAll"
ti0<-100
ticontrol<-100
ti2<-100
# 

# add control observation
adcontrol<-function(set1,ti0,ticontrol,ti2){
  set<-set1
  con1<-set[1,]
  con1
  con1$lfd<-length(set$lfd)+1
  con1$participant<-"admin"
  con1$tnid<-999
  con1$gilt<-1
  con1$group<-"control"
  con1[,6]<-"0Control"
  con1$category<-"control"
  con1$itemId<-"control"
  con1$item<-"control"
  con1$regionId<-"control1"
  con1$elapsedTime<-NA
  con1$timeinterval<-ti0
  con1$target<--1
  con1$string<-"dies ist ein control string medium length"
  con1$char<-stri_count_boundaries(con1$string,"character")
  con1$rt_corr<-NA
  con1$speed<-NA
  con1$adinterval<-NA
  con1$wds<-stri_count_boundaries(con1$string)
  con1$addwds<-NA
  con1$proctbywd<-NA
  con1$addproct<-NA
  con1$proctbywdavg<-NA
  con1$addproctbywds<-NA
  con1$proctbychar<-NA
  con1$addchar<-NA
  con1$addproctbychar<-NA
  con1$explique<-"control string zur festlegung der minimal RT"
  con2<-set[1,]
  con2
  con2$lfd<-length(set$lfd)+2
  con2$participant<-"admin"
  con2$tnid<-999
  con2$gilt<-1
  con2$group<-"control"
  con2[,6]<-"0Control"
  con2$category<-"control"
  con2$itemId<-"control"
  con2$item<-"control"
  con2$regionId<-"control"
  con2$elapsedTime<-NA
  con2$timeinterval<-ticontrol
  con2$target<-0
  con2$string<-"dies ist ein control string medium length"
  con2$char<-stri_count_boundaries(con2$string,"character")
  con2$rt_corr<-NA
  con2$speed<-NA
  con2$adinterval<-NA
  con2$wds<-stri_count_boundaries(con2$string)
  con2$addwds<-NA
  con2$proctbywd<-NA
  con2$addproct<-NA
  con2$proctbywdavg<-NA
  con2$addproctbywds<-NA
  con2$proctbychar<-NA
  con2$addchar<-NA
  con2$addproctbychar<-NA
  con2$explique<-"control string zur festlegung der minimal RT"
  con3<-set[1,]
  con3
  con3$lfd<-length(set$lfd)+3
  con3$participant<-"admin"
  con3$tnid<-999
  con3$gilt<-1
  con3$group<-"control"
  con3[,6]<-"0Control"
  con3$category<-"control"
  con3$itemId<-"control"
  con3$item<-"control"
  con3$regionId<-"control"
  con3$elapsedTime<-NA
  con3$timeinterval<-ti2
  con3$target<-1
  con3$string<-"dies ist ein control string medium length"
  con3$char<-stri_count_boundaries(con3$string,"character")
  con3$rt_corr<-NA
  con3$speed<-NA
  con3$adinterval<-NA
  con3$wds<-stri_count_boundaries(con3$string)
  con3$addwds<-NA
  con3$proctbywd<-NA
  con3$addproct<-NA
  con3$proctbywdavg<-NA
  con3$addproctbywds<-NA
  con3$proctbychar<-NA
  con3$addchar<-NA
  con3$addproctbychar<-NA
  con3$explique<-"control string zur festlegung der minimal RT"
  
  return(rbind(set,con3,con2,con1))
}
dta_o<-dta
#add column with length corrected response times
get_rtc<-function(set){
  set<-data.frame(set)
  charscpt<-stri_count_boundaries(set$string,type="character")
  dtares<-residuals(lm(timeinterval~charscpt,set))
  #dtares<-round(dtares,3)
  #head(dtares)
  #dtap1<-cbind(set,"rtc"=dtares)
  set<-cbind(set,"rtc"=dtares)
  return(set)
}
outl.fun<-function(set,outbottom){
  attach(set)
  outl.form<-set
  sprmean<-mean(timeinterval)
  
  stdev<-sd(timeinterval)
  sdout<-stdev*2.5
  outtop<-sprmean+sdout
  # outbottom<-sprmean-sdout ## negative
  #  outbottommod<-319
  #discard outliers according to subset
  liste<-subset(set,timeinterval<outtop&timeinterval>outbottom)
}
#discard outliers on base of length corrected response time
###
outl.fun.rtc<-function(set){
  # attach(set)
  dtartc<-get_rtc(set)
  #  outl.form<-set
  rtc<-dtartc$rtc
  sprmean<-mean(rtc)
  
  stdev<-sd(rtc)
  sdout<-stdev*2.5
  outtop<-sprmean+sdout
  outbottom<-sprmean-sdout ## negative
  #  outbottommod<-319
  #discard outliers according to subset
  liste<-subset(dtartc,rtc<outtop&rtc>outbottom)
  
}
# #wks. creates subsets for lmer test  
# }
####

dta_setx<-function(setd,t1,t2,t3,xo,g1,g2,out,glt,ctrl){
  
  t1<-chose[1]
  t2<-chose[2]
  t3<-chose[3]
  xo<-chose[4]
  g1<-chose[5]
  g2<-chose[6]
}##post
setvsx<-  function(set1,gro,other){
  gr<-gro
  dta<-set1
  attach(dta)
  sublc<-subset(dta,group==gr)
  subnlc<-subset(dta,group!=gr)
  #  subna<-subset(dta,is.na(group))
  sublc$category=gr
  #subns<-stri_join(gr,"vs",other)
  subnlc$category<-other
  #subna$category<-subns
  lcvsO<-rbind(sublc,subnlc)
  # length(lcvsO$category==gr)-length(lcvsO$category==subns)
  #set<-get_rtc(lcvsO)
  set<-lcvsO
  return(set)
}
####
dtatg<-function(setd,t1,t2,t3,g1,g2){
  setxvso<-setvsx(setd,g1,g2)
  return(subset(setxvso, target==t1|target==t2|target==t3))
  
}
####
dta_grx<-function(set,g1,g2){
  subset(set,group==g1|group==g2)
}
####
#3
####
dtatarget<-function(setd,t1,t2,t3){
  return(subset(setd, target==t1|target==t2|target==t3))
  
}
###
dis_outl<-function(setd,out){
  set<-setd
  set1<-setd
  ifelse(out==1,set1<-outl.fun.rtc(set),set1<-set)
  #ground set2
  set2<-adcontrol(set1,ti0,ticontrol,ti2)
  
  #1
  ifelse(ctrl==1,set2<-adcontrol(set1,ti0,ticontrol,ti2),set2<-set1)
  #2
  set3<-subset(set2,gilt==glt) #subset manuell gefiltert
  
  #sx6<-subset(dta,gilt==1)
  #4,5
  ifelse(xo==1,return(dtatg(set3,t1,t2,t3,g1,g2)),
         return(dta_grx(dtatg(set3,t1,t2,t3,g1,g2),g1,g2)))
  #sx7<-dta_grx(dtatg(dta,0,0,0,sm,em),sm,em)
  #unique(sx7$category)
  #wks. creates subsets for lmer test
}
###
createsets<-function(){
  ch1<-c(0,0,0,0,sm,em)
  ch2<-c(0,0,0,0,sm,lc)
  ch3<-c(0,0,0,0,sm,mm)
  ch4<-c(0,0,0,0,em,lc)
  ch5<-c(0,0,0,0,em,mm)
  ch6<-c(0,0,0,0,lc,mm)
  
  ch11<-c(0,0,1,0,sm,em)
  ch21<-c(0,0,1,0,sm,lc)
  ch31<-c(0,0,1,0,sm,mm)
  ch41<-c(0,0,1,0,em,lc)
  ch51<-c(0,0,1,0,em,mm)
  ch61<-c(0,0,1,0,lc,mm)
  
  ch111<-c(-1,0,1,0,sm,em)
  ch211<-c(-1,0,1,0,sm,lc)
  ch311<-c(-1,0,1,0,sm,mm)
  ch411<-c(-1,0,1,0,em,lc)
  ch511<-c(-1,0,1,0,em,mm)
  ch611<-c(-1,0,1,0,lc,mm)
  
  ch7a<-c(0,0,0,1,sm,vso)
  ch7b<-c(0,0,0,1,em,vso)
  ch7c<-c(0,0,0,1,lc,vso)
  ch7d<-c(0,0,0,1,mm,vso)
  
  ch71a<-c(0,1,0,1,sm,vso)
  ch71b<-c(0,1,0,1,em,vso)
  ch71c<-c(0,1,0,1,lc,vso)
  ch71d<-c(0,1,0,1,mm,vso)
  
  ch711a<-c(-1,1,0,1,sm,vso)
  ch711b<-c(-1,1,0,1,em,vso)
  ch711c<-c(-1,1,0,1,lc,vso)
  ch711d<-c(-1,1,0,1,mm,vso)
  
  chosx<-rbind(ch1,ch2,ch3,ch4,ch5,ch6,ch7a,ch7b,ch7c,ch7d,
               ch11,ch21,ch31,ch41,ch51,ch61,ch71a,ch71b,ch71c,ch71d,
               ch111,ch211,ch311,ch411,ch511,ch611,ch711a,ch711b,ch711c,ch711d)
  chosx[7:12]
  chosx.ns<-c("target -1","target 0","target +1","SMvsOther","group 1","group 2")
  colnames(chosx)<-chosx.ns
  return(chosx)
}
###
getmean<-function(set,chose,out,glt,ctrl,flagall,rt){
  t1<-chose[1]
  t2<-chose[2]
  t3<-chose[3]
  sxo<-chose[4]
  g1<-chose[5]
  g2<-chose[6]
  #rtx
  #chose[4]<-0
  mnset<-dta_setx(set,c(chose[1],chose[2],chose[3],chose[4],chose[5],chose[6]),out,glt,ctrl)
  #  mnset<-dta_setx(dta,c(chose[1],chose[2],chose[3],chose[4],chose[5],chose[6]),1)
  
  flag<-chose[5]
  #  set<-dta_setx(dta,c(0,0,0,1,em,vso),1)
  flagset<-mnset 
  checkvsall<-function(set){
    stri_detect(set$category,regex="vs")
  }
  
  #flag<-vso
  #flagno<-vso
  # flagset<-dta_setx(dta,chose,1)
  # flagall<-1
  # flag<-em
  # rt<-ti
  # chose<-c(0,0,0,1,sm,vso)
  # #######################
  c1<-flagset[with(flagset,category==flag),]
  # length(c1$category)
  ifelse(rt==ti,mn1<-mean(c1$timeinterval),ifelse(rt==rtc,mn1<-mean(c1$rtc),mn1<-mean(c1$rtc.1)))
  
  #    mean(c1$rtx,na.rm=T)
  #c2<-flagset[with(flagset,checkvsall(flagset)),]
  # checkvsall(flagset)
  ifelse(flagall==0,c2<-flagset[with(flagset,group==chose[6]),],
         c2<-flagset[with(flagset,checkvsall(flagset)),])
  ifelse(rt==ti,mn2<-mean(c2$timeinterval),ifelse(rt==rtc,mn2<-mean(c2$rtc),mn2<-mean(c2$rtc.1)))
  # length(c2$category)
  #c2$cat
  #  mn2<-mean(c2$rtx)
  #length(c2$category)
  #mean(c2$rtx,na.rm=T)
  #mn1<-mean(c1$rtx,na.rm=T)
  mnx<-cbind(mn1,mn2)
  rownames(mnx)<-"mean"
  ifelse(flagall==1,col2<-"vsAll",col2<-chose[6])
  colnames(mnx)<-c(chose[5],col2)
  print(mnx)
  
  ###########################
  #c1$category
  
  #chose<-c(0,0,0,0,em,vso)
  #flag<-chose[5]
  #flagset<-dta_setx(dta,c(0,0,0,1,em,vso),1)
  # flagno<-0
  # checkvsall(flagset)
  #   vso<-1
  # flagno<-1
  ###
  #flag<-em
  #flag<-1
  #flagno<-0
  #flagset<-dta_setx(dta,c(0,0,0,1,em,vso),1)
  
  
  #  dta<-mnset
  # 
  #    mn1<-mean(c1$timeinterval,na.rm=T)
  #   mnx<-cbind(mn1,mn2)
  #   rownames(mnx)<-"mean"
  #   ifelse(flagall==1,col2<-"vsAll",col2<-chose[6])
  #   colnames(mnx)<-c(chose[5],col2)
  #     print(mnx)
  #  #return(tb2)
  
} ########## end getmean

###
create_lmeforms<-function(set,resp){
  lme2.form2.rnd<-paste0(         "(1|item)+(1|participant)")
  lme2.form3.rnd<-paste0("(1|char)+(1|item)+(1|participant)")
  ########## TD
  lme2.form2.cat<-paste0(colnames(set)[6])
  ########## 
  lme2.form2.XvsO<-paste0("category")
  lme2.form.cpt<-      paste(lme2.form2.cat, "+",lme2.form2.rnd,"+(1+",lme2.form2.cat, "|participant)")
  lme2.form.cpt.XvsO<- paste(lme2.form2.XvsO,"+",lme2.form2.rnd,"+(1+",lme2.form2.XvsO,"|participant)")
  lme2.form.pure<-     paste(lme2.form2.cat, "+",lme2.form3.rnd,"+(1+",lme2.form2.cat, "|participant)")
  lme2.form.pure.XvsO<-paste(lme2.form2.XvsO,"+",lme2.form3.rnd,"+(1+",lme2.form2.XvsO,"|participant)")
  
  rtc<-"rtc ~ "
  rtcc<-"rtc.1 ~ "
  ti<-"timeinterval ~ "
  ifelse(resp=="rtc",rt<-rtc,ifelse(resp=="rtcc",rt<-rtcc,rt<-ti))
  (fmlRTCgr <- as.formula(paste("rtc ~ ", lme2.form.cpt)))
  (fmlTIgr <- as.formula(paste("timeinterval ~ ", lme2.form.cpt)))
  (fmlTIvs<-  as.formula(paste("timeinterval ~ ", lme2.form.cpt.XvsO)))
  (fmlRTCvs <- as.formula(paste("rtc ~ ", lme2.form.cpt.XvsO)))
  
  (fmlxgr <- as.formula(paste(rt, lme2.form.cpt)))
  (fmlxvs <- as.formula(paste(rt, lme2.form.cpt.XvsO)))
  (fmlpgr<-  as.formula(paste(ti, lme2.form.pure)))
  (fmlpvs<-  as.formula(paste(ti, lme2.form.pure.XvsO)))
  lmeforms2<-list("gr"=fmlpgr,"vs"=fmlpvs,"old"=c(fmlRTCgr,fmlTIgr,fmlRTCvs,fmlTIvs))
  lmeforms<-list("RTCgr"=fmlRTCgr,"TIgr"=fmlTIgr,"RTCvs"=fmlRTCvs,"TIvs"=fmlTIvs)
  #lmeforms[1]
  return(lmeforms2)
}
#lmerun_func
lmerun<-function(set,resp,gr,chose,out,glt,ctrl){
  form<-create_lmeforms(set,resp)$gr
  set2<-get_rtc(set)
  ifelse(out==1,set2<-outl.fun.rtc(set2),set2<-set2)
  lmeset<-dta_setx(set2,chose,out,glt,ctrl)
  det_cat<-stri_detect (as.character(form[3]),regex  = "category")
  det_vs<-stri_detect (as.character(form[3]),regex  = "vs")
  sum1<-( lmer(form,lmeset)) 
  sum2<-summary(sum1)
  dif<-abs(coef(sum2)[1]-coef(sum2)[2])
  print(sum2$coefficients)
  #wenn global&category 
  ifelse(chose[4]==1&det_cat==T,out<-c(T,", abs:",dif,"ms"),
         out<-F)
  ifelse(length(sum2$coefficients[,1]<=2),out2<-coef(sum2)[1]>coef(sum2)[2],out2<-"blu")
  
  cat("global",chose[5],"=",out,"\nIntercept greater =",out2) #nicht beide TRUE > global = F
  # wenn !category | !vsAll >         
  ifelse(out==F,ifelse(det_vs!=T,out<-c("\nabs category",chose[5]," ~ ",chose[6],dif,"ms\n"),
                       ifelse(chose[4]!=1,out<-c(", abs:",dif,"ms\n"),out<-"\nkeine berechnung\n")),     
         out<-"\n---------------\n")
  cat(out)
  cat(as.character(form),"\n")
  #(dif)
  return(sum1)
  
}
###
getviews<-function(set1,set2,sumset){
  lme1<-paste0("lmerun(",set1,")") #set1 = "lmerun(dta,ti,1,c(0,0,0,1,em,vso),0)"
  lme11<-(eval(parse(text=lme1))) #wks.
  lme2<-paste0("lmerun(",set2,")") #set1 = "lmerun(dta,ti,1,c(0,0,0,1,em,vso),0)"
  lme22<-eval(parse(text=lme2)) #wks.
  sum1
  #lmerun(set1)
  sum1$coefficients
  sum1<-summary(lme11)
  sum2<-summary(lme22)
  sumset[[set1]]<-sum1$coefficients
  sumset[[set2]]<-sum2$coefficients
  return(sumset)
  #sumset
}
###
getviews_single<-function(set1,sumset){
  lme1<-paste0("lmerun(",set1,")") #set1 = "lmerun(dta,ti,1,c(0,0,0,1,em,vso),0)"
  lme11<-(eval(parse(text=lme1))) #wks.
  #lme2<-paste0("lmerun(",set2,")") #set1 = "lmerun(dta,ti,1,c(0,0,0,1,em,vso),0)"
  #lme22<-eval(parse(text=lme2)) #wks.
  #sum1
  #lmerun(set1)
  #sum1$coefficients
  sum1<-summary(lme11)
  #sum2<-summary(lme22)
  sumset[[set1]]<-sum1$coefficients
  #sumset[[set2]]<-sum2$coefficients
  return(sumset)
  #sumset
}
parsethrough<-function(){
  for (k in 1:3){
    #for (k in 1:length(setx[,1])){
    out<-1
    glt<-1
    ctrl<-1
    lmerun(dta,ti,1,setx[k,],out,glt,ctrl)
    lmerun(dta,rtc,1,setx[k,],out,glt,ctrl)
    lmerun(dta,ti,2,setx[k,],out,glt,ctrl)
    lmerun(dta,rtc,2,setx[k,],out,glt,ctrl)
    lmerun(dta,ti,1,setx[k,],out,glt,ctrl)
    lmerun(dta,rtc,1,setx[k,],out,glt,ctrl)
    lmerun(dta,ti,2,setx[k,],out,glt,ctrl)
    lmerun(dta,rtc,2,setx[k,],out,glt,ctrl)
  }
}

#####wks.
createview<-function(){
  lmerun(dta,"rtc",1,c(0,0,0,0,sm,em),1)
  
  (lmerun(dta,ti,1,c(0,0,0,1,em,vso),1)) #TI
  sum4<-list()
  sum1<-lmerun(dta2,ti,1,c(0,0,0,1,sm,sm),1)
  sum2<-summary(sum1)
  sum2
  sum4[[1]]<-sum2$coefficients
  sum4[1]
  sum3$"ti,1,c(0,0,1,1,sm,em),1"-sum3$`ti,1,c(0,0,0,1,em,vso),1,+3control`
  sum3$`ti,1,c(0,0,0,1,sm,em),1`-sum3$`ti,1,c(0,0,0,1,em,vso),1,+3control`
  sum3[[4]]-sum3[[3]]
  sum3$`ti,1,c(0,0,0,1,sm,em),1`-sum2$coefficients
  sum4<-as.data.frame(sum4)
  is.data.frame(sum4)
  #write_csv2(sum4,"huxout.csv")
}
###
#---C---  compare R/F results:-----------------------
#rubio-fernandez: r/f
rftargets<-c(
  "It had sharp claws",
  "she would apply her scalpel close to your heart",
  "the grandstand would give him a standing ovation",
  "the bouquets thrown onto the stage",
  "there was the occasional power outage"
)
rfchars<-stri_count_boundaries(rftargets,"character")
#mean(rfchars) # 36.8
#"We constructed 3 lists of materials, each containing 7 items of each experimental 
#condition (Extended Metaphor, Single Metaphor and Literal)"
#For the self-paced reading task, each passage was divided into 8 segments 
#(average number of words: 7.4; range: 3--10). One of these segments was the target expression, 
#which appeared in isolation (average number of words: 5.1; range: 2--9).
#"In the model, we posited a main effect of Category (single vs. other) 
#and random effects of Participant and Item, along with a random slope of Category by Participant"
#"pairwise comparisons of Condition levels"


#For these raw data, the mean reading time for the critical segments in the 
#Literal condition was       1457 ms (SD 727 ms), in the 
#Extended Metaphor condition 1543 ms (SD 764 ms), and in the 
#Single Metaphor condition   1578 ms (SD 768 ms).
#LC < EM < SM
#C.1
rftimes<-rbind("SM"=1578,"EM"=1543,"LC"=1457)
#general means group vs all
# #
#extraction: dta_setx(set,c(target-1,target0,target+1,groupvsall?,group1,group2),discard_outliers?,nur-gültige-fälle?) 
#1=yes,0=no
# d5<-(dta_setx(dta,c(0,0,0,1,lc,vso),1,1,1))
# attach(d5)
# m1<-mean(d5$timeinterval[group==sm],na.rm=T)
# m2<-mean(d5$timeinterval[group!=sm],na.rm=T)
# # mean at 0,0,0,out
# #    mean group  mean !group  #R/F
# sm   1851.040    1662.170 >
# em   1861.000    1659.711 >
# lc   1595.667    1683.930 <
# mm   1661.000    1679.075 <
# rank: 

#  tb1<-getmean(dta,c(0,0,0,0,sm,em),0,0,0,1,ti) # with RAW dataset
#here results reading time RAW, target 0
#        mean        sd
# SM 1623.482  834.4605
# EM 1761.593 1648.5537
# MM 1777.380  958.3569
# LC 1835.347 1304.3131

####
#(without outliers): the mean response times for the critical segments were 
#1421 ms (SD 650 ms) in the Literal condition, 
#1498 ms (SD 716 ms) in the Extended Metaphor condition, 
#1537 ms (SD 716 ms) in the Single Metaphor condition.
#LC < EM < SM
#C.2
#without outliers (2,5sd)
# dta1<-outl.fun(dta,250) #discard outliers with bottom cutoff at 250ms
# tb2<-getmean(dta1,c(0,0,0,0,sm,em),0,0,0,1,ti)
# #      mean        sd
# EM 1655.608 1033.4464
# SM 1734.169  761.2755
# MM 1906.137  879.5549
# LC 1978.348 1261.6891

#second formula, outliers discarded with respect to target length
# dta2<-outl.fun.rtc(dta)
# tb3<-getmean(dta2,c(0,0,0,0,sm,vso),0,0,0,1,ti)
# #       mean        sd
# EM 1563.051 1062.1094
# SM 1623.482  834.4605
# MM 1777.380  958.3569
# LC 1835.347 1304.3131

#mean RT bei target 0+1, without outliers
#       mean       sd
# EM 1846.250 1355.556
# SM 1998.554 1329.243
# MM 2151.842 1299.206
# LC 2206.770 2147.328
# 


#lme4:
#(R/F): with the Single condition being read slower than the others (coefficient = 77.3, SE = 24.9, t = 3.10, p < 0.01)
# SMvsOther
# fmla2: timeinterval ~ vsGroup + (1 | item) + (1 | participant) + (1 + vsGroup | participant)
#             Estimate    Std. Error  df        t value     Pr(>|t|)
# (Intercept) 1627.63038   187.2118  16.62067  8.694058 1.378434e-07
# vsGroup2EM   -53.31639   114.9268  67.23981 -0.463916 6.442063e-01
# vsGroup3LC   171.50058   118.1121 113.13773  1.452016 1.492647e-01
# vsGroup4MM   142.07474   112.3709 206.37242  1.264338 2.075349e-01

# fmla3: timeinterval ~ category + (1 | item) + (1 | participant) + (1 + category | participant)
#                  Estimate Std. Error        df  t value     Pr(>|t|)
# (Intercept)     1609.0465   193.5761  17.06412 8.312216 2.099865e-07
# categorySMvsAll  164.1103   125.8149 158.10744 1.304379 1.940000e-01

# R/F: no significant difference between Extended and Single metaphors (coefficient = 38.4, SE = 29.7, t = 1.30, n.s.)
# fmla1: rtc ~ vsGroup + (1 | item) + (1 | participant) + (1 + vsGroup | participant)
#             Estimate   Std. Error       df    t value     Pr(>|t|)
# (Intercept) 1628.72591   148.5456 21.54982 10.9644857 2.801232e-10
# vsGroup2EM   -55.76876   118.9061 40.99085 -0.4690151 6.415439e-01
#
#highly significant differences between each of these and the Literal condition 
#Literal vs. Extended: coefficient = 75.3, SE = 28.2, t = 2.68, p < 0.01
# fmla3
# #                   Estimate Std.Error        df    t value     Pr(>|t|)
# (Intercept)     1786.69783   208.1213  21.73803  8.5848850 1.976257e-08
# categoryLCvsAll  -72.24273   128.3764 273.48929 -0.5627417 5.740718e-01

#Literal vs. Single: coefficient = 114.7, SE = 28.6, t = 4.00, p < 0.001)
#             Estimate Std. Error        df  t value     Pr(>|t|)
# (Intercept) 1628.8417   201.6062  12.92014 8.079324 2.090719e-06
# vsGroup3LC   151.2718   127.6845 101.21898 1.184731 2.388981e-01
#RT category greater = TRUE , difference category LC  ~ all = 1477.57 ms
#### with length corrected RT:
#              Estimate Std. Error       df   t value  Pr(>|t|)
# (Intercept) -310.20431   124.7393 34.67972 -2.486821 0.0178540
# vsGroup3LC    62.97836   114.9605 92.25119  0.547826 0.5851345
#RT category greater = FALSE , difference category LC  ~ all = 373.1827 ms
##
# formel<-fmla1 #for rtc ~          groups   (length corrected RTs)
# formel<-fmla2 #for timeinterval ~ groups   (without length correction)
# formel<-fmla3 #for timeinterval ~ category (XvsOther)
# formel<-fmla4 #for rtc ~          category (XvsOther)
#create group vs set
# setx[x,] < x has to be 7,71,711 for global compare sets
# catsingle<-lc
# 
# setsingle<-setvsx(dta2,catsingle)
# sum1<-summary(lmerun(fmla3,setsingle,setx[7,]))
# sum1<-summary(lmerun(fmla1,dta2,setx[2,]))
# 
# dif<-abs(coef(sum1)[1]-coef(sum1)[2])
# cat("RT category greater =",coef(sum1)[1]>coef(sum1)[2],", difference category",catsingle," ~ all =",dif,"ms")
# (sum1$coefficients[])
# diflc<-dif
# diflcsm<-dif


#sum1
#with timeinterval fits with means in C.2

#here: coef=33.96, SE=98.24,t=0.346
#Literal vs. Single:  coefficient = 114.7, SE = 28.6, t = 4.00, p < 0.001).
#here: coef=11.159,SE=96.514,t=0.116
#SPEED:
#SM < Others
#
#hier resultate zeichenunabhängig, target 0+1:
#SM vs Others:
#coef = 77.94, SE = 241.47, t=-0.323, p < 0.001

#---
##bis hier



##---D----------descriptive analysis


# labx<-paste0("Basis durchschnittliche targetlaenge=", round(meanch), " zeichen")
# toplab<-paste0("Lesezeiten (ms)",boxlabtgt)
# 
# boxLZ<-cbind(SM=LZSMc,EM=LZEMc,LC=LZLCc,ISM=LZMMc)
# #boxplot(boxLZ,main="mean Lesezeiten gesamt in ms/106 zeichen fuer target+1",xlab="106 Zeichen = durchschnittliche Laenge target 0+1")
# boxplot(boxLZ,main=toplab, xlab=labx,notch=TRUE,col=c(1,2,3,4))
# 
# toplab<-paste0("median Lesezeiten (ms)",boxlabtgt)
# boxLZmd<-cbind(SM=mdLZA,EM=mdLZB,LC=mdLZC,ISM=mdLZD)
# boxplot(boxLZmd,main=toplab,xlab=labx)
# 
# toplab<-paste0("mean Lesezeiten (ms)",boxlabtgt)
# lab1<-paste0("basis durchschnittliche targetlaenge=", round(meanch), " zeichen")
# boxLZmn<-cbind(SM=LSAc,EM=LSBc,LC=LSCc,ISM=LSDc)
# boxplot(boxLZmn,main=toplab,xlab=lab1)


#boxLZad<-cbind(SM=LZSMd,EM=LZEMd,LC=LZLCd,MM=LZMMd)
#boxplot(boxLZad,main="Lesezeiten gesamt in ms/106 zeichen fuer target+1",xlab="106 Zeichen = durchschnittliche Laenge target 0+1",notch=TRUE,col=c(1,2,3,4))

#plot median addierte lesezeiten
#boxLZmd<-cbind(SM=mdspAd,EM=mdspBd,LC=mdspCd,ISM=mdspDd)
#boxplot(boxLZmd,main="median Lesezeiten gesamt in ms/106 zeichen fuer target 0+1",xlab="106 Zeichen = durchschnittliche Laenge target 0+1")

#boxspeed <- cbind(SM = speedSM, EM = speedEM,LC = speedLC, MM = speedMM)
#boxplot(boxspeed,main="lesegeschwindigkeit chars/sec bei target 0+1")

##---END 2---

#12373.
#coefficients(sumSMEM)

#12393.
#-----
# THIS for shiny presentation:
#12303.

plot_desc<-function(setd){
  
  # ausgabe<-function(setd){
  d5<-setd
  
  bar_df<-data.frame(1:12)
  attach(d5)
  m1<-mean(d5$timeinterval[group==sm],na.rm=T)
  m2<-mean(d5$timeinterval[group!=sm],na.rm=T)
  m3<-mean(d5$timeinterval[group==em],na.rm=T)
  m4<-mean(d5$timeinterval[group!=em],na.rm=T)
  m5<-mean(d5$timeinterval[group==lc],na.rm=T)
  m6<-mean(d5$timeinterval[group!=lc],na.rm=T)
  m7<-mean(d5$timeinterval[group==mm],na.rm=T)
  m8<-mean(d5$timeinterval[group!=mm],na.rm=T)
  m9<-rbind(cbind(m1,m2),cbind(m3,m4),cbind(m5,m6),cbind(m7,m8))
  m9
  m9c<-rbind(m1,m3,m5,m7)
  bar_df$RT[1:4]<-"TimeInterval"
  bar_df$LZ[1:4]<-m9c
  
  m9ns<-c("sm","em","lc","mm")
  bar_df$group[1:4]<-m9ns
  d5$rtc.2<-d5$timeinterval+d5$rtc
  m1e<-mean(d5$rtc.2[group==sm],na.rm=T)
  m2<-mean(d5$rtc.2[group!=sm],na.rm=T)
  m3e<-mean(d5$rtc.2[group==em],na.rm=T)
  m4<-mean(d5$rtc.2[group!=em],na.rm=T)
  m5e<-mean(d5$rtc.2[group==lc],na.rm=T)
  m6<-mean(d5$rtc.2[group!=lc],na.rm=T)
  m7e<-mean(d5$rtc.2[group==mm],na.rm=T)
  m8<-mean(d5$rtc.2[group!=mm],na.rm=T)
  m9e<-rbind(m1e,m3e,m5e,m7e)
  bar_df$RT[5:8]<-"TI + rtc"
  bar_df$LZ[5:8]<-m9e
  bar_df$group[5:8]<-m9ns
  
  meanch<-mean(d5$char)
  mean(d5$timeinterval/d5$char)*meanch
  m1<-mean(d5$timeinterval[group==sm]/d5$char[group==sm],na.rm=T)*meanch
  m2<-mean(d5$timeinterval[group!=sm]/d5$char[group!=sm],na.rm=T)*meanch
  m3<-mean(d5$timeinterval[group==em]/d5$char[group==em],na.rm=T)*meanch
  m4<-mean(d5$timeinterval[group!=em]/d5$char[group!=em],na.rm=T)*meanch
  m5<-mean(d5$timeinterval[group==lc]/d5$char[group==lc],na.rm=T)*meanch
  m6<-mean(d5$timeinterval[group!=lc]/d5$char[group!=lc],na.rm=T)*meanch
  m7<-mean(d5$timeinterval[group==mm]/d5$char[group==mm],na.rm=T)*meanch
  m8<-mean(d5$timeinterval[group!=mm]/d5$char[group!=mm],na.rm=T)*meanch
  m9<-rbind(cbind(m1,m2),cbind(m3,m4),cbind(m5,m6),cbind(m7,m8))
  #m9d<-rbind(cbind(m1,"SM"),cbind(m3,"EM"),cbind(m5,"LC"),cbind(m7,"MM"))
  m9
  m9f<-rbind(m1,m3,m5,m7)
  #m9cns<-c()
  #m9
  bar_df$RT[9:12]<-"TI char"
  bar_df$LZ[9:12]<-m9f
  
  m9ns<-c("sm","em","lc","mm")
  bar_df$group[9:12]<-m9ns
  return(bar_df)
}#endausgabe
#13243.plotdesc median

plot_desc_md<-function(setd){
  
  # ausgabe<-function(setd){
  d5<-setd
  
  bar_df<-data.frame(1:12)
  attach(d5)
  m1<-median(d5$timeinterval[group==sm],na.rm=T)
  m2<-median(d5$timeinterval[group!=sm],na.rm=T)
  m3<-median(d5$timeinterval[group==em],na.rm=T)
  m4<-median(d5$timeinterval[group!=em],na.rm=T)
  m5<-median(d5$timeinterval[group==lc],na.rm=T)
  m6<-median(d5$timeinterval[group!=lc],na.rm=T)
  m7<-median(d5$timeinterval[group==mm],na.rm=T)
  m8<-median(d5$timeinterval[group!=mm],na.rm=T)
  m9<-rbind(cbind(m1,m2),cbind(m3,m4),cbind(m5,m6),cbind(m7,m8))
  m9
  m9c<-rbind(m1,m3,m5,m7)
  bar_df$RT[1:4]<-"TimeInterval"
  bar_df$LZ[1:4]<-m9c
  
  m9ns<-c("sm","em","lc","mm")
  bar_df$group[1:4]<-m9ns
  d5$rtc.2<-d5$timeinterval+d5$rtc
  m1e<-median(d5$rtc.2[group==sm],na.rm=T)
  m2<-median(d5$rtc.2[group!=sm],na.rm=T)
  m3e<-median(d5$rtc.2[group==em],na.rm=T)
  m4<-median(d5$rtc.2[group!=em],na.rm=T)
  m5e<-median(d5$rtc.2[group==lc],na.rm=T)
  m6<-median(d5$rtc.2[group!=lc],na.rm=T)
  m7e<-median(d5$rtc.2[group==mm],na.rm=T)
  m8<-median(d5$rtc.2[group!=mm],na.rm=T)
  m9e<-rbind(m1e,m3e,m5e,m7e)
  bar_df$RT[5:8]<-"TI + rtc"
  bar_df$LZ[5:8]<-m9e
  bar_df$group[5:8]<-m9ns
  
  meanch<-mean(d5$char)
  mean(d5$timeinterval/d5$char)*meanch
  m1<-median(d5$timeinterval[group==sm]/d5$char[group==sm],na.rm=T)*meanch
  m2<-median(d5$timeinterval[group!=sm]/d5$char[group!=sm],na.rm=T)*meanch
  m3<-median(d5$timeinterval[group==em]/d5$char[group==em],na.rm=T)*meanch
  m4<-median(d5$timeinterval[group!=em]/d5$char[group!=em],na.rm=T)*meanch
  m5<-median(d5$timeinterval[group==lc]/d5$char[group==lc],na.rm=T)*meanch
  m6<-median(d5$timeinterval[group!=lc]/d5$char[group!=lc],na.rm=T)*meanch
  m7<-median(d5$timeinterval[group==mm]/d5$char[group==mm],na.rm=T)*meanch
  m8<-median(d5$timeinterval[group!=mm]/d5$char[group!=mm],na.rm=T)*meanch
  m9<-rbind(cbind(m1,m2),cbind(m3,m4),cbind(m5,m6),cbind(m7,m8))
  #m9d<-rbind(cbind(m1,"SM"),cbind(m3,"EM"),cbind(m5,"LC"),cbind(m7,"MM"))
  m9
  m9f<-rbind(m1,m3,m5,m7)
  #m9cns<-c()
  #m9
  bar_df$RT[9:12]<-"TI char"
  bar_df$LZ[9:12]<-m9f
  
  m9ns<-c("sm","em","lc","mm")
  bar_df$group[9:12]<-m9ns
  return(bar_df)
}#endausgabe

plot_desc_compare<-function(setd,gr,gro){
  d5<-setd
  bar_df<-data.frame(1:6)
  m9ns<-c(gr,gro)
  attach(d5)
  m1<-mean(d5$timeinterval[group==gr],na.rm=T)
  m2<-mean(d5$timeinterval[group!=gr],na.rm=T)
  m9c<-rbind(m1,m2)
  bar_df$RT[1:2]<-"TimeInterval"
  bar_df$LZ[1:2]<-m9c
  bar_df$group[1:2]<-m9ns
  d5$rtc.2<-d5$timeinterval+d5$rtc
  m1e<-mean(d5$rtc.2[group==gr],na.rm=T)
  m2e<-mean(d5$rtc.2[group!=sm],na.rm=T)
  m9e<-rbind(m1e,m2e)
  bar_df$RT[3:4]<-"TI + rtc"
  bar_df$LZ[3:4]<-m9e
  bar_df$group[3:4]<-m9ns
  meanch<-mean(d5$char)
  mean(d5$timeinterval/d5$char)*meanch
  m1f<-mean(d5$timeinterval[group==sm]/d5$char[group==gr],na.rm=T)*meanch
  m2f<-mean(d5$timeinterval[group!=sm]/d5$char[group!=gr],na.rm=T)*meanch
  m9f<-rbind(m1f,m2f)
  bar_df$RT[5:6]<-"TI char"
  bar_df$LZ[5:6]<-m9f
  bar_df$group[5:6]<-m9ns
  return(bar_df)
}#endausgabe


dta_rtc<-get_rtc(dta) #create rtc column in dataset
draw.data<-function(check,setd){
  # NEU:
  #  tm1<--0
  # t0<--50
  #  t1<--0
  #  gilt<-1
  #  ctrl<--0
  #  out<--0
  out<-check
  # setout<-now.data(setd,tm1,t0,t1,out,gilt,ctrl)
}
draw.setvso<-function(check){
  out<-check
}
now.data<-function(setd,chose){
  dta_rtc<-get_rtc(setd) #create rtc column in dataset
  dta1<-dta_rtc
  dtat<-dtatarget(dta1,chose[1],chose[2],chose[3])
  if(chose[1]=="not"&chose[2]=="not"&chose[3]=="not"){dtat<-dta_rtc}
  dtag<-dtat
  ifelse(chose[5]==1,dtag<-subset(dtat,dtat$gilt==1),dtag<-dtat)
  dta_o<-dtag
  ifelse(chose[4]==1,dta_o<-outl.fun.rtc(dtag),dta_o<-dtag)
  dtac<-dta_o
  ifelse(chose[6]==1,dtac<-adcontrol(dta_o,ti0,ticontrol,ti2),dtac<-dta_o)
  return(dtac)
}

