#13451.2.DYN_HA: wolf plot arcs
#Q: https://www.matthewjockers.net/2015/02/02/syuzhet/
#semantic analysis: uljana wolf; gegenwartslyrik

#library(httr)
#library(jsonlite)
#library(purrr)
#library(stylo)
#library(igraph)
#library(network)
#library(syuzhet)
#library(stringi)
#root<-"~/boxHKW/21S/DH/"
#setwd(local)
#local<-paste0(root,"local/DYN/")
#setwd(local)
#src<-"wolf_FF_1.json"
#src<-paste0(local,"wolf_FF-LEN-KOCHANIE.json")
getwd()
#stoplist<-read.csv("/gith/DH_essais/sections/DYN/DYN_HA/corpus/wolf_LE_stopwords.csv",sep = ";")
stoplist<-read.csv("corpus/wolf_LE_stopwords.csv",sep = ";")
stoplist_t<-subset(stoplist,stoplist$stop==1)$word
dta$top<-0
dta<-subset(dta,!is.na(dta$content))
dta<-subset(dta,dta$content!="")
dta$top[dta$book=="kochanie"]<-2005
dta$top[dta$book=="FF"]<-2009
dta$top[dta$book=="lengevitch"]<-2013
dta<-dta[with(dta,order(dta$top)),]
book<-dta$book
book_ex<-unique(book)
match(book,book_ex)
dta$book_id<-match(book,book_ex)
chapter<-dta$chapter
chapter_ex<-unique(chapter)
match(chapter,chapter_ex)
dta$chapter_id<-match(chapter,chapter_ex)
dtans<-colnames(dta)
dta0<-c(NA,"a-intercept","a-intercept","a-intercept","null","null","null","null","null","null",2000)
dtalm<-rbind(dta0,dta)
dtalm$sentiment[1]<-0
mode(dtalm$sentiment)<-"double"
dta<-dtalm
le_out<-list()


