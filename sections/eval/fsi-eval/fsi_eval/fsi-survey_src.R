#13026.fsi eval
###############
library(readr)
library(purrr)

#install.packages("vroom")
#library(vroom)
d<-read.csv(src,sep = "\t")
#write_csv(d,"local/SPUND/data01.csv")
#dsafe<-d
#d2<-read.csv2("data01.csv",sep=",")
#d<-d2
#getwd()
v<-"values_fsi-survey_2023-01-13_06-48.csv"
v<-"values_fsi-survey_2023-01-20_11-19.csv"

v<-read.csv(v,sep = ";") # the sosci original .csv doesnt import due to "embedded nul in string", import to NUMBERS wks., exported .csv import wks. 
#v<-vroom(v,delim = "\t")
a<-"variables_fsi-survey_2023-01-13_06-48.csv"
a<-"variables_fsi-survey_2023-01-20_11-19.csv"
va<-read.csv(a,sep = ";")
qlab<-va$LABEL
qvar<-va$VAR
qquest<-va$QUESTION
#va$QUESTION[12]<-"in welchem semester momentan?"
#d2$T604[] #put different value
#TEST########
d$T602[6]<-2
#############
var<-qvar[11]
#d[var]
#qvar[3]
#qquest[1:50]
###
q1<-11
q<-12
repl_multibyte<-function(qquest){
  qquest<-gsub("\\\xe4|ä","ae",qquest)
  qquest<-gsub("\\\xf6|ö","oe",qquest)
  qquest<-gsub("\\\xfc|ü","ue",qquest)
  qquest<-gsub("ß","sz",qquest)
  qquest<-gsub("[^A-Za-z0-9,;\\.\\(\\)-: \\?]","X",qquest)
  
  return(qquest)
}


fetchq<-function(q){
  qvar<-va$VAR
  qquest<-va$QUESTION
  qcode<-qvar[q]
  free<-0
  responsecodes<-v$RESPONSE[v$VAR==qcode]
  lresponse<-length(responsecodes)
  if (length(responsecodes)==0){
    lresponse<-1
    free<-1
    responsecodes<-"free"
  }
  answers<-v$MEANING[v$VAR==qcode]
  if(free==1)
    answers<-"freie eingabe"
  #d[qcode]
  #print(qquest[q])
  #print(qcode)
  #print(d[qcode])
  responseeval<-c(d[qcode])
  responsearray<-array()
  #responseeval
  #k<-1
  #a<-1
  #responsecodes
  if(responsecodes=="free"){
    responsearray<-d[qcode]
  }
  if(responsecodes!="free"){
    
    #for (a in responseeval[,1]){
    for (k in 1:length(responsecodes)){
      m1<-grepl(responsecodes[k],responseeval[[1]])
      responsearray[k]<-sum(m1)
      
      # print(responsearray)  
      
    }
  }
  # print(responsearray)
  #cat(answers)
  qanswer<-responsearray!=0&responsearray!=""
  #qanswer<-responsearray==T
  qna<-!is.na(qanswer)
  out_qanswer<-answers[qanswer]
  if (free==1)
    #    qanswer<-qanswer[qna]
    out_qanswer<-"free"
  #answers
  out_vanswer<-responsearray[qanswer]
  out_cpt<-data.frame(question=qquest[q],answer=out_qanswer,eval=out_vanswer)
  if(free==1){
    #  out_cpt<-data.frame(question=qquest[q],answer=out_qanswer,eval=out_vanswer)
    out_cpt<-subset(out_cpt,!is.na(out_cpt[,3]))
    
  }
  # print(out_cpt)
  return(out_cpt)
}


#}
#f1<-fetchq(7)
#f1
### wks.
# now over dataset
qstart<-7 #first question in set
qend<- grep("(T[0-9]{2,3})",va$VAR)
tail(qend)
qlast<-qend[length(qend)] #last question in set
lq<-qstart:qlast
qset<-list()
#q1<-11
for (q1 in lq){
  qset[[q1]]<-fetchq(q1)  
}
###
# q1<-11
# df<-data.frame(qset[[q1]])
# if (colnames(df[3])=="eval"&df$answer!="free")
#   barplot(df$eval~df$answer,col=2,xlab =df$question[1])


###
# barplot(qset[[11]]$eval,)
# par(new=F)
# barplot(df$eval~df$answer,col=2)
# par(new=T) #red
# plot(le$sentiment$a2i,type = "h",col=3,xaxt="n",yaxt="n",ann = F)
# par(new=T) #green
# plot(le$sentiment$a3i,type = "h",col=7,xaxt="n",yaxt="n",ann = F) #blue
# 
# 
# df<-data.frame(qset[[11]])
# library(ggplot2)
# p<-ggplot(df, aes(y=eval, colour = answer)) + 
#   geom_bar()
# #ggplot2::geom_col()
# p +  labs(x="corpus", y="sentiment absolute", title="sentiment over texts")
# ```