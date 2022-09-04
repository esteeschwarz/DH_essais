#12323.SFB ivrit transcription
#20220808(20.02)
################
#replace content in oxygen doesnt work on all issues caused by RTL text direction
library(readtext)
library(xml2)
library(purrr)
library(stringi)
library(clipr)

#src<-"https://github.com/esteeschwarz/DH_essais/raw/main/sections/IVRIT/kitre_stage002.txt"
#src<-"https://github.com/esteeschwarz/DH_essais/raw/main/sections/IVRIT/Text2KitreOtijjot_005b.xml"
src<-"https://github.com/esteeschwarz/DH_essais/raw/main/sections/IVRIT/Text2KitreOtijjot_005d.xml"

#####
#12325.stage 005.
dta<-read_xml(src)
#lisa

# Namespace entfernen
data<-dta
data %>% xml_ns()
data%>% xml_ns_strip()

### try if loop instead...
lines_all<- data %>% 
   xml_find_all("//l") %>%
   as.list((xml_path()))
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
pb<-"----pagebreak----"
text_cpt<-c(lines_df[[1]],pb,lines_df[[3]],pb,lines_df[[2]],pb,lines_df[[5]],pb,lines_df[[4]],pb,lines_df[[7]],pb,lines_df[[6]],pb,lines_df[[9]],pb,lines_df[[8]])
#text_cpt_pdforder<-c(lines_df[[1]],lines_df[[2]],lines_df[[3]],lines_df[[4]],lines_df[[5]],lines_df[[6]],lines_df[[7]],lines_df[[8]],lines_df[[9]])
#writeLines(text_cpt,"kitre_output001.txt")
#writeLines(textm,"kitre_output001b.txt")
#writeLines(text_cpt,"kitre_R_output002a.txt")


#writeLines(text_cpt_pdforder,"kitre_R_output_pdforder_001.txt")
#writeLines(lines_all)
#write_clip(xml_text(lines_all))
########
#fetch xml via API call
# #dudenapi
# head<-read_json("~/boxHKW/UNI/21S/DH/local/DYN/dudenapi_head.json")
# 
# head$`x-api-key`
# req_body<-paste0('{"text":"',wolfbodyflat01,'","dictionary":["Wäl"]}')
# cat(req_body)
# req <- httr::POST(dudenurl,
#                   httr::add_headers(
#                     "x-api-key" = head$`x-api-key`,
#                     "Content-Type" = "application/json"
#                   ),
#                   body = req_body
# );
# 
# head$`x-api-key`
# #Extract the access token
# httr::stop_for_status(req)
# json<-httr::content(req, as="parsed")
# 
#######
#12365. new from .txt to compare escriptorium vs. transkribus OCR
#txt1<-readtext("Text2KitreOtijjot.txt")
txt1$text
library(stringi)
#txt1a<-stri_split(txt1$text,regex=" ")
#writeLines(txt1a[[1]],"kitre_list_escr.txt")
#write_clip(txt1a[[1]])
#txt2<-readtext("kitre_R_output_pdforder_001.txt")
#txt2a<-stri_split(txt2$text,regex=" ")
#writeLines(txt2a[[1]],"kitre_list_trans.txt")
writeLines(xml_text(lines_all),"kitre_R_TR_cpt.txt")
txt3<-readtext("kitre_R_TR_cpt.txt")
txt3a<-stri_split(txt3$text,regex=" ")
writeLines(txt3a[[1]],"kitre_list_trans.txt")
txt4<-readtext("export_doc2_kitre_otijjot_text_202208311831.txt")
txt4a<-stri_split(txt4$text,regex=" ")
writeLines(txt4a[[1]],"kitre_list_escr.txt")
txt5<-readtext("http://dh-index.org:8080/media/users/1/export_doc2_kitre_otijjot_text_202208311834.txt")
txt5a<-stri_split(txt5$text,regex=" ")
writeLines(txt5a[[1]],"kitre_list_escr.txt")