do_sentiment<-function(dta){
  # src<-paste0(getwd(),"/local/R/cred_gener.csv")
  # cred<-read.csv(src)
  # con<- mongo(collection = "wolfdb003", db ="deadend", url=cred$url[cred$q=="mongodb"])
  # x<-con$find('{}')
 # dta<-subset(dta,!is.na(dta$content))
  #dta<-dtam
  a1<-get_sentiment(dta$content[dta$book=="kochanie"],method = "syuzhet",language = "german")
  a1i<-get_transformed_values(a1)
  a1m<-max(a1)+.001
  a1im<-max(a1i)
  y<-max(a1im)/max(a1m)
 # a1i<-a1i/y
  
  a2<-get_sentiment(dta$content[dta$book=="FF"],method = "syuzhet",language = "german")
  a2i<-get_transformed_values(a2)
  a2m<-max(a2)+.001
  a2im<-max(a2i)
  y<-max(a2im)/max(a2m)
#  a2i<-a2i/y
  
  a3<-get_sentiment(dta$content[dta$book=="lengevitch"],method = "syuzhet",language = "german")
  a3i<-get_transformed_values(a3)
  a3m<-max(a3)+.001
  a3im<-max(a3i)
  y<-max(a3im)/max(a3m)
#  a3i<-a3i/y
  
  #plot(a1i~a2i)
  #plot(a1i~a3i)
  #plot(a2i~a3i)
  #no.
  ### lmer test
  #assemble values:
  le_out$sentiment$a1<-a1
  le_out$sentiment$a2<-a2
  le_out$sentiment$a3<-a3
  le_out$sentiment$a1i<-a1i
  le_out$sentiment$a2i<-a2i
  le_out$sentiment$a3i<-a3i
  
    # formel: test dependency sentiment of book
  ################################################
  # new with sorted df (after year of publication)
  lm<-lmer(dta$sentiment~dta$book+(dta$book|dta$chapter),dta)
 # lm<-lmer(dtalm$sentiment~dtalm$book+(dtalm$book|dtalm$chapter),dtalm)
  length(dta$book)
    le<-summary(lm)
  le
  res<-le$residuals
  lm2<-get_transformed_values(res)
  le_out$lm$sum<-le
  le_out$lm$scaled<-lm2
  ####
  m1<-mean(dta$sentiment[dta$book=="kochanie"])
  m2<-mean(dta$sentiment[dta$book=="FF"])
  m3<-mean(dta$sentiment[dta$book=="lengevitch"])
  le_out$means$mean1<-m1
  le_out$means$mean2<-m2
  le_out$means$mean3<-m3
  sent1<-c(a1i,a2i,a3i)
  sent2<-c(a1,a2,a3) #untransformed sentiment, absolute
  sent3<-get_transformed_values(sent2)
  le_out$sentiment$cpt_s1<-sent1
  le_out$sentiment$cpt_s2<-sent2
  le_out$sentiment$cpt_s3<-sent3
  # plot(sent1,type = "h",col=2,ylab = "sentiment factorized",xlab="books",main="sentiment analysis over texts")
  # scatter.smooth(1:length(sent2),sent2,.1,.1,type="h",family = "gaussian",ylab="absolute sentiment vaules",xlab="text corpus",main="sentiment over texts")
  # scatter.smooth(1:length(a1),a1,.1,.1,type="h",family = "gaussian",ylab="absolute sentiment vaules",xlab="text: kochanie",main="sentiment over texts")
  # scatter.smooth(1:length(a2),a2,.1,.1,type="h",family = "gaussian",ylab="absolute sentiment vaules",xlab="text: FF",main="sentiment over texts")
  # scatter.smooth(1:length(a3),a3,.1,.1,type="h",family = "gaussian",ylab="absolute sentiment vaules",xlab="text: lengevitch",main="sentiment over texts")
  # plot(sent3,type = "h",col=2,ylab = "sentiment frequencies",xlab="corpus",main="sentiment analysis over texts")
  # scatter.smooth(1:length(res),res,.1,.1,type="h",family = "gaussian",ylab="dependencies: lmer sentiment residuals",xlab="text corpus",main="book/chapter dependency")
  # plot(lm2,type = "h",col=2,ylab = "sentiment frequencies",xlab="corpus",main="sentiment analysis over texts")
  # p<-ggplot(dta, aes(1:length(sentiment), sentiment, colour = book)) + 
  #   geom_line()
  # p +  labs(x="corpus", y="sentiment absolute", title="sentiment over texts", fill="book")
  # #print(le)
  le<-summary(lm)
 # attach(le_out)
return(le_out)
}
mfw_out<-list()
#do_sentiment(dta)
#set<-dta
chapterx<-2
mfw<-function(set,chapterx){
#dtasubna<-set
#dtasubna<-dta
#dtatarget<-set
dtatarget<-subset(set,set$chapter_id==chapterx)
#dtatarget<-subset(set,set$chapter_id==)

dtasubna<-dtatarget
#m1<-match(dtatarget$peak,max(dtatarget$peak))
m1<-match(dtatarget$sentiment,max(dtatarget$sentiment))
m2<-!is.na(m1)
textmax<-dtasubna$content[m2]
#m1<-match(dtatarget$peak,min(dtatarget$peak))
m1<-match(dtatarget$sentiment,min(dtatarget$sentiment))
m3<-!is.na(m1)
textmin<-dtasubna$content[m3]
###wks. TODO: display name of text! dafür titel im df erhalten!
mfw_out$min$head<-dtasubna$head[m3]
mfw_out$max$head<-dtasubna$head[m2]
mfw_out$min$book<-dtasubna$book[m3]
mfw_out$max$book<-dtasubna$book[m2]
mfw_out$min$chapter<-dtasubna$chapter[m3]
mfw_out$max$chapter<-dtasubna$chapter[m2]
mfw_out$min$id<-dtasubna$text[m3]
mfw_out$max$id<-dtasubna$text[m2]

text2<-stri_split_boundaries(textmin)
text3<-(text2[[1]]) #raw single words of text
text4<-unique(text3)
m2<-!match(text3,stoplist_t,nomatch = F)
t6<-text3[m2]
#häufungen finden für ranking
#match(t6,t4)
#p1<-t6[duplicated(t6)]
p2<-gsub("[^A-Za-z0-9äöü]","",t6)
p2<-p2[duplicated(p2)]
p2<-unique(p2)
ifelse(length(p2)!=0,mfw_out$min$words<-p2,mfw_out$min$words<-"no duplicate words")
#print(p2)
#cat("sentiment (minimum) text most frequent words:\n")
#print(p2)
#wks. now repeat for maximum
text2<-stri_split_boundaries(textmax)
text3<-(text2[[1]]) #raw single words of text
text4<-unique(text3)
m2<-!match(text3,stoplist_t,nomatch = F)
t6<-text3[m2]
#häufungen finden für ranking
#match(t6,t4)
p1<-t6[duplicated(t6)]
p2<-gsub("[^A-Za-z0-9äöü]","",t6)
p2<-p2[duplicated(p2)]
p2<-unique(p2)
ifelse(length(p2)!=0,mfw_out$max$words<-p2,mfw_out$max$words<-"no duplicate words")
#cat("sentiment (maximum) text most frequent words:\n")
#print(p2)
#print(mfw_out)
#mfw_out$max[3]
#t6
#p2<-unique(p2)
#print(p2)
#text2
# return(t4[m>1])
return(mfw_out)
}
set<-dta
get_types<-function(set,opt){
#  set
  set$contentp<-gsub("[^A-Za-z0-9äöüß \n]","",set$content) #get clean text
  set$contentp<-gsub("(\n)"," ",set$contentp) #get clean text
  set$contentp<-gsub("(   )"," ",set$contentp) #get clean text
  set$contentp<-gsub("(  )"," ",set$contentp) #get clean text
  set$contentp<-gsub("^( )","",set$contentp) #get clean text
  set$contentp<-gsub("(   )"," ",set$contentp) #get clean text
  set$contentp<-gsub("(  )"," ",set$contentp) #get clean text
  set$contentp<-gsub("^( )","",set$contentp) #get clean text
  m<-matrix(stri_split_boundaries(set$contentp,simplify = T),nrow = 131)
  #wks.
  set$tokens<-stri_count_boundaries(set$contentp,"word")
  #tokens<-stri_split_boundaries(set$contentp,type="word")
  #tokens<-gsub(" ","",tokens)
   # ltokens<-lapply(tokens,length)
    #  set$ltoken<-ltokens
     wolftypes<-stri_split_boundaries(set$contentp,type="word")
     types<-lapply(wolftypes,unique)
     ltypes<-lapply(types,length)
     set$types<-unlist(ltypes)
   #  dta$types<-stri_split_boundaries(dta$contentp,type="word",simplify = T)
     #wolftypec<-stri_count_boundaries(dta$types,"word")
     #m<-match(wolftypes," ")
     #m<-lapply(wolftypes,grep("[^A-Za-z0-9äöüß]"))
     #m<-stri_subset(wolftypes,regex = " ")
  
     #m<-matrix(stri_split_boundaries(dta$contentp,simplify = T),nrow = 131)
     #m<-stri_split_boundaries(dta$contentp)
     #dta$contentp[dta$text==37]
    #  grep
     
     #m2<-grep("[A-Za-z0-9äöüß]",m)
     #m3<-matrix(m[m2],nrow = 131)
     #m[6]
     #k<-6
     #l<-list()
     #m<-grep("[^A-Za-z0-9äöüß]",wolftypes[[k]])
     #for (k in 1:131){
    #   m<-grep("[^A-Za-z0-9äöüß]",wolftypes[[k]])
    # ifelse(length(m)!=0,l[[k]]<-m,l[[k]]<-NA)
    # }
     #wolftypes[l[[6]]]
     #l[[6]]
     #length(grep("[^A-Za-z0-9äöüß]",wolftypes[[k]]))
#k<-1:length(wolfcpt)
#x[k]<-c
 # x<-unlist(wolftypes)
#wolftypes[[2]]
 # length(textcpt[[2]])
#   dta$types<-x
#   k<-3
#   for (k in 1:length(dta$content)){
#     dta$types[k]<-dta$types[[k]]
#   }
#   x[2]<-stri_split_boundaries(dta$content[2])
#   
# dta$tokens<-wolftokens
# tk1<-dta$tokens[dta$book_id==1]
# tk2<-dta$tokens[dta$book_id==2]
# tk3<-dta$tokens[dta$book_id==3]
# stk1<-sum(tk1,na.rm = T)
# stk2<-sum(tk2,na.rm = T)
# stk3<-sum(tk3,na.rm = T)
# stkcpt<-sum(dta$tokens,na.rm = T)
# wolfcpt_s<-stri_split_boundaries(wolfcpt,type="word")
# textcpt<-wolfcpt_s
# tokens<-unlist(textcpt)
# #text3<-(text2[[1]]) #raw single words of text
# p2<-gsub("[^A-Za-z0-9äöü ]","",tokens)
# p3<-unique(p2)
# #m2<-!match(text3,stoplist_t,nomatch = F)
# t6<-text3[m2]
     return(set)
}
dta_t<-get_types(dta,1)

