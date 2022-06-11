src<-"https://gutenberg.org/ebooks/6698.txt.utf-8"

#get text
ext<-function(src){
  dta<-scan(src,"character",quote = c("\'","\""),na.strings = c(",",".",";","-"))
  start<-which(dta=="PRINT!")
  start2<-start[1]+20
  startbook<-which(dta[start[1]:start2]=="Wilhelm")
  start1<-startbook-1
  dta4<-dta[start[1]+start1:length(dta)]
  dta5<-dta4[!is.na(dta4)]
}

dta <- gutenberg_download(6698)
stylotext <- select(dta, text)
write.table(stylotext, file = "data/hegel.txt", sep="", row.names = FALSE)

enc2native(dta[,2])

dta<-scan(src,"character",what="character", encoding = "UTF-8", sep="\n")
library(clipr)
write_clip(dta)

stri_split_regex('Lorem ipsum dolor sit amet',
                 '\\p{Z}+') # see also stri_split_charclass
stri_split_regex(c('ab,c', 'd,ef  ,  g', ',  h', ''),
                 '\\p{WHITE_SPACE}*,\\p{WHITE_SPACE}*', omit_empty=NA, simplify=TRUE)
stri_split_regex(txtm20,"</head")

x <- "Line 1\n coninuation of line 1\r\nLine 2"
gsub("\\R", "", x, perl=TRUE)

x<-gsub("</head>",'</head>\n',txtm18)
print(gsub('\\s','\n',"trvalý pobyt na území hl. města Prahy")
)
write_clip(x)

########
dramaxml<-read_xml("../data/Drama-Test.xml")
dramaxml<-read_xml("~/boxHKW/21S/DH/gith/DH_essais/data/corpus/klemm_besuch/Klemm_TEI_empty.xml")

#xml_find_all(dramaxml,"body",ns=)
xml_ns(dramaxml)
data<-dramaxml
drama.ns<-xml_ns(data)
data %>% xml_ns()
data%>% xml_ns_strip()
drama.ns

# Find all vs find one -----------------------------------------------------
x <- read_xml("<body>
  <p>Some <b>text</b>.</p>
  <p>Some <b>other</b> <b>text</b>.</p>
  <p>No bold here!</p>
</body>")
para <- xml_find_all(data, ".//p")
para
# By default, if you apply xml_find_all to a nodeset, it finds all matches,
# de-duplicates them, and returns as a single nodeset. This means you
# never know how many results you'll get
xml_find_all(para, ".//p")

# If you set flatten to FALSE, though, xml_find_all will return a list of
# nodesets, where each nodeset contains the matches for the corresponding
# node in the original nodeset.
xml_find_all(para, ".//p", flatten = FALSE)

# xml_find_first only returns the first match per input node. If there are 0
# matches it will return a missing node
xml_find_first(data, ".//body")
klemm_xml1<-xml_set_text(xml_find_all(data, ".//insert"),txtm20)
xml_set_text(xml_find_first(data, ".//body"),"dummy")
xml_set_namespace(txtm20,prefix="",uri=drama.ns)
txtmxml<-read_xml(txtm20)
write_clip(klemm_xml1)
klemmxml2<-xml_add_child(data,txtm20,"//insert")
klemmxml2
