#12231.TEI conversion essai
#20220604(10.25)
###########################
#20220619(14.49)
#finish this script. source: https://github.com/esteeschwarz/DH_essais/R/klemm_TEI_conversion_wks.R
#ongoing process: https://github.com/esteeschwarz/DH_essais/R/klemm_TEI_conversion_wks_process.R
#20220619(19.50)
#aktualisiert, status working bis auf schema integration, body complete.
#20230204(11.07)
#documented essai for global appplication on sources
###########################
#1.abstract:
#TEI declaration of wikisource dramatext for further processing
getwd()
#src<-"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/klemm_TEI.xml"
#src<-"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/klemm_TEI_wikiraw.xml"
#src<-"https://raw.githubusercontent.com/esteeschwarz/DH_essais/main/data/corpus/klemm_besuch/klemm(1765)_clean.txt"
##### modify for raw text:
##########################
#txt<-scan(src,"")
#library(stringi)
library(httr)
library(rvest)
library(stringi)
###################################
#this calls static txt from repository
#src<-"https://raw.githubusercontent.com/esteeschwarz/DH_essais/main/data/corpus/klemm_besuch/klemm(1765)_wiki_preprocessed.txt"
#api_call<-httr::GET(src)
#txt<-httr::content(api_call,"text")
###################################
# lisa scrape:
src<-"https://de.wikisource.org/wiki/Der_Besuch_(Klemm)"
dta1<-read_html(src)
xpathkl<-'//*[@id="mw-content-text"]/div[1]/div[2]'
#xpath copied from browser developer tools (safari)
html_nodes(dta1,xpath = xpathkl)
txt<-html_nodes(dta1,xpath = xpathkl) %>%html_text()
#gets plain text
#wks.
#now with epub formatted text:
src<-"https://ws-export.wmcloud.org/?format=epub&lang=de&page=Der_Besuch_(Klemm)"
dta2<-read_html(src) #no
# x<-GET(src) #no
# dta2<-content(x,"text")
getwd()
dta2<-read_xml("local/EXC2020/DD23/data/c0_Der_Besuch__Klemm_.xhtml") #xml extracted from epub
xpathkl<-'/html/body/section/div/'
xml_child(xml_child(xml_child(xml_child(xml_child(dta2, 2), 1), 3), 12), 1)
#xpath copied from browser developer tools (safari)
html_nodes(dta2,xpath = xpathkl)

data<-dta2
?xml_name
xml_name(data)
xml_name(xml_parent(data)) #keine Eltern - Wurzelelement
xml_name(xml_children(data))
data
# Namespace anzeigen
xml_attr(data, "xmlns")

# Namespace entfernen

data %>% xml_ns()
data%>% xml_ns_strip()

# Beispiel 1: xpath-Pfade anzeigen
# Alle xpath-Pfade anzeigen
data %>% 
  xml_find_all('//*') %>%
  xml_path()
#?xml_path

# Alle xpath-Pfade zu einem head-Element anzeigen
all_heads <- data %>% 
  xml_find_all('//div') %>%
  xml_path()
all_heads

all_divs <- data %>% 
  xml_find_all('//div/div')
xml_text(all_divs[1])
xml_attr(all_divs[6],"style")

#all speakerlist in scene 
all_i <- data %>% 
  xml_find_all('//div/div/i')
xml_text(all_i[2])

#all speaker declaration of scene paragraph
all_b <- data %>% 
  xml_find_all('//div/p/b')
xml_text(all_b[3])


