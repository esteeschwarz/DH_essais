#12231.TEI conversion essai
#20220604(10.25)
###########################
getwd()
#src<-"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/klemm_TEI.xml"
src<-"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/klemm_TEI_wikiraw.xml"
#src<-"https://raw.githubusercontent.com/esteeschwarz/DH_essais/main/data/corpus/klemm_besuch/klemm(1765)_clean.txt"
src<-"https://raw.githubusercontent.com/esteeschwarz/DH_essais/main/data/corpus/klemm_besuch/klemm(1765)_wiki_preprocessed.txt"
#txt<-scan(src,"")
#library(stringi)
library(httr)
#txt<-readLines(src)
api_call<-httr::GET(src)
txt<-httr::content(api_call,"text")

#library(stringi)
library(clipr)
library(xml2)
library(stringr)
#txt
set<-txt
# get wikisource textbody
txtmraw<-function(set){
  regx0b<-"[^A-Za-zäöü,\\.;\\-–\\? ß\\[\\]0-9\\!\\(\\)]"
#  regx0a<-"((?<=<body>).*?(?=</body>))"
  regx0c<-"\\[Ξ\\]"#start content after wiki declaration
  regx0d<-"K\\."
 # set<-txtm0e1
  #m<-gregexec(regx0c,set,perl = T)
  #m<-gregexec(regx0e,set,perl = T)
#working regx14<-"((?<=</speaker>).*?(?=<speaker>|</div>|$))"
  
  #regmatches(set,m)
  #regx0e<-paste0("((?<=",regx0c,").*?(?=",regx0d,"))")
  #regx0e<-paste0("((?<=\\[Ξ\\]).*?(?=K\\.))")
  regx0e<-paste0("((?<=",regx0c,").*?(?=",regx0d,"))")
  
  #repl0e<-""
  regx0f<-"\\n|\\t"
repl0f<-" "
txtm0e1<-gsub(regx0f,repl0f,set,perl = T)
regx0g<-"\\s{2,8}"
txtm0e1<-gsub(regx0g,repl0f,txtm0e1,perl = T)
txtm0e2<-str_extract(txtm0e1,regx0e)
#save raw text:
writeLines(txtm0e2,"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/klemm_wiki_extr_preprocessed.txt")

regx0h<-"\\[(\\d{3})\\]"
pb01<-gsub(regx0h,'<pb id="\\1"/>',txtm0e2)
regx9a<-"(Celimene nimmt ihn, und führt ihn zu Cydalisen.)"
repl9a<-"Celimene. \\1"
regx9b<-"(Erast in der größten Verwirrung)"
repl9b<-"Erast. \\1"
pb02<-gsub(regx9a,repl9a,pb01)
txtmbody<-gsub(regx9b,repl9b,pb02)
} #end txtmraw


txtmbody_pb<-txtmraw(txt)
#TODO: save body RAW to file for future comparison of evtl. changed wikicontent
writeLines(txtmbody_pb,"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/klemm_textbody_001.txt")
# global var
regx4<-"> "
regx5<-" <"
repl4<-">"
repl5<-"<"

