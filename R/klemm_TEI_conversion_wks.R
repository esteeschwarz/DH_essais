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
txt
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

  #regx0e<-"((?<=\[Ξ\]).*?(?=K\.))"#wks oxygen
#regx0h<-"\\[([0-9]{1,4})\\]"
regx0h<-"\\[(\\d{3})\\]"
#txtm0e1<-txt
#grep(regx0h,txtm0e1,value=T)
#pb02<-str_extract_all(txtm0e1,regx0h)
#pb02
#str_replace_all(pb02,regx0i,repl0i)
#m<-gregexec(regx0h,txtm0e1,perl = T)
pb01<-gsub(regx0h,'<pb id="\\1"/>',txtm0e2)
#pb01
#pb0<-regmatches(txt,m)
#as.double(pb0)
#regx0i<-"\\[\\]"
#repl0i<-"digit\\2"
#pb3<-c(gsub(regx0i,repl0i,pb02))
#m<-gregexec(regx0h,txtm0e1,perl = T)
#pb3
#pagecount<-
#repl15e<-'<pb n="\\1"/>'
regx9a<-"(Celimene nimmt ihn, und führt ihn zu Cydalisen.)"
repl9a<-"Celimene. \\1"
regx9b<-"(Erast in der größten Verwirrung)"
repl9b<-"Erast. \\1"
pb02<-gsub(regx9a,repl9a,pb01)
txtmbody<-gsub(regx9b,repl9b,pb02)

#writeLines(gsub(regx9a,repl9a,txtmbody_pb),"testbody.txt")
 }
 # write_clip(pb02)
txtmbody_pb<-txtmraw(txt)
#TODO: save body RAW to file for future comparison of evtl. changed wikicontent
writeLines(txtmbody_pb,"txtmbody_pb.txt")
#txtmbody_pb
#txt<-txtmbody
# global var
regx4<-"> "
regx5<-" <"
repl4<-">"
repl5<-"<"