txt<-html_nodes(dta1,xpath = xpathkl) %>%html_text()
xml_find_all(dta2,xpathkl)
#library(stringi)
library(clipr)
#library(xml2)
library(stringr)
#txt
#set<-txt
# get wikisource textbody
txtmraw<-function(set){
  regx0b<-"[^A-Za-zäöü,\\.;\\-–\\? ß\\[\\]0-9\\!\\(\\)]"
  #  regx0a<-"((?<=<body>).*?(?=</body>))"
  regx0c<-"\\[Ξ\\]"#start content after wiki declaration
  regx0d<-"K\\."
  regx0e<-paste0("((?<=",regx0c,").*?(?=",regx0d,"))")
  regx0f<-"\\n|\\t"
  repl0f<-" "
  txtm0e1<-gsub(regx0f,repl0f,set,perl = T)
  regx0g<-"\\s{2,8}"
  txtm0e1<-gsub(regx0g,repl0f,txtm0e1,perl = T)
  txtm0e2<-str_extract(txtm0e1,regx0e)
  regx0h<-"\\[(\\d{3})\\]"
  pb01<-gsub(regx0h,'<pb break="\\1"/>',txtm0e2)
  regx9a<-"(Celimene nimmt ihn, und führt ihn zu Cydalisen.)"
  repl9a<-"Celimene. \\1"
  regx9b<-"(Erast in der größten Verwirrung)"
  repl9b<-"Erast. \\1"
  pb02<-gsub(regx9a,repl9a,pb01)
  txtmbody<-gsub(regx9b,repl9b,pb02)
}
# write_clip(pb02)
txtmbody_pb<-txtmraw(txt)
#TODO: save body RAW to file for future comparison of evtl. changed wikicontent
### decomment ff.
#writeLines(txtmbody_pb,"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/txtmbody_pb.txt")
# global var
regx4<-"> "
regx5<-" <"
repl4<-">"
repl5<-"<"
#######################
teiwork<-function(src){
  #txt<-src
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
    regx9a<-"(Henkers werden\\.\\ )(Celimene nimmt ihn und führt ihn zu Cydalisen\\.)"
    repl9a<-"\\2Celimene.<stage>\\3</stage>"
    #  txtm9<-gsub(regx8a,repl8a,txt,perl = T)
    # add regx/repl at end to array
    regx.ground<-rbind(regx1,regx2,regx3,regx4,regx5,regx6,regx7,regx8,regx9,regx9a)#10
    repl.ground<-rbind(repl1,repl2,repl3,repl4,repl5,repl6,repl7,repl8,repl9,repl9a)
    formground<-cbind(regx.ground,repl.ground)
    cground<-cbind(formground,txt)
    # add new line with successive numbers for every replacement
    cground[1,3]<-gsub(cground[1,1],cground[1,2],txt,perl = T)
    cground[2,3]<-gsub(cground[2,1],cground[2,2],txt,perl = T)
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
} ################# end teiwork


################### this base #########
txtm8<-teiwork(txtmbody_pb) #txtmraw(txt)
##################################
# mod12<-function(set){
#   txtm8<-teiwork(set)
#   regx10<-"(</speaker>)((.*?)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.))"
#   repl10<-"\\1<l>\\3</l></sp><sp><speaker>\\4</speaker><l>"
#   txtm<-txtm8
#   txtm10<-gsub(regx10,repl10,txtm,perl = T)
#   txtm11<-gsub(regx4,repl4,txtm10,perl = T)
#   txtm12<-gsub(regx5,repl5,txtm11,perl = T)
#   
# }