teiwork<-function(src){
txt<-src
# ground:
library(purrr)
# here add findings manually to replace after chech final xml output

ground<-function(set){
  regx1<-"Der Besuch\\. "
  repl1<-""
  regx2<-", (Cydalise|Erast|Damis)\\."
  repl2<-", \\1-."
  regx3<-"\\.([A-Za-z])"
  repl3<-". \\1"
  regx4<-", Cydalise\\."
  repl4<-", Cydalise-."
  regx5<-"Fräulein Chlorinde\\."
  repl5<-"Fräulein Chlorinde-."
  regx6<-"Frau von Celimene\\."
  repl6<-"Frau von Celimene-."
  regx7<-"(ihre|liebe|ja) Cydalise\\."
  repl7<-"\\1 Cydalise-."
  regx8<-"Fräulein Cydalise\\."
  repl8<-"Fräulein Cydalise-."
  regx9<-"(dem|Herr) Damis\\."
  repl9<-"\\1 Damis-."
  regx9a<-"(Henkers werden\\.\\ )(Celimene nimmt ihn und führt ihn zu Cydalisen\\.)" #out
  repl9a<-"\\2Celimene.<stage>\\3</stage>" #out
  # add regx/repl at end to array
  regx.ground<-rbind(regx1,regx2,regx3,regx4,regx5,regx6,regx7,regx8,regx9,regx9a)
  repl.ground<-rbind(repl1,repl2,repl3,repl4,repl5,repl6,repl7,repl8,repl9,repl9a)
  formground<-cbind(regx.ground,repl.ground)
  cground<-cbind(formground,txt)
  # add new line with successive numbers for every replacement
  cground[1,3]<-gsub(cground[1,1],cground[1,2],txt,perl = T)
  cground[2,3]<-gsub(cground[2,1],cground[2,2],cground[1,3],perl = T)
  cground[3,3]<-gsub(cground[3,1],cground[3,2],cground[2,3],perl = T)
  cground[4,3]<-gsub(cground[4,1],cground[4,2],cground[3,3],perl = T)
  cground[5,3]<-gsub(cground[5,1],cground[5,2],cground[4,3],perl = T)
  cground[6,3]<-gsub(cground[6,1],cground[6,2],cground[5,3],perl = T)
  cground[7,3]<-gsub(cground[7,1],cground[7,2],cground[6,3],perl = T)
  cground[8,3]<-gsub(cground[8,1],cground[8,2],cground[7,3],perl = T)
  cground[9,3]<-gsub(cground[9,1],cground[9,2],cground[8,3],perl = T)
#  cground[10,3]<-gsub(cground[10,1],cground[10,2],cground[9,3],perl = T)
  
    txt<-cground[9,3]
    table_ground<-cground
} #end ground
ground<-ground(txt)
ground(txt)[8,3]
repl1<-'<div type="scene"><head>\\1 \\2</head><stage>'
regx1<-"(Erster|Zweyter|Dritter|Vierter|Fünfter|Sechster|Siebenter|Achter|Neunter) (Auftritt. )"
#stri_extract_all_regex(txtm,regx3)
txtm1<-gsub(regx1,repl1,txt,perl = T)
#txtm
#wks.
regx2<-"</pb.{1,2}>"
repl2<-" "
txtm2<-gsub(regx2,repl2,txtm1,perl = T)
###
speaker.pt<-"(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)"
regx3<-"(<stage>.*?\\.)"
repl3<-"\\1</stage>"
txtm3<-gsub(regx3,repl3,txtm2,perl = T)
#txtm
regx4<-"> "
regx5<-" <"
repl4<-">"
repl5<-"<"
txtm4<-gsub(regx4,repl4,txtm3,perl = T)
txtm5<-gsub(regx5,repl5,txtm4,perl = T)
#txtm
regx6<-paste0("(</stage>)",speaker.pt)
repl6<-"\\1<speaker>\\2</speaker>" # TODO: still missing first <sp>
txtm6<-gsub(regx6,repl6,txtm5,perl = T)
txtm7<-gsub(regx4,repl4,txtm6,perl = T)
txtm8<-gsub(regx5,repl5,txtm7,perl = T)
} #end teiwork
################### this base #########
txtm8<-teiwork(txtmraw(txt))
##################################
# mod12<-function(set){
# txtm8<-teiwork(set)
# regx10<-"(</speaker>)((.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))"
# repl10<-"\\1<l>\\3</l></sp><sp><speaker>\\4</speaker><l>"
# txtm<-txtm8
# txtm10<-gsub(regx10,repl10,txtm,perl = T)
# txtm11<-gsub(regx4,repl4,txtm10,perl = T)
# txtm12<-gsub(regx5,repl5,txtm11,perl = T)
# 
# }

#write_clip(txtm)

####################### \1 ####\2#\3###\4###
# regx10<-"(</speaker>)((.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))"
# repl10<-"\\1<l>\\3</l></sp><sp><speaker>\\4</speaker><l>"
# txtm10<-gsub(regx10,repl10,txtm,perl = T)
# txtm11<-gsub(regx4,repl4,txtm10,perl = T)
# txtm12<-gsub(regx5,repl5,txtm11,perl = T)
####
removegaps<-function(set){
txtm<-set
  regx4<-"> "
  regx5<-" <"
  repl4<-">"
  repl5<-"<"
  txtm<-gsub(regx4,repl4,txtm,perl = T)
  txtm<-gsub(regx5,repl5,txtm,perl = T)
  
}

