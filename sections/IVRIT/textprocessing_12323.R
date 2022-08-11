#12323.SFB ivrit transcription
#20220808(20.02)
################
#replace content in oxygen doesnt work on all issues caused by RTL text direction
library(readtext)
library(xml2)
library(purrr)
#library(stringi)
#library(clipr)

#src<-"https://github.com/esteeschwarz/DH_essais/raw/main/sections/IVRIT/kitre_stage002.txt"
src<-"https://github.com/esteeschwarz/DH_essais/raw/main/sections/IVRIT/Text2KitreOtijjot_005b.xml"

#dta<-readtext(src)
# txt<-dta$text
# regx1<-"\\(.+?\\)"
# repl1<-"#BILD#"
# # no. causes disorder
# m<-gregexpr("\\(.+?\\)",txt)
# regmatches(txt,m)
# txtm1<-gsub(regx1,repl1,txt)
# txtm1

# cl<-read_clip() #oxygen clipboard copy of text
# cl
# regx1<-"(...31..............)"
# #m<-gregexpr(regx1,cl)
# m<-gregexpr(regx1,txt)
# 
# #cl[28]
# regmatches(txt,m)
# repl1<-"#repl1#"
# txtm2<-gsub(regx1,repl1,cl)
# txtm2
# writeLines(txtm2,"kitre_stage003.txt")
#####
#12325.stage 005.
dta<-read_xml(src)
#lisa

# Namespace entfernen
data<-dta
data %>% xml_ns()
data%>% xml_ns_strip()
# 
# # Beispiel 1: xpath-Pfade anzeigen
# # Alle xpath-Pfade anzeigen
# data %>% 
#   xml_find_all('//*') %>%
#   xml_path()
# ?xml_path
# 
# # Alle xpath-Pfade zu einem head-Element anzeigen
# all_starts <- data %>% 
#   xml_find_all('//_startmain', flatten=F) %>%
#   xml_path()
# all_starts
# all_heads[2]
# all_ends <- data %>% 
#   xml_find_all('//_endmain') %>%
#   xml_path()
# all_ends
# extract_main<-function(set){
#   
# }
# regx1<-"((?<=l\\[).*?(?=\\]))"
# regx2<-"(.*l\\[.+\\]).*"
# regx3<-"((?<=l\\[).*?(?=\\]))"
# regx4<-"(.*l)"
# repl2<-"\\1"
# # for(k in length(lines)){
# #   replx<-lines[k]
# #   gsub(regx1,replx,all_starts,perl = T)
# # }
# lines_a<-stri_extract_all_regex(all_starts,regx1)
# lines_b<-stri_extract_all_regex(all_ends,regx1)
# # lines_c<-stri_extract_all_regex(,regx1)
# lines_base<-stri_extract_all_regex(all_starts,regx4)
#  lines_base
#  
#  get_lines<-function(lines_count){
#    lines_df<-data.frame()
#    for(k in length(lines_count)){
#      num_line<-lines_count[k]
#    for(i in 1:num_line){
#   lines_df[[k]]<- paste0(lines_base,"[",i,"]")
# 
#    }
#    }
#  }
#  get_lines(lines_count)
#  # gsub(regx1,z,all_starts,perl = T,vectorize_all=T)
# length(lines_count)
# repl_funct<-function(line_ch,f){
#   x<-as.double(line_ch)
#   y<-x+f
# }
# za<-repl_funct(lines_a,1)
# zb<-repl_funct(lines_b,0)
# lines_count<-zb-za
# 
# #as.double(lines)  
# lines_za<-stri_replace_all_regex(all_starts,regx1,za,vectorize_all = T)
# lines_zb<-stri_replace_all_regex(all_starts,regx1,zb,vectorize_all = T)
# 
# line_xtoy<-
# #repl1<-"dummy"
# #gregexpr(regx1,all_starts,perl = T)
# 
# lines_z1<-gsub(regx2,repl2,lines_za,perl = T)
# 
# #all_starts
# 
# # # Beispiel 2: Alle Kapitelüberschriften extrahieren
# # # So geht es nicht
# xml_text(lines_z1[2])
# # # So geht es
#  all_chapters <- data %>% 
#    xml_find_all(lines_z1) %>%
#    xml_text()
#  all_chapters
# # xml_text(xml_children(xml_children(xml_children(xml_children(xml_children(dta))))))
# # all_chapters <- data %>% 
# #   #xml_find_all('/*/*[7]/*/*[lg]/*/*[2]') %>%
# #   #xml_find_all('/TEI/text/body/p/lg/l[5]') %>%
# #   xml_find_all('.//l') %>%
# #   
# #   xml_text()
# # all_chapters
# # ####
# # x <- read_xml("<body>
# #   <p>Some <b>text</b>.</p>
# #   <p>Some <b>other</b> <b>text</b>.</p>
# #   <p>No bold here!</p>
# # </body>")
# # para <- xml_find_all(x, ".//p")
# # para <- xml_find_all(data, ".//p")
# # 
# # xml_path(para)
# # xml_find_all(para, ".//b", flatten = FALSE)
 
### try if loop instead...
lines_all<- data %>% 
   xml_find_all("//l") %>%
   as.list((xml_path()))
#lines_s<-lines_all%>%
#  xml_find_first("//l")%>%
#  xml_path()
#as.da 
# lines_all
 #lines_extr<-data.frame()
regx_st<-"_startmain"
regx_end<-"_endmain"

za<-grep(regx_st,lines_all)+1
zb<-grep(regx_end,lines_all)-1
#lines_all[za[3]:zb[3]]
x<-length(za)
#lines_df<-data.frame()
lines_df<-list()
for(k in x:1){
  lines_df[[k]]<-xml_text(lines_all[za[k]:zb[k]])
}
#wks.
# lines_df[[1]]<-xml_text(lines_all[za[1]:zb[1]])
# for (k in 10:1){
#   print(k)
# }
# lines_all[za[1]:zb[1]]
# xml_text(lines_all[za[1]:zb[1]])
#cat(as.character(lines_df[9:8]))
#writeLines(as.character(lines_df[9:1]),"kitre_output001.txt")
#lines_df[[9]]
text_cpt<-c(lines_df[[9]],lines_df[[8]],lines_df[[7]],lines_df[[6]],lines_df[[5]],lines_df[[4]],lines_df[[3]],lines_df[[2]],lines_df[[1]])
writeLines(text_cpt,"kitre_output001.txt")