removegaps<-function(set){
  txtm<-set
  regx4<-"> "
  regx5<-" <"
  repl4<-">"
  repl5<-"<"
  txtm<-gsub(regx4,repl4,txtm,perl = T)
  txtm<-gsub(regx5,repl5,txtm,perl = T)
  
}
#txtm8<-teiwork(txt)#+8
# txt8<-final8(txtm8)
# txt8
# txt9<-final9(txt8)
# txt9
######################
final8<-function(set){
  ###chk
  
  regx8a<-"(?<!<speaker>|</speaker>|<stage>|</stage>)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)(?!</stage>)"
  repl8a<-"<speaker>\\1</speaker>"
  txtm8b<-gsub(regx8a,repl8a,txtm8,perl = T)
  txtm8b<-removegaps(txtm8b)
  #txtm8b
  txtm15<-txtm8b
  regx15a<-"(?!>)<div"
  repl15a<-"</div><div"
  regx15b<-"Ende des Lustspiels."
  repl15b<-'</div><div type="fin"><p>Ende des Lustspiels.</p></div></body>'
  regx15d<-"Bediente zu Celimenen."
  repl15d<-"<speaker>Bediente zu Celimenen.</speaker>"
  #regx15e<-"((?<=<body>).*?(?=</body>))"
  regx16<-"(Celimene nimmt ihn, und führt ihn zu Cydalisen.)"
  repl16<-"<stage>\\1</stage>"
  regx17<-"(Erast in der größten Verwirrung, setzt sich.)"
  repl17<-"<stage>\\1</stage>"
  regx19a<-"</stage>(.*?)<speaker>"
  repl19a<-"</stage><sp>\\1<speaker>"
  regx19b<-"((Der österreichische Patriot.*?)(?=<div))"
  repl19b<-"<front>\\1</front><body>"
  regx19c<-"((Der österreichische Patriot.+?)(\\* \\* \\*))"
  repl19c<-'<div type="front"><head>\\1</head></div>'
  regx19e<-"((Der Besuch.+?)(Aufzuge.))"
  repl19e<-'<div type="title"><head>\\1</head></div>' #wks
  regx19g<-"((Drey.+?)(\\* \\* \\*))"
  repl19g<-'<div type="issue"><head>\\1</head></div>' #wks
  regx19f<-"((Personen.*?)(?=</front>))"
  repl19f<-'<div type="Dramatis_Personae"><castList>\\1</castList></div>'
  regx19h<-"((?<=</head>)((.*)(Celimene..|Erast..|Chlorinde..|Damis..|Cydalise..|Finette..)(.*)){1,6}(?=</castList>))"
  repl19h<-"<castItem>\\2</castItem>"
  #regx19j<-"(</head>.*)(Celimene..|Erast..|Chlorinde..|Damis..|Cydalise..|Finette..){6}(.*)(</castList>)"
  #repl19j<-"</head><castItem>\\2</castItem></castList>"
  regx19i<-"((?<=<castList>)((Personen.)(.*)){1,7}(?=</castList>))"
  repl19i<-"<head>\\3</head>\\4"
  ##############################
  txtm16<-gsub(regx15a,repl15a,txtm15,perl = T)
  #  txtm16
  txtm17<-gsub(regx15b,repl15b,txtm16,perl = T)
  txtm17<-sub(repl15a,"<div",txtm17)
  txtm18<-gsub(regx15d,repl15d,txtm17,perl = T)
  txtm16a<-gsub(regx16,repl16,txtm18,perl = T)
  txtm16b<-gsub(regx17,repl17,txtm16a,perl = T)
  txtm19a<-gsub(regx19a,repl19a,txtm16b,perl = T)
  txtm19b<-gsub(regx19b,repl19b,txtm19a,perl = T)
  txtm19c<-gsub(regx19c,repl19c,txtm19b,perl = T)
  txtm19e<-gsub(regx19e,repl19e,txtm19c,perl = T)
  # txtm19e
  txtm19f<-gsub(regx19f,repl19f,txtm19e,perl = T)
  txtm19f
  txtm19g<-gsub(regx19g,repl19g,txtm19f,perl = T)
  txtm19g
  txtm19i<-gsub(regx19i,repl19i,txtm19g,perl = T)
  txtm19i
  # txtm19h<-gsub(regx19h,repl19h,txtm19i,perl = T)
  #txtm19j<-gsub(regx19j,repl19j,txtm19i,perl = T)
  #txtm19j
  #  txtm19k<-castloop(txtm19j)
  # still unconventional but convenient solution to add cast, weniger nachhaltig.
  txtm8<-removegaps(txtm19i)
  ##########################
  #paste final9
  # regx8a<-"(?<!<speaker>|</speaker>|<stage>|</stage>)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)(?!</stage>)"
  # repl8a<-"<speaker>\\1</speaker>"
  # txtm8b<-gsub(regx8a,repl8a,txtm8,perl = T)
  # txtm8b<-removegaps(txtm8b)
  txtm8c<-txtm8
  #     regx9a<-"(</speaker>)(.+?)(<speaker>)" #mark sprechakt til next speaker, including next speaker name
  #   repl9a<-"</speaker><p>\\2</p></sp><speaker>" #
  #  txtm9a<-gsub(regx9a,repl9a,txtm8c,perl = T)
  # speaker.pt<-"Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\."
  #regx13<-paste0("(?<",speaker.pt,").*?(?=",speaker.pt,"|$)")
  #regx13<-"(?<=Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.).*?(?=Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.|$)"
  regx14<-"((?<=</speaker>).*?(?=<speaker>|</div>|$))" #mark everything from speakerend to speakerbegin including divisionend 
  repl14<-"<p>\\1</p></sp><sp>"
  txtm8d<-gsub(regx14,repl14,txtm8c,perl = T)
  regx19d<-"(<p>)(<stage>.*?</stage>)"
  repl19d<-"\\2\\1"
  regx19h<-"</stage><p><sp>"
  repl19h<-"</stage><sp><p>"
  txtm19d<-gsub(regx19d,repl19d,txtm8d,perl = T)
  txtm19h<-gsub(regx19h,repl19h,txtm19d,perl = T)
  ### the following is just unconventional correction of mislead declaration, still TODO in main script
  regx19i<-"<sp></div>"
  repl19i<-"</div>"
  txtm19i<-gsub(regx19i,repl19i,txtm19h,perl = T)
  regx19j<-"<sp><p>"
  repl19j<-"<p>"
  txtm19j<-gsub(regx19j,repl19j,txtm19i,perl = T)
  ########
  ####end final9
  ##################
  
  
} ##### end final8
##################