final8<-function(set){
  txtm15<-set
  regx15a<-"(?!>)<div"
  repl15a<-"</div><div"
  regx15aa<-"</div><div"
  repl15aa<-"<div"
  regx15b<-"Ende des Lustspiels."
  repl15b<-"</div><p>Ende des Lustspiels.</p>\n</body>"
  regx15d<-"Bediente zu Celimenen."
  repl15d<-"<speaker>Bediente zu Celimenen.</speaker>"
#  regx15e<-"\\[[0-9]{1,4}\\]"
 # repl15e<-'<pb n="\\1"/>'
  regx15e<-"((?<=<body>).*?(?=</body>))"
  regx16<-"(Celimene nimmt ihn, und führt ihn zu Cydalisen.)"
  repl16<-"<stage>\\1</stage>"
  regx17<-"(Erast in der größten Verwirrung, setzt sich.)"
  repl17<-"<stage>\\1</stage>"
  regx19a<-"</stage>(.*?)<speaker>"
  repl19a<-"</stage><sp>\\1<speaker>"
  # regx19d<-"(<p>)(<stage>.*?</stage>)"
  # repl19d<-"\\3\\2"
  # 
  regx19b<-"((Der österreichische Patriot.*?)(?=<div))"
  repl19b<-"<front>\n\\1</front>\n<body>\n"

  regx19c<-"((Der österreichische Patriot.*?)(\\* \\* \\*))"
  repl19c<-'<div type="front">\n<head>\\1</head></div>'

  regx19e<-"((Der Besuch.*?)(?=Personen))"
  repl19e<-'<div type="title">\n<head>\\1</head></div>' #wks

  regx19g<-"((Drey.*?)(\\* \\* \\*))"
  repl19g<-'<div type="issue">\n<head>\\1</head></div>' #wks

  regx19f<-"((Personen.*?)(?=</front>))"
  repl19f<-'<div type="Dramatis_Personae">\n<castlist>\\1</castlist>\n</div>'

  # regx19h<-"</stage><p><sp>"
  # repl19h<-"</stage><sp><p>"
  #regx19g<-"((?<=<front>)(Der.*Patriot)(?=</front>))"
  #repl19g<-"<head>\\2</head>"
  #regx19h<-'((?<=front">)(.*?)(?=Drey))'
  #repl19h<-"<head>\\2</head>"
  #regx19i<-"((?<=Patriot\\. \\* \\* \\*)(.*?)(\\* \\* \\*))"
  #repl19i<-"<head>\\2</head>"
  
  txtm16<-gsub(regx15a,repl15a,txtm15,perl = T)
  txtm17<-gsub(regx15b,repl15b,txtm16,perl = T)
  txtm17<-sub(repl15aa,repl15aa,txtm17)
  txtm18<-gsub(regx15d,repl15d,txtm17,perl = T)
  txtm16a<-gsub(regx16,repl16,txtm18,perl = T)
  txtm16b<-gsub(regx17,repl17,txtm16a,perl = T)
  txtm19a<-gsub(regx19a,repl19a,txtm16b,perl = T)
  txtm19b<-gsub(regx19b,repl19b,txtm19a,perl = T)
  txtm19c<-gsub(regx19c,repl19c,txtm19b,perl = T)
  txtm19e<-gsub(regx19e,repl19e,txtm19c,perl = T)
  txtm19f<-gsub(regx19f,repl19f,txtm19e,perl = T)
  txtm19g<-gsub(regx19g,repl19g,txtm19f,perl = T)
#  txtm19h<-gsub(regx19h,repl19h,txtm19g,perl = T)
 # txtm19i<-gsub(regx19i,repl19i,txtm19f,perl = T)
  # add regx/repl at end to array
  regx.ground<-rbind(regx15a,regx15aa,regx15b,regx15d,regx16,regx17,regx19a,regx19b,regx19c,regx19e,regx19f,regx19g) #12
  repl.ground<-rbind(repl15a,repl15aa,repl15b,repl15d,repl16,repl17,repl19a,repl19b,repl19c,repl19e,repl19f,regx19g)
  formground<-cbind(regx.ground,repl.ground)
  cground<-cbind(formground,txt)
  # add new line with successive numbers for every replacement
  cground[1,3]<- gsub(cground[1,1],cground[1,2],txt,perl = T)
  cground[2,3]<- gsub(cground[2,1],cground[2,2],cground[1,3],perl = T)
  cground[3,3]<- gsub(cground[3,1],cground[3,2],cground[2,3],perl = T)
  cground[4,3]<- gsub(cground[4,1],cground[4,2],cground[3,3],perl = T)
  cground[5,3]<- gsub(cground[5,1],cground[5,2],cground[4,3],perl = T)
  cground[6,3]<- gsub(cground[6,1],cground[6,2],cground[5,3],perl = T)
  cground[7,3]<- gsub(cground[7,1],cground[7,2],cground[6,3],perl = T)
  cground[8,3]<- gsub(cground[8,1],cground[8,2],cground[7,3],perl = T)
  cground[9,3]<- gsub(cground[9,1],cground[9,2],cground[8,3],perl = T)
  cground[10,3]<-gsub(cground[10,1],cground[10,2],cground[9,3],perl = T)
  cground[11,3]<-gsub(cground[11,1],cground[11,2],cground[10,3],perl = T)
  cground[12,3]<-gsub(cground[12,1],cground[12,2],cground[11,3],perl = T)
  
  txt<-cground[12,3]
  
  txtm18<-removegaps(txtm19g)
txtm18b<-removegaps(txt)  
table_final8<-cground
}
outfinal8<-final8(txtmraw(txt))
formatting<-function(set){
txtm18<-set
  txtm19<-gsub("</head>",'</head>\n',txtm18)
txtm19<-gsub("</stage>",'</stage>\n',txtm19)
txtm19<-gsub("<sp>",'<sp>\n',txtm19)
txtm19<-gsub("</speaker>",'</speaker>\n',txtm19)
txtm19<-gsub("</sp>",'</sp>\n',txtm19)
#txtm19<-gsub("<l>",'<l>\n',txtm19)
txtm19<-gsub("</l>",'</l>\n',txtm19)
txtm19<-gsub("</p>",'</p>\n',txtm19)
txtm19<-gsub("</div>",'</div>\n',txtm19)

}
#klemm_final<-formatting(txtm18)
### run routine:

