#12323.SFB ivrit transcription
#20220808(20.02)
################
#replace content in oxygen doesnt work on all issues caused by RTL text direction
library(readtext)
src<-"https://github.com/esteeschwarz/DH_essais/raw/main/sections/IVRIT/kitre_stage002.txt"
dta<-readtext(src)
txt<-dta$text
regx1<-"\\(.+?\\)"
repl1<-"#BILD#"
# no. causes disorder
m<-gregexpr("\\(.+?\\)",txt)
regmatches(txt,m)
txtm1<-gsub(regx1,repl1,txt)
txtm1
library(clipr)

cl<-read_clip() #oxygen clipboard copy of text
cl
regx1<-"(...31..............)"
#m<-gregexpr(regx1,cl)
m<-gregexpr(regx1,txt)

#cl[28]
regmatches(txt,m)
repl1<-"#repl1#"
txtm2<-gsub(regx1,repl1,cl)
txtm2
writeLines(txtm2,"kitre_stage003.txt")
#####
#12325.stage 005.
src<-"https://github.com/esteeschwarz/DH_essais/raw/main/sections/IVRIT/Text2KitreOtijjot_005b.xml"
library(xml2)
library(purrr)
library(stringi)
dta<-read_xml(src)
#lisa

# Namespace entfernen
data<-dta
data %>% xml_ns()
data%>% xml_ns_strip()

# Beispiel 1: xpath-Pfade anzeigen
# Alle xpath-Pfade anzeigen
data %>% 
  xml_find_all('//*') %>%
  xml_path()
?xml_path

# Alle xpath-Pfade zu einem head-Element anzeigen
all_starts <- data %>% 
  xml_find_all('//_startmain', flatten=F) %>%
  xml_path()
all_starts
all_heads[2]
all_ends <- data %>% 
  xml_find_all('//_endmain') %>%
  xml_path()
all_ends
extract_main<-function(set){
  
}
regx1<-"((?<=l)\\[.*?(?=\\]))"
repl_compl<-
stri_replace_all_regex(all_starts,regx1,)
repl1<-"dummy"
gregexpr(regx1,all_starts,perl = T)
gsub(regx1,repl1,all_starts)
all_starts

# # Beispiel 2: Alle Kapitelüberschriften extrahieren
# # So geht es nicht
# xml_text(all_heads[2])
# # So geht es
# all_chapters <- data %>% 
#   xml_find_all('//text/body/p[2]/lg/l') %>%
#   xml_text()
# all_chapters
# xml_text(xml_children(xml_children(xml_children(xml_children(xml_children(dta))))))
# all_chapters <- data %>% 
#   #xml_find_all('/*/*[7]/*/*[lg]/*/*[2]') %>%
#   #xml_find_all('/TEI/text/body/p/lg/l[5]') %>%
#   xml_find_all('.//l') %>%
#   
#   xml_text()
# all_chapters
# ####
# x <- read_xml("<body>
#   <p>Some <b>text</b>.</p>
#   <p>Some <b>other</b> <b>text</b>.</p>
#   <p>No bold here!</p>
# </body>")
# para <- xml_find_all(x, ".//p")
# para <- xml_find_all(data, ".//p")
# 
# xml_path(para)
# xml_find_all(para, ".//b", flatten = FALSE)