castloop<-function(set){
  # regx19j<-"(</head>.*)(Celimene..|Erast..|Chlorinde..|Damis..|Cydalise..|Finette..){6}(.*)(</castList>)"
  repl19j<-"</head><castItem>\\2</castItem></castList>"
  regxns<-c("(Erast.)","(Celimene.)","(Chlorinde.)","(Finette.)","(Damis.)","(Cydalise.)")
  repl1a<-"\\1\\3"
  txtmcleanx<-matrix(1:10)
  txtmcleanx[1]<-set
  for (k in 1:length(regxns)){
    regx1a<-paste0(regxns[k],"(-)(.)")
    txtmcleanx[k+1]<-gsub(paste0("(</head>.*)",regxns[k],"(.*)(</castList>)"),repl19j,txtmcleanx[k])
  }
  return(txtmcleanx)
  #  regxns[1]
}

#########
final9<-function(set){
  txtm8<-set
  #stuck xml line 333
  #lisas:
  #regx20<-"(?<!<speaker>)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)"
  regx8a<-"(?<!<speaker>|</speaker>|<stage>|</stage>)(Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.)(?!</stage>)"
  repl8a<-"<speaker>\\1</speaker>"
  txtm8b<-gsub(regx8a,repl8a,txtm8,perl = T)
  txtm8b<-removegaps(txtm8b)
  txtm8c<-final8(txtm8b)
  ################## wks.
  #12242.neu from regex lisa.
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
  #12245.
  #lisa hint:
  speaker.pt<-"Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\."
  regx13<-paste0("(?<",speaker.pt,").*?(?=",speaker.pt,"|$)")
  regx13<-"(?<=Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.).*?(?=Celimene\\.|Erast\\.|Chlorinde\\.|Damis\\.|Cydalise\\.|Finette\\.|$)"
  regx14<-"((?<=</speaker>).*?(?=<speaker>|</div>|$))"
  repl14<-"<p>\\1</p></sp><sp>"
  txtm8d<-gsub(regx14,repl14,txtm8c,perl = T)
  txtm19d<-gsub(regx19d,repl19d,txtm8d,perl = T)
  txtm19h<-gsub(regx19h,repl19h,txtm19d,perl = T)
  ### the following is just unconventional correction of mislead declaration, still TODO in main script
  regx19i<-"<sp></div>"
  repl19i<-"</div>"
  txtm19i<-gsub(regx19i,repl19i,txtm19h,perl = T)
  regx19j<-"<sp><p>"
  repl19j<-"<p>"
  txtm19j<-gsub(regx19j,repl19j,txtm19i,perl = T)
  ########
}   ####end final9
##################
#library(xml2)
#library(purrr)