wolfmatrix<-matrix(stri_split_boundaries(dta_t$contentp[2:131],simplify = T),nrow = 130)
#wolfmatrix<-wolfmatrix[2:nrow(wolfmatrix),]
wolfmatrix<-gsub("[^A-Za-z0-9äöüß]","",wolfmatrix)
#grep("[^A-Za-z0-9äöüß]",w)
#count of unique words/position: most distinct positions!
# typearray<-array()
# for (k in 1:130){
# typearray[k]<-length(unique(wolfmatrix[,k]))
# 
# }
# typearray<-array()
# for (k in 1:344){
#   typearray[k]<-length(unique(wolfmatrix[,k]))
#   
# }

#wm<-rbind(wolfmatrix,x)
#md<-median(dta_t$tokens) #durchschnittliche textlänge
wc<-matrix(stri_count_boundaries(wolfmatrix,type="character"),nrow=130) #character/position
#image(wc)
wc2<-matrix(wc)
wc0<-matrix(nrow = 130,ncol = 344)
for(k in 1:length(wc2)){
ifelse(wc2[k]==0,wc0[k]<-NA,wc0[k]<-wc2[k])
} # put NA for zero characters
wc3<-matrix(wolfmatrix,nrow = 130)
for(k in 1:length(wc3)){
  ifelse(wolfmatrix[k]=="",wc3[k]<-NA,wc3[k]<-wolfmatrix[k])
} # put NA for zero word on position
typearray2<-array()
for (k in 1:344){
  x<-sum(!is.na(wc3[,k]))
  typearray2[k]<-length(unique(wc3[,k]))/x #distinct words (types/tokens per position)
}
chararray_m<-array()
for (k in 1:344){
  chararray_m[k]<-mean(wc0[,k],na.rm=T)
} # 