teiwork<-function(src){
#txt<-src
txt<-txtmbody_pb
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
  regx9a<-"(Henkers werden\\.\\ )(Celimene nimmt ihn und führt ihn zu Cydalisen\\.)"
  repl9a<-"\\2Celimene.<stage>\\3</stage>"
  #  txtm9<-gsub(regx8a,repl8a,txt,perl = T)
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
repl6<-"\\1<speaker>\\2</speaker>" # TODO: still missing first <sp>
txtm6<-gsub(regx6,repl6,txtm5,perl = T)
txtm7<-gsub(regx4,repl4,txtm6,perl = T)
txtm8<-gsub(regx5,repl5,txtm7,perl = T)
}
################### this base #########
txtm8<-teiwork(txt)
##################################
mod12<-function(set){
txtm8<-teiwork(set)
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
txtm8<-teiwork(txt)#+8
# txtm12<-mod12(txt)#
# txtm12<-removegaps(txtm12)
# #### important:##################################################################################
# regx12<-"(<l>)((.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))(?!<)"
# repl12<-"\\1\\3</l></sp><sp><speaker>\\4</speaker><l>"
# #################################################################################################
# #loop over text:
# loopreplace<-function(set,regx,repl){
#   txtmx<-gsub(regx,repl,set,perl = T)
# return(removegaps(txtmx))
# 
#   }
# #zwei durchgänge:
# for (k in 1:20){
#   txtm15<-loopreplace(txtm12,regx12,repl12)
# }
# for (k in 1:20){
#   txtm15<-loopreplace(txtm15,regx12,repl12)
# }
#txtm15
# final<-function(set){
# txtm15<-set
#   regx15a<-"(?!>)<div"
# repl15a<-"</l></sp></div><div"
# regx15b<-"Ende des Lustspiels."
# repl15b<-"</l></sp></div><p>Ende des Lustspiels.</p>"
# regx15d<-"Bediente zu Celimenen."
# repl15d<-"<sp><speaker>Bediente zu Celimenen.</speaker><l>"
# txtm16<-gsub(regx15a,repl15a,txtm15,perl = T)
# txtm17<-gsub(regx15b,repl15b,txtm16,perl = T)
# txtm17<-sub(repl15a,"<div",txtm17)
# txtm18<-gsub(regx15d,repl15d,txtm17,perl = T)
# 
# txtm18<-removegaps(txtm18)
# #txtm18
# }
final8<-function(set){
  txtm15<-set
  regx15a<-"(?!>)<div"
  repl15a<-"</div><div"
  regx15b<-"Ende des Lustspiels."
  repl15b<-"</div><p>Ende des Lustspiels.</p>"
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
  repl19b<-"<front>\n\\1</front>\n"
  regx19c<-"((Der österreichische Patriot.*?)(\\* \\* \\*))"
  repl19c<-'<div type="front">\n<head>\\1</head></div>'
  regx19e<-"((Der Besuch.*?)(?=Personen))"
  repl19e<-'<div type="title">\n<head>\\1</head></div>' #wks

  regx19g<-"((Drey.*?)(\\* \\* \\*))"
  repl19g<-'<div type="issue">\n<head>\\1</head></div>' #wks

#  regx19e<-"((Der Besuch.*?)(?=Personen))"
 # repl19e<-'<div type="title"><head>\\1</head></div>' #wks

  regx19f<-"((Personen.*?)(?=</front>))"
  repl19f<-'<div type="Dramatis_Personae">\n<castlist>\\1</castlist>\n</div>'
  #regx19g<-"((?<=<front>)(Der.*Patriot)(?=</front>))"
  #repl19g<-"<head>\\2</head>"
  #regx19h<-'((?<=front">)(.*?)(?=Drey))'
  #repl19h<-"<head>\\2</head>"
  #regx19i<-"((?<=Patriot\\. \\* \\* \\*)(.*?)(\\* \\* \\*))"
  #repl19i<-"<head>\\2</head>"
  
  txtm16<-gsub(regx15a,repl15a,txtm15,perl = T)
  txtm17<-gsub(regx15b,repl15b,txtm16,perl = T)
  txtm17<-sub(repl15a,"<div",txtm17)
  txtm18<-gsub(regx15d,repl15d,txtm17,perl = T)
  txtm16a<-gsub(regx16,repl16,txtm18,perl = T)
  txtm16b<-gsub(regx17,repl17,txtm16a,perl = T)
 # txtm19a<-gsub(regx19a,repl19a,txtm16b,perl = T)
  txtm19b<-gsub(regx19b,repl19b,txtm16b,perl = T)
  txtm19c<-gsub(regx19c,repl19c,txtm19b,perl = T)
  txtm19e<-gsub(regx19e,repl19e,txtm19c,perl = T)
  txtm19f<-gsub(regx19f,repl19f,txtm19e,perl = T)
  txtm19g<-gsub(regx19g,repl19g,txtm19f,perl = T)
#  txtm19h<-gsub(regx19h,repl19h,txtm19f,perl = T)
 # txtm19i<-gsub(regx19i,repl19i,txtm19f,perl = T)
  
  txtm18<-removegaps(txtm19g)
  #txtm18
 # m<-gregexec(regx19d,txtm8d,perl = T)
  #regmatches(txtm8d,m)
  # 
}
#tx1<-final8(txtm8c)
#tx1
#txtm18<-final8(txtm15)
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
# txtm21<-paste0("linebreak","\n","next")
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
txtm19<-gsub("</p>",'</p>\n',txtm19)
txtm19<-gsub("</div>",'</div>\n',txtm19)

}
#klemm_final<-formatting(txtm18)
### run routine:
#write_clip(klemm_final)
#########
#stuck xml line 333
#lisas:
#regx20<-"(?<!<speaker>)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)"
regx8a<-"(?<!<speaker>|</speaker>|<stage>|</stage>)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)(?!</stage>)"
repl8a<-"<speaker>\\1</speaker>"
#m<-gregexec(regx12a,txtm12,perl = T)
#regmatches(txtm12,m)#132=oxygen
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
repl9a<-"\\1<p>\\2</p></sp><sp>\\3"
#regx8b<-"(</speaker>)(.+?)(</div>)"#first end of scene lines
#repl8b<-"\\1<p>\\2</p></sp>\\3"
#txtm8e<-gsub(regx8b,repl8b,txtm8c,perl = T)
regx19d<-"(<p>)(<stage>.*?</stage>)"
repl19d<-"\\2\\1"

txtm9a<-gsub(regx9a,repl9a,txtm8c,perl = T)

txtm9b<-formatting(txtm9a)


#m<-gregexec(regx8b,txtm8c,perl = T)
#regmatches(txtm8c,m)#132=oxygen
#txtm8c
write_clip(formatting(txtm8c))

#12245.
#lisa hint:
#regx13<-"(?<=Celimene\\.|Finette\\.).*?(?=Celimene\.|Finette\.|$)"
speaker.pt<-"Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\."
regx13<-paste0("(?<",speaker.pt,").*?(?=",speaker.pt,"|$)")
regx13<-"(?<=Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.).*?(?=Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.|$)"
#txtm9a
#txtm8c
regx14<-"((?<=</speaker>).*?(?=<speaker>|</div>|$))"
#m<-gregexec(regx14,txtm8c,perl = T)
#regmatches(txtm8c,m)
#nearly through.
repl14<-"<p>\\1</p></sp><sp>"
txtm8d<-gsub(regx14,repl14,txtm8c,perl = T)
txtm19d<-gsub(regx19d,repl19d,txtm8d,perl = T)

txtm19d<-formatting(txtm19d)
writeLines(txtm19d,"klemm_TEI_body.xml")

