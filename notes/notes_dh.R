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
### DYN
ts<-read_lines("/var/folders/y3/_0j6ntls0p3b4bmwng47r4dm0000gn/T//RtmpQIrcTY/ref2e9ba3b106.bib")






### sort dataframe:
#ordering dataframe by column 1
df[with(df,order(df[,1])), ]
#ordering dataframe by column name 'a'
df[with(df,order(df[,"a"])), ]
df[order(df[[var]]),]
df[order(df[,var]),]

### split array:
x<-c(1:10)
split(x,1:2)

download.file()

library(httr)
response<-GET("https://api.zotero.org/groups/4713246/collections/9LNRRJQN/items/top?format=bibtex")
bib<-httr::content(response,"text")

#### summary MFW
library(quanteda)
#library(rematch2)
c<-corpus(dta_t$contentp)
#x<-kwic(c,"glaub.*",window=5,valuetype="regex")
#x$from
#x$pre
#summary(c)
x<-(dfm(c))
#x2<-dfm_weight(x)
#x2
x2<-featfreq(x)
char_wordstem(a)
head(x2[order(x2,decreasing = T)])
### to match x2 against stoplist (x2 is a named vector, the values are the frequencies, the vectornames are the words)
m2<-is.na(match(names(x2),stoplist_clean))
x3<-x2[m2]
t6<-head(x3[order(x3,decreasing = T)])
t6


#### plot to browser
library(httpgd)

  hgd()
  hgd_browse() # open browser
  plot(cars)
  plot(iris,5:3)
#  dev.off()
  
  top<-10000
  a<-sample(top,top)
  c<-sqrt(length(a))
  b<-matrix(a,c,c)
image(b)  

# Warning: The working directory was changed to /Users/lion/boxHKW/21S/DH/local/HU-LX/SES/conc inside a notebook chunk. The working directory will be reset when the chunk is finished running. Use the knitr root.dir option in the setup chunk to change the working directory for notebook chunks.

na.action(na.omit(c(1, NA)))

s<-c("eins","zwei",3,4,5,6,NA)
m<-grep("ei",s)
m2<-grep("s",s[m])
s[m2]
m3<-s[grep(".*",s[m2])]
m3

a<-"[ani lo sonderzeichentest <U+05D0><U+05E0><U+05D9> <U+05DC><U+05D0>a<U+00E4>o<U+00F6>u<U+00FC><U+00C4><U+00D6><U+00DC><U+00DF>]"
library(stringi)
stri_unescape_unicode(a)
library(xml2)
url_escape(a)
utf8ToInt(a)
library(rlang)
ascii <- "<U+5E78>"
chr_unserialise_unicode(a)