#typearray<-typearray2


#mean(wc[,1])
#image(wc,xaxt="n",yaxt="n",xlab="textposition in corpus",ylab="wordposition in text")
#plot(chararray_m,type="h")
#wcmd<-median(wc[])
typearray_f<-get_transformed_values(typearray2)
chararray_f<-get_transformed_values(chararray_m)
y<-max(typearray_f)/max(typearray2)
#plot(typearray_f/y,type="h")
x<-max(chararray_f)/max(chararray_m)
#plot(chararray_f/x)
typearray_f<-typearray_f/y
chararray_f<-chararray_f/x
##########################
#probability matrix of word position
get_p<-function(set){
  
parray<-wc3
 c<-3
 r<-4
wc4<-wc3
#for (c in 1:344){
  for (r in 1:130){
    nna<-!is.na(wc4[r,]) 
 #   for (c in 1: fin)
    fin<-sum(nna) # textlength
    for (c in 1: fin){ #wks. with NA, counts over whole matrix, provisorisch...
      
        m<-grep(wc4[r,c],wc4[,c]) #positions of matches
    ### TODO: the NAs have to be excluded!
    na<-is.na(wc4[r,])
x<-as.double(length(m)) #match count
#wc4[r,c]<-r*c #erase matches to not match again #blödsinn!
  parray[r,c]<-x
  
      }
  }
#}
#x<-c(1,2,3,4,4,3,3,2,4,5,6,NA)
#unique(x,incomparables = 3)
#wc4[9,19]
#sum(na)
mode(parray)<-"double"

p5<-matrix(parray,nrow = 130)
for (c in 1:344){
  for (r in 1:130){
    #m<-grep(130,p5[r,])
    #   for (c in 1: fin)
    nna<-!is.na(p5[r,]) 
    l<-sum(nna) # textlength
    #p5[r,m]
    p<-parray[r,c]/130*l 
   # p<-parray[r,c]/130/l #same sure
    
    p5[r,c]<-p
  }
}
#sum(!is.na(wc4[98,]))
#m<-grep(130,parray)
#p5[m]<-NA

#parray[3,3]/100
#wc3[max(p5[,3]),3] # most probable 1st word
psent<-array()
#wc3[5,5]
for (k in 1:344){
  m<-max(p5[,k],na.rm = T)
  g<-grep(m,p5[,k])
  x<-wc3[g,k]
#  x<-wc3[max(p5[,k]),k]
 psent[k]<-x 
#  ifelse (x!="",psent[k]<-x,psent[k]<-NA)
}
#max(p5[,1])
#p6
#wc3[1,255]
psent
#sum(!is.na(wc3[1,]))
#m<-max(p5[,1])
#g<-grep(m,p5[,1])
#x<-wc3[g,1]
x
text<-paste(psent,sep = " ")
cat(text)
return(p5)

cat(text,file="local/DYN/db/wolf_p_text_qL.txt",sep = " ")
#check
m<-grep("stottersaft",dta_t$contentp)
dta_t$contentp[m]
wc4[m-10:m+10]
m-10
wc4[28819:28840]
wc6<-table(wc4)

}
#getwd()
