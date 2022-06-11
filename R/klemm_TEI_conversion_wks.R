#12231.TEI conversion essai
#20220604(10.25)
###########################
getwd()
#src<-"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/klemm_TEI.xml"
#src<-"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/klemm(1765)_clean.txt"
src<-"https://raw.githubusercontent.com/esteeschwarz/DH_essais/main/data/corpus/klemm_besuch/klemm(1765)_clean.txt"
#library(stringi)
txt<-readLines(src)
#library(stringi)
library(clipr)
library(xml2)

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
  regx7<-"(ihre|liebe) Cydalise\\."
  repl7<-"\\1 Cydalise-."
  regx8<-"Fräulein Cydalise\\."
  repl8<-"Fräulein Cydalise-."
  regx9<-"(dem|Herr) Damis\\."
  repl9<-"\\1 Damis-."
  
  #  txtm9<-gsub(regx8a,repl8a,txt,perl = T)
  # add regx/repl at end to array
  regx.ground<-rbind(regx1,regx2,regx3,regx4,regx5,regx6,regx7,regx8,regx9)
  repl.ground<-rbind(repl1,repl2,repl3,repl4,repl5,repl6,repl7,repl8,repl9)
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
  
    txt<-cground[9,3]
}
txt<-ground(txt)
#txt
#regexsafe<-regextable()
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
repl6<-"\\1<sp><speaker>\\2</speaker>"
txtm6<-gsub(regx6,repl6,txtm5,perl = T)
txtm7<-gsub(regx4,repl4,txtm6,perl = T)
txtm8<-gsub(regx5,repl5,txtm7,perl = T)

regx10<-"(</speaker>)((.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))"
repl10<-"\\1<l>\\3</l></sp><sp><speaker>\\4</speaker><l>"
txtm<-txtm8
txtm10<-gsub(regx10,repl10,txtm,perl = T)
txtm11<-gsub(regx4,repl4,txtm10,perl = T)
txtm12<-gsub(regx5,repl5,txtm11,perl = T)

}

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
txtm<-teiwork(txt)
txtm12<-removegaps(txtm)
#### important:##################################################################################
regx12<-"(<l>)((.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))(?!<)"
repl12<-"\\1\\3</l></sp><sp><speaker>\\4</speaker><l>"
#################################################################################################
#loop over text:
loopreplace<-function(set,regx,repl){
  txtmx<-gsub(regx,repl,set,perl = T)
return(removegaps(txtmx))

  }
#zwei durchgänge:
for (k in 1:20){
  txtm15<-loopreplace(txtm12,regx12,repl12)
}
for (k in 1:20){
  txtm15<-loopreplace(txtm15,regx12,repl12)
}
#txtm15
final<-function(set){
txtm15<-set
  regx15a<-"(?!>)<div"
repl15a<-"</l></sp></div><div"
regx15b<-"Ende des Lustspiels."
repl15b<-"</l></sp></div><p>Ende des Lustspiels.</p>"
regx15d<-"Bediente zu Celimenen."
repl15d<-"<sp><speaker>Bediente zu Celimenen.</speaker><l>"
txtm16<-gsub(regx15a,repl15a,txtm15,perl = T)
txtm17<-gsub(regx15b,repl15b,txtm16,perl = T)
txtm17<-sub(repl15a,"<div",txtm17)
txtm18<-gsub(regx15d,repl15d,txtm17,perl = T)

txtm18<-removegaps(txtm18)
#txtm18
}
txtm18<-final(txtm15)
# txtm[12,8]
#library(clipr)
#write_clip(txtm18)
#writeLines(txtm15,"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/klemm_TEI_Routput001.xml")
# dramavlg<-readLines("..data/Drama-Test.xml")
# getwd()
# regx16<-"<body>.*</body>"
# regx17<-"Garten"
# m<-gregexec(regx16,dramavlg,perl = T)
# regmatches(dramavlg,m)
# repl16<-"<body>dummy</body>"
# txtm16<-gsub(regx16,repl16,dramavlg,perl = T)
# txtm16
#library(xml2)
library(purrr)
#dramaxml<-read_xml("../data/Drama-Test.xml")
#xml_find_all(dramaxml,"body",ns=)
# xml_ns(dramaxml)
# data<-dramaxml
# drama.ns<-xml_ns(data)
# data %>% xml_ns()
# data%>% xml_ns_strip()
# drama.ns
# # Beispiel 1: xpath-Pfade anzeigen
# # Alle xpath-Pfade anzeigen
# data %>% 
#   xml_find_all('//*') %>%
#   xml_path()
# ?xml_path
# 
# # Alle xpath-Pfade zu einem head-Element anzeigen
# all_heads <- data %>% 
#   xml_find_all('//body') %>%
#   xml_path()
# all_heads
# all_heads[1]
# 
# # Beispiel 2: Alle Kapitelüberschriften extrahieren
# # So geht es nicht
# xml_text(all_heads[2])
# # So geht es
# all_chapters <- data %>% 
#   xml_find_all('//body') %>%
#   xml_text()
# all_chapters
# xml_text(xml_find_all(data,"//body"))<-"dummy"
# read_xml(txtm15)
##### 12241. formatieren
# regx18<-"</head>"
# repl18<-"</head>\r"
# txtm19<-gsub(regx18,repl18,txtm18,perl = F)
# txtm19
# txtm20<-readLines("../data/temp/klemm_TEI_formatted.html")
# getwd()
# regx20<-"\\r"
# m<-gregexec(regx20,txtm20,perl = T)
# regmatches(txtm20,m)
# txtm20
# stri_extract_all_regex(txtm20,regx20)
# txtm21<-paste0("linebreak","\n","next")
# txtm21
# stri_split_regex(txtm18,"</head>")
#write_clip(txtm19)

formatting<-function(set){
txtm18<-set
  txtm19<-gsub("</head>",'</head>\n',txtm18)
txtm19<-gsub("</stage>",'</stage>\n',txtm19)
txtm19<-gsub("<sp>",'<sp>\n',txtm19)
txtm19<-gsub("</speaker>",'</speaker>\n',txtm19)
txtm19<-gsub("</sp>",'</sp>\n',txtm19)
#txtm19<-gsub("<l>",'<l>\n',txtm19)
txtm19<-gsub("</l>",'</l>\n',txtm19)
txtm19<-gsub("</div>",'</div>\n',txtm19)

}
klemm_final<-formatting(txtm18)
### run routine:
write_clip(klemm_final)
#########
#stuck xml line 333
#lisas:
#regx20<-"(?<!<speaker>)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)"
regx20<-"(?<!<speaker>|</speaker>|<stage>|</stage>)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)(?!</stage>)"

# write_clip(txtm)
# regx.oxygenexpo<-function(form){
#   x<-(stri_replace_all(form,replacement ="a ",fixed ="spe "))
# return(x)
#   }
# x<-regx.oxygenexpo(regx20)
# x
# x<-(stri_replace_all("teufel\\auch",replacement ="\\ ",regex ="eu",stri_opts_regex(literal = T)))
# library(stringi)
# stringi-search-fixed()
# x
# library(stringr)
# x<-str_replace_all("teufel\\auch",pattern = "eu",replacement = "\\'\\\'")
# x
# #not possible to replace something with \
repl20<-"<speaker>\\1</speaker>"
m<-gregexec(regx20,txtm,perl = T)
regmatches(txtm,m)#132=oxygen
txtm21<-gsub(regx20,repl20,txtm,perl = T)
write_clip(txtm21)