formatting<-function(set){
  txtm18<-set
  txtm19<-gsub("</head>",'</head>\n',txtm18)
  txtm19<-gsub("</stage>",'</stage>\n',txtm19)
  txtm19<-gsub("<sp>",'<sp>\n',txtm19)
  txtm19<-gsub("</speaker>",'</speaker>\n',txtm19)
  txtm19<-gsub("</sp>",'</sp>\n',txtm19)
  #txtm19<-gsub("<l>",'<l>\n',txtm19)
  #txtm19<-gsub("</l>",'</l>\n',txtm19)
  txtm19<-gsub("</p>",'</p>\n',txtm19)
  txtm19<-gsub("</div>",'</div>\n',txtm19)
  #txtm19<-gsub("</head>",'</head>\n',txtm19)
  txtm19<-gsub("</castList>",'</castList>\n',txtm19)
  txtm19<-gsub("</castItem>",'</castItem>\n',txtm19)
  txtm19<-gsub("</front>",'</front>\n',txtm19)
  txtm19<-gsub("<front>",'<front>\n',txtm19)
  txtm19<-gsub("<castList>",'<castList>\n',txtm19)
  txtm19<-gsub("<body>",'<body>\n',txtm19)
  #txtm19<-gsub("</div>",'</div>\n',txtm19)
  #txtm19<-gsub("</div>",'</div>\n',txtm19)
  #txtm19<-gsub("</div>",'</div>\n',txtm19)
  
  
}


#change last modification
#txfin<-final8(teiwork(txt))
####################################
txfin<-final8(teiwork(txtmraw(txt)))
##############
#set<-txtm19j
##### removes once added - (minus) to names
cleantei<-function(set){
  regxns<-c("(Erast)","(Celimene)","(Chlorinde)","(Finette)","(Damis)","(Cydalise)")
  repl1a<-"\\1\\3"
  txtmcleanx<-matrix(1:10)
  txtmcleanx[1]<-set
  for (k in 1:length(regxns)){
    regx1a<-paste0(regxns[k],"(-)(.)")
    txtmcleanx[k+1]<-gsub(paste0(regxns[k],"(-)(.)"),repl1a,txtmcleanx[k])
  }
  return(txtmcleanx)
  #  regxns[1]
}
#length(regxns
cleantx<-cleantei(txfin)
addcast<-function(set){
  regx1a<-"((?<=<castList>)(.*?)(?=</castList>))"
  repl1a<-"<head>Personen</head><castItem>Damis,</castItem><castItem>Chlorinde,</castItem><castItem>Celimene</castItem><castItem>Finette</castItem><castItem>Erast,</castItem><castItem>Cydalise.</castItem>"
  txtmod<-gsub(regx1a,repl1a,set,perl=T)
}
#######################
#  txtmcast<-addcast(txtes)
#txtm19k[7]

#txtes<-cleantx[7]

cleantx[7]
write_clip(cleantx[7])
txtcast<-addcast(cleantx[7])
txtmfin<-formatting(txtcast)
#txtmfin<-formatting(cleantx[7])
###
# decomment ff. and replace with local destination
#writeLines(txtmfin,"~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/klemm_TEI_body_process.xml")
#writes TEI to clipboard to convenient paste into <text>...</text>
write_clip(txtmfin)
##########
##########
#wks.
##########