final9<-function(set){
#lisas:
#regx20<-"(?<!<speaker>)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)"
regx8a<-"(?<!<speaker>|</speaker>|<stage>|</stage>)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)(?!</stage>)"
repl8a<-"<speaker>\\1</speaker>"
txtm8b<-gsub(regx8a,repl8a,txtm8,perl = T)
txtm8b<-removegaps(txtm8b)
txtm8c<-final8(txtm8b)
txtm8d<-formatting(txtm8c)
write_clip(txtm8d)
################## wks.
#12242.neu from regex lisa.
#<p> from </speaker> to <speaker>
#regx9a<-"(?<=</speaker>)(.*)"
#look left: regx9a<-"(?<=</speaker>)(.*)"
regx9a<-"(</speaker>)(.+?)(<speaker>)"
#regx9a<-"(</speaker>)(.+?)(<speaker>)" #wks. groups: 1=complete, 2,3,4 following, reference group by natural order, not array indizes
repl9a<-"<sp>\\1<p>\\2</p></sp>\\3"
#regx8b<-"(</speaker>)(.+?)(</div>)"#first end of scene lines
#repl8b<-"\\1<p>\\2</p></sp>\\3"
#txtm8e<-gsub(regx8b,repl8b,txtm8c,perl = T)
regx19d<-"(<p>)(<stage>.*?</stage>)"
repl19d<-"\\2\\1"
regx19h<-"</stage><p><sp>"
repl19h<-"</stage><sp><p>"


txtm9a<-gsub(regx9a,repl9a,txtm8c,perl = T)

txtm9b<-formatting(txtm9a)
#12245.
#lisa hint:
#regx13<-"(?<=Celimene\\.|Finette\\.).*?(?=Celimene\.|Finette\.|$)"
speaker.pt<-"Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\."
regx13<-paste0("(?<",speaker.pt,").*?(?=",speaker.pt,"|$)")
regx13<-"(?<=Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.).*?(?=Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.|$)"
regx14<-"((?<=</speaker>).*?(?=<speaker>|</div>|$))"
repl14<-"<p>\\1</p></sp><sp>"
txtm8d<-gsub(regx14,repl14,txtm8c,perl = T)
txtm19d<-gsub(regx19d,repl19d,txtm8d,perl = T)
txtm19h<-gsub(regx19h,repl19h,txtm19d,perl = T)
#########
# add regx/repl at end to array
regx.ground<-rbind(regx8a,2,3,4,regx9a,6,regx14,regx19d,regx19h,10) #5
repl.ground<-rbind(repl8a,2,3,4,repl9a,6,repl14,repl19d,repl19h,10)
formground<-cbind(regx.ground,repl.ground)
cground<-cbind(formground,txt)
# add new line with successive numbers for every replacement
cground[1,3]<- gsub(cground[1,1],cground[1,2],txt,perl = T)
cground[2,3]<- removegaps(                    cground[1,3])
cground[3,3]<- final8(                        cground[2,3])
cground[4,3]<- formatting(                    cground[3,3])
cground[5,3]<- gsub(cground[5,1],cground[5,2],cground[4,3],perl = T)
cground[6,3]<- formatting(                    cground[5,3])
cground[7,3]<- gsub(cground[7,1],cground[7,2],cground[6,3],perl = T)
cground[8,3]<- gsub(cground[8,1],cground[8,2],cground[7,3],perl = T)
cground[9,3]<- gsub(cground[9,1],cground[9,2],cground[8,3],perl = T)
cground[10,3]<-formatting(                    cground[9,3])
# cground[11,3]<-gsub(cground[11,1],cground[11,2],cground[10,3],perl = T)
# cground[12,3]<-gsub(cground[12,1],cground[12,2],cground[11,3],perl = T)

txt<-cground[10,3]
table_final9<-cground
}

teibody<-final9(txtm8)

#writeLines(teibody,"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/klemm_TEI_body.xml")


#txtm19h<-formatting(txtm19h)
#writeLines(txtm19h,"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/klemm_TEI_body.xml")

