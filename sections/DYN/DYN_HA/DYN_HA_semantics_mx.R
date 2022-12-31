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
#stoplist<-read.csv("corpus/wolf_LE_stopwords.csv",sep = ";")
stoplist<-read.csv(src_st,sep = ";")

stoplist_t<-subset(stoplist,stoplist$stop==1)$word
stoplist_clean<-gsub("[^A-Za-z0-9äöü]","",stoplist_t)
stoplist_t<-unique(stoplist_clean)
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
  dta<-dta_t
  a1<-get_sentiment(dta$content[dta$book=="kochanie"],method = "nrc",language = "german")
  dta$sentiment[dta$book=="kochanie"]<-a1
  a1i<-get_transformed_values(a1)
  a1m<-max(a1)+.001
  a1im<-max(a1i)
  y<-max(a1im)/max(a1m)
 # a1i<-a1i/y
  
  a2<-get_sentiment(dta$content[dta$book=="FF"],method = "nrc",language = "german")
  dta$sentiment[dta$book=="FF"]<-a2
  
  a2i<-get_transformed_values(a2)
  a2m<-max(a2)+.001
  a2im<-max(a2i)
  y<-max(a2im)/max(a2m)
#  a2i<-a2i/y
  
  a3<-get_sentiment(dta$content[dta$book=="lengevitch"],method = "nrc",language = "german")
  dta$sentiment[dta$book=="lengevitch"]<-a3
  
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
#set<-dta_t
chapterx<-3
mfw<-function(set,chapterx){
  set<-dta_t
#dtasubna<-set
#dtasubna<-dta
#dtatarget<-set
dtatarget<-subset(set,set$chapter_id==chapterx)
#dtatarget<-subset(set,set$chapter_id==)

dtasubna<-dtatarget
#m1<-match(dtatarget$peak,max(dtatarget$peak))
m1<-match(dtatarget$sentiment,max(dtatarget$sentiment))
m2<-!is.na(m1)
textmax<-dtasubna$contentp[m2]
#m1<-match(dtatarget$peak,min(dtatarget$peak))
m1<-match(dtatarget$sentiment,min(dtatarget$sentiment))
m3<-!is.na(m1)
textmin<-dtasubna$contentp[m3]
###wks. TODO: display name of text! dafür titel im df erhalten!
mfw_out$min$head<-dtasubna$head[m3]
mfw_out$max$head<-dtasubna$head[m2]
mfw_out$min$book<-dtasubna$book[m3]
mfw_out$max$book<-dtasubna$book[m2]
mfw_out$min$chapter<-dtasubna$chapter[m3]
mfw_out$max$chapter<-dtasubna$chapter[m2]
mfw_out$min$id<-dtasubna$text[m3]
mfw_out$max$id<-dtasubna$text[m2]
#####
c<-corpus(textmax)
x<-(dfm(c))
x2<-featfreq(x)
#char_wordstem(a)
#stoplist_t<-unique(stoplist_clean)
#stoplist_clean
#x2[3]
# m2<-!is.na(!match(stoplist_t,x2))
# x3<-x2[m2]
# t6<-head(x3[order(x3,decreasing = T)])
# t6
m2<-is.na(match(names(x2),stoplist_clean))
x3<-x2[m2]
t6<-head(x3[order(x3,decreasing = T)])
t6


#m2
mfw_out$max$words<-t6
#mfw_out$max$words
#####
# text2<-stri_split_boundaries(textmin)
# text3<-(text2[[1]]) #raw single words of text
# text4<-unique(text3)
# m2<-!match(text3,stoplist_t,nomatch = F)
# t6<-text3[m2]
# #häufungen finden für ranking
# #match(t6,t4)
# #p1<-t6[duplicated(t6)]
# p2<-gsub("[^A-Za-z0-9äöü]","",t6)
# p2<-p2[duplicated(p2)]
# p2<-unique(p2)
# ifelse(length(p2)!=0,mfw_out$min$words<-p2,mfw_out$min$words<-"no duplicate words")

c<-corpus(textmin)
x<-(dfm(c))
x2<-featfreq(x)
#char_wordstem(a)
#head(x2[order(x2,decreasing = T)])
#x2[3]
# m2<-!is.na(!match(stoplist_t,x2))
# x3<-x2[m2]
# t6<-head(x3[order(x3,decreasing = T)])
m2<-is.na(match(names(x2),stoplist_clean))
x3<-x2[m2]
t6<-head(x3[order(x3,decreasing = T)])
t6


#t6
#m2
mfw_out$min$words<-t6
#names(mfw_dta[[exc]]$max$words)

#print(p2)
#cat("sentiment (minimum) text most frequent words:\n")
#print(p2)
#wks. now repeat for maximum
# text2<-stri_split_boundaries(textmax)
# text3<-(text2[[1]]) #raw single words of text
# text4<-unique(text3)
# m2<-!match(text3,stoplist_t,nomatch = F)
# t6<-text3[m2]
# #häufungen finden für ranking
# #match(t6,t4)
# p1<-t6[duplicated(t6)]
# p2<-gsub("[^A-Za-z0-9äöü]","",t6)
# p2<-p2[duplicated(p2)]
# p2<-unique(p2)
# ifelse(length(p2)!=0,mfw_out$max$words<-p2,mfw_out$max$words<-"no duplicate words")
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
#set<-dta_t
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
  set$tokens<-stri_count_boundaries(set$contentp) # IMPORTANT: with type=word far too much!
  #tokens<-stri_split_boundaries(set$contentp,type="word")
  #tokens<-gsub(" ","",tokens)
   # ltokens<-lapply(tokens,length)
    #  set$ltoken<-ltokens
     wolftypes<-stri_split_boundaries(set$contentp)
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
 dta<-dta_t

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
wc4<-wc3
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
set<-wc3  
get_p<-function(set){
parray<-set
# c<-3
# r<-4
wc4<-wc3
#for (c in 1:344){
  for (r in 1:130){
    nna<-!is.na(wc4[r,]) 
 #   for (c in 1: fin)
    fin<-sum(nna) # textlength
    for (c in 1: fin){ #wks. with NA, counts over whole matrix, provisorisch...
      
        m<-grep(wc4[r,c],wc4[,c]) #positions of matches in column
        # ml<-grep(wc4[r,c],wc4[r,])
        # lml<-length(ml)
    ### TODO: the NAs have to be excluded!
   # na<-is.na(wc4[r,])
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
lc<-sum(!is.na(wc4))
r<-2
c<-2
#################

for (c in 1:344){
  for (r in 1:130){
    #m<-grep(130,p5[r,])
    #   for (c in 1: fin)
    nna<-!is.na(p5[r,]) 
    l<-sum(nna) # textlength
    #ml<-grep(wc4[r,c],wc4[r,c:l],invert = T) #matches x over textlength #for idunno reason NAs are not matched/counted which is great
    ml<-match(wc4[r,c],wc4[r,1:l]) #matches x over textlength #for idunno reason NAs are not matched/counted which is great
    lml<-length(ml)
    lml<-sum(!is.na(ml))
    px<-lml/l #p(x) of word
    #p5[r,m]
    p<-parray[r,c]/130*px #-lml
    #mcpt<-grep(wc4[r,c],wc4) # match word over corpus
    mcpt<-match(wc4[r,c],wc4) # match word over corpus
    #lmcpt<-length(mcpt)
    lmcpt<-sum(!is.na(mcpt))
    pcpt<-lmcpt/lc
    p<-p*pcpt
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
#    m<-max(p5[,k],na.rm = T)
 # g<-grep(m,p5[,k])
  #x<-wc3[g,k]
  mm<-which.max(p5[,k])
  x<-wc3[mm,k]
#  x<-wc3[max(p5[,k]),k]
 psent[k]<-x 
#  ifelse (x!="",psent[k]<-x,psent[k]<-NA)
}
#max(p5[,1])
#p6
#wc3[1,255]
#psent
#sum(!is.na(wc3[1,]))
#m<-max(p5[,1])
#g<-grep(m,p5[,1])
#x<-wc3[g,1]
#x
#text<-paste(psent,sep = " ")
#cat(text)
text<-stri_join(psent,sep = " ")
return(text)
#cat(text)
#cat(text,file="local/DYN/db/wolf_p_text_qalongS.txt",sep = " ")
#check
#m<-grep("stottersaft",dta_t$contentp)
#dta_t$contentp[m]
#wc4[m-10:m+10]
#m-10
#wc4[28819:28840]
#wc6<-table(wc4)
# x<-c(1,2,3,4,5,6,7,8,NA)
# match(NA,x)

}
#getwd()
# printptext<-function(){
#   t<-stri_join(psent,sep = " ")
# }

get_lxdf<-function(){
library(quanteda.textstats)
t<-stri_join(wc4,sep = " ")
cat(head(t))
x<-textstat_lexdiv(t,measure="all")
tokens<-dta_t$contentp
head(tokens)
tokens<-str_split(tokens," ")
tokens<-unlist(tokens)
writeLines(tokens,"local/DYN/db/tokens.txt")
dtatok<-read_table("local/DYN/db/tokensquery.csv",header)
url<-"https://www.deutschestextarchiv.de/public/cab/query?a=default&fmt=text&clean=1&pretty=1&raw=1&q=i"
ns<-c("token","t2","t3","lex","lemma","ka")
#library(readr)
dtatok <- read_delim("local/DYN/db/tokensquery.csv", 
                          delim = "\t", escape_double = FALSE, 
                          col_names = ns, trim_ws = TRUE)
text
lxtok<-dtatok$token[dtatok$lex=="NE"|dtatok$lex=="FM"]
lx1<-cbind(lxtok,"de","multiLX","neoLX")
write.csv2(lx1,"local/DYN/db/tokensMultiLX.csv")
}
getwd()


### edited
get_tarray<-function(set){
#ns<-c("token","t2","t3","lex","lemma","ka")
#lxtable<-read_delim("local/DYN/db/tokensMultiLX_m.csv",delim =";",col_names = ns)
# lxtable<-read_csv2(set)
# mlx<-subset(lxtable,lxtable$multi=="multiLX")
### add multilx attribute to dta
wc6<-list()
wc6$text<-wc4
#wc6$y_matches<-parray
#wc6$p<-p5
#wc6$textp
tarray<-array()
r<-6
c<-6
for (c in 1:length(wc6[[1]][1,])){
  for (r in 1:length(wc6[[1]][,1])){
# for (c in 1:length(wc6[[1]][1,])){
    l<-sum(!is.na(wc6[[1]][r,]))
  for (lc in 1:l){
    pos<-r*lc
    
      tarray[pos]<-wc6[[1]][r,lc]
  }
}
}
#c<-6
#r<-6
tarray<-array(dim = 44720)
head(tarray)
for (r in 1:length(wc6[[1]][,1])){
  l<-sum(!is.na(wc6[[1]][r,]))
for (c in 1:l){
#for (k in 1:length(wc6[[1]][,1])){
  #l<-sum(!is.na(wc6[[1]][,c]))
  #for (r in 1:l){
    pos_o<-(c-1)*130+r
    pos_m<-(r-1)*344+c
    tarray[pos_m]<-wc6[[1]][pos_o]
  }
}
return(tarray)
}

get_lxmatches<-function(){
 # mlx<-get_lxtable()
#q
#tarray<-get_tarray()
  tokenarray<-get_tarray()
  token_na<-tokenarray[!is.na(tokenarray)]
  
  #assign multilx attributes
#match postdeutsch in text
q<-unique(mlx$lxtok)
#mt<-match(wc6$text[68,],q)
#mt<-match(q,wc6$text[68,])
#mt<-match(tarray,q) #first
mt<-match(token_na,q) #second essai, match over real corpus without na and along text flow
#tarray[mt]
mt1<-!is.na(mt)
#plot(mt1,type = "h")
#x<-tapply(q,mt)
#match
#matchlx<-mt[!is.na(q[mt])]
#q[matchlx]
#wc6$text[68,matchlx]
return(mt1)
}

sent_global<-get_sentiment(get_tarray())
# get lx percentage
lx_matches<-get_lxmatches()
# per text
txtbonds<-function(){
 # wc6<-list()
  #wc6$text<-wc4
  #wc6$y_matches<-parray
  #wc6$p<-p5
  #wc6$textp
  tarray<-data.frame()
  r<-1
  c<-6
  
  for (r in 1:length(wc4[,c])){
#    for (r in 1:length(wc4[,c])){
      # for (c in 1:length(wc6[[1]][1,])){
      l<-sum(!is.na(wc4[r,]))
      #for (lc in 1:l){
        #pos<-r*lc
      
      tarray[1,"start"]<-1
      tarray[1,"end"]<-sum(!is.na(wc4[1,]))
      tarray[1,"length"]<-tarray[1,2]-tarray[1,1]+1
      
      # if (r >=2){
      #   tarray[r,"start"]<-tarray[r-1,2]+1
      #   tarray[r,"end"]<-l+tarray[r,1]-1
      # }
       if (r<=length(wc4[,c])&r>=2)
      {tarray[r,"start"]<-tarray[r-1,2]+1
      tarray[r,"end"]<-l+tarray[r,1]-1
      tarray[r,"length"]<-tarray[r,2]-tarray[r,1]+1
      }

  }
t1<-c(0,0,0)
tarray<-rbind(t1,tarray)
  return(tarray)
  }
dta_t<-cbind(dta_t,txtbonds()) #add start end texts columns to set

# now for lx percentage
tokenarray<-get_tarray()
token_na<-tokenarray[!is.na(tokenarray)]
q<-unique(mlx$lxtok)
lxpmatches<-array()
for(r in 1:length(dta_t$page)){
trange<-as.vector(token_na[dta_t$start[r]:dta_t$end[r]])
mt<-match(trange,q)
#tarray[mt]
mt1<-!is.na(mt)
mt2<-sum(mt1)
mt3<-mt2/length(trange)*100
lxpmatches[r]<-mt3
#plot(mt1,type = "h")
#x<-tapply(q,mt)
#match
#matchlx<-mt[!is.na(q[mt])]
}
lxpmatches[1]<-0
dta_t$lxp<-lxpmatches

#dta_t$lxp[1]<-0
# lxp_f<-get_transformed_values(dta_t$lxp)
# lxpmatches
# plot(lxpmatches,type = "h")
# plot(lxp_f,type="h")
# plot()
# lxp_f
#dta_t$contentp[101]
### new lmer
#dta<-dta_t
### new lmer with multilingual elements random effect
lm<-lmer(dta_t$sentiment~dta_t$book+(dta_t$book|dta_t$chapter)+(dta_t$lxp|dta_t$chapter)+(1+dta_t$lxp),dta_t)
lms<-summary(lm)
#lms
#lms$coefficients
#lms$vcov[5,]
#lms$vcov
#which.max(lms$vcov[5,2:4])
lmdif1<-lms$vcov[5,3]-lms$vcov[5,2]
lmdif2<-lms$vcov[5,4]-lms$vcov[5,2]
lmdif3<-lmdif1-lmdif2
### type/token ratio per text & chapter
ttr_b1<-data.frame()
dta_t$ttr<-dta_t$types/dta_t$tokens
# plot(get_transformed_values(dta_t$ttr),type = "h",col=3)
# par(new=T)
# plot(get_transformed_values(dta_t$sentiment),type = "l",col=2,ann = F,xaxt="n",yaxt="n")
lm<-lmer(dta_t$sentiment~dta_t$book+(dta_t$book|dta_t$chapter)+(dta_t$lxp|dta_t$chapter)+(1+dta_t$lxp)+(1+dta_t$ttr),dta_t)
lms<-summary(lm)
#lms
#eval
#lms$vcov[5,]

# Die Abhängigkeit der sentiment values vom Vorhandensein multilingualer Elemente läszt sich kurz umreiszen: Wir stellen den gröszten Zusammenhang mit [coefficient] ``r round(lmmax,2)`` bei ``r cnsmax`` fest, die Differenz zu ``r cnsmin`` beträgt ``r round(lmdif1,2)``, zu ``r cnsmed`` ``r round(lmdif2,2)`` Punkte, der Abstand der Abhängigkeit hier also ``r round(lmdif3,2)`` Punkte.   



temp.fun1<-function(){
head(tarray)
nt<-tarray[!is.na((tarray))]
wc6[[1]][6,6]
library(purrr)
tlist<-transpose(wc6)
tmatrix<-matrix(stri_split_boundaries(dta_t$contentp[2:131]))
t3<-matrix(stri_split_boundaries(t2,simplify = T),ncol=344)
wc6[[1]][pos]
wc6[[1]][(5)*344+6]
wolfmatrix[5*130+4]
nt[40:70]
#nt<-subset(tarray,!is.na(tarray))
x<-split(nt,1:100)
sent<-get_sentiment_dictionary("nrc",language = "german")    
unique(sent$sentiment)
}

### try neue KI for text generation #######################################
# i need p-corrective residuals for every word position
# formula: position ~ position in text + (textlength) + (wordlength)
# df
newki<-function(){
  nna<-!is.na(wc4)
  wc7<-as.list(tokenarray)
  k<-1
  #fun<-function(){stri_count_boundaries(wc7[[]],"character")}
  for (k in 1:length(wc7)){
    wc7[[k]]["l"]<-stri_count_boundaries(wc7[[k]],"character")
  }
  #for (r in 1:length(wc7)){
  for (k in 2:length(dta_t$X_id)){
    rng<-dta_t$length[k]
    rngs<-dta_t$start[k]
    rnge<-dta_t$end[k]
    p<-0
    for (w in rngs:rnge){
      wc7[[w]]["tl"]<-rng
      #for (p in 1:rng){
      p<-p+1
      wc7[[w]]["p"]<-p
    }
  }
  
  #}
  #}
  for (k in 1:length(wc7)){
    wc7[[k]]["ap"]<-k
  }
  #wc8<-transform_position(wc7)
  #wc8<-data.frame(wc7)
  wc8<-unlist(wc7)
  wc9<-matrix(wc8,nrow = 5)
  wc10<-cbind(wc9[1,],wc9[2,],wc9[3,],wc9[4,],wc9[5,])
  #is.na(wc7[[]]["ap"])
  wns<-c("word","length","tlength","pos","apos")
  colnames(wc10)<-wns
  wc10<-data.frame(wc10)
  mode(wc10$pos)<-"double"
  mode(wc10$length)<-"double"
  mode(wc10$p)<-"double"
  mode(wc10$apos)<-"double"
  
  sum(wc10$length)
  
  lm<-lmer(apos  ~ word +(pos|tlength)+(1+length),wc10)
  lms2<-summary(lm)
  length(wc10$pos)
  lms2
  length(lms2$residuals)
}
lsaessai<-function(){
  
library(lsa)
td=tempfile()
dir.create(td)
for (k in 1:length(dta_t$contentp)){
write(dta_t$contentp[k], file = paste(td,dta_t$text[k],sep = "/"))

}
d<-textmatrix(td,stopwords = stopwords_de)
summary(d)
d2<-lw_logtf(d)*gw_idf(d)
d2<-lsa(d, dims = dimcalc_share())
d2$sk
list.files(td)
library(NLP)
names(Universal_POS_tags_map)
dim(Universal_POS_tags)
Universal_POS_tags

td=tempfile()
getwd()
corpus<-"local/DYN/db/corpus"
dir.create(corpus)
for (k in 1:length(dta_t$contentp)){
  filename<-paste0("wolf_txt-",k,".txt")
  write(dta_t$contentp[k], file = paste(corpus,filename,sep = "/"))
  
}
}
library(tm)
mining<-function(){
library(quanteda)
#library(rematch2)
c<-corpus(dta_t$contentp)
x<-kwic(c,"glaub.*",window=5,valuetype="regex")
x$from
x$pre
summary(c)
x<-(dfm(c))
x2<-dfm_weight(x)
x2
x2<-featfreq(x)
char_wordstem(a)
head(x2[order(x2,decreasing = T)])

a<-tokens(c)
tf1<-stri_extract_all_words(dta_t$contentp)
stoplist_clean<-gsub("[^A-Za-z0-9äöü]","",stoplist_t)
stoplist_clean<-unique(stoplist_clean)
stoplist_clean<-stoplist_clean[2:length(stoplist_clean)]
tf2<-unlist(tf1)
df<-tf2[!tf2 %in% stoplist_clean]
tf<-termFreq(df)
findMostFreqTerms(tf)
library(udpipe)
#model at:
modelurl<-"gith/DH_essais/files/german-hdt-ud-2.5-191206.udpipe"
modelurl<-"german-gsd-ud-2.5-191206.udpipe"
model<-udpipe_load_model(modelurl)
dmodel<-udpipe_download_model(language = "german-gsd")
udpipe
x<-udpipe_annotate(model,tf2)
x$conllu
df<-as.data.frame(x)
write_csv(df,"local/DYN/db/wolfPOS.csv")

library(httr)
#conllu
cab<-"http://www.deutschestextarchiv.de/public/cab/query?fmt=jsonu&q="
req<-paste0(cab,q)

q<-"schneit"
x<-GET(req)
y<-content(x,"text")
df<-as.data.frame(y)
jsonlite::fromJSON(y)
}

###### network part
library(stylo)
library(igraph)
#library(network)

#root<-"~/boxHKW/21S/DH"
#rootdir<-getwd()
workdir<-"../network"
setwd(workdir)
library(xfun)

#corpusdir<-
# stylo(gui=T,corpus.dir = speakerdir)
#stylo
# x<-stylo(mfw.min = 30,mfw.max = 70,corpus.dir<-workdir,display.on.screen = F,
#         network=T,path=workdir,write.png.file=T,gui=T)
dtanet<-stylo(mfw.min = 30,mfw.max = 70,display.on.screen = F,
         network=T,path=workdir,write.png.file=T,gui=F,visualization=F,corpus.lang="german",dump.samples=F,output=F)

#names(stylo.default.settings())
#network according to MFW
#dtanet<-read.csv("stylo_Consensus_100-100_MFWs_Culled_0__Classic Delta_C_0.5_EDGES.csv")
# f<-list.files(workdir)
# f
# 
# iscsv<-grep("csv", file_ext(f))
# src<-f[iscsv][2]
#edges <- read.csv("stylo_Consensus_100-100_MFWs_Culled_0__Classic Delta_C_0.5_EDGES.csv")
#edges <- read.csv(src)

plot_net<-function(set){
edges<-dtanet$list.of.edges
net <- graph_from_data_frame(d=edges, 
                             directed=FALSE)

n <- 5 # für die Knotengröße
col <- "orange" # für die Knotenfarbe
  V(net)$name<-dta_t$head[2:length(dta_t$head)]
 # par(new=T)
  # Knotengröße ändern
  # Gekrümmte Kanten (edge.curved=.4) :
  #par(new=T)
  par(pty="m")
  #par(pin=c(3.7,3.7))
  plot(net, edge.arrow.size=.5,
       vertex.size=n, vertex.color=col,
       vertex.label=V(net)$name,
       vertex.label.cex=.5, edge.curved=.6)
}
#plot(net)
