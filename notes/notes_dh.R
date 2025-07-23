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

enc2native(dta[,2])l.df<-length(com.df$url)
chunks<-ceiling(l.df/1000)
# Create the vector
vector <- 1:l.df

# Define the chunk size
chunk_size <- 500  # Example chunk size

# Function to split the vector into chunks of equal length
split_into_chunks <- function(vec, chunk_size) {
  split(vec, ceiling(seq_along(vec) / chunk_size))
}

# Split the vector into chunks
chunks <- split_into_chunks(vector, chunk_size)


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
data <- read_xml("<body>
  <p>Some <b>boldtext</b>.</p>
<div>  <p>Some <b>text</b>.</p>
  <p>Some <b>other</b> <b>text</b>.</p></div>
  <p>No bold here!</p>
</body>")
div <- xml_find_all(data, ".//div")#%>%xml_find_all(".//b")
xml_text(div)
b <- xml_find_all(div, ".//b")
xml_text(b)
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
library(graphics)
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

x<-gl(d3$QU01,1)
x <- gl(5, 2, 10)
levels(x)[1] <- "low"
levels(x)[2] <- "high"
x
plot(x)
## First control, then treatment:
gl(2, 8, labels = c("Control", "Treat"))
## 20 alternating 1s and 2s
gl(2, 1, 20)
## alternating pairs of 1s and 2s
gl(2, 2, 20)
##################################
attr(d$MT01)
plot(d$QU19)
d$QU19

eval(2 ^ 2 ^ 3)
p<-"snc,r"
mEx <- expression(2^2^3); mEx; 1 + eval(mEx)
eval({ xx <- pi; xx^2});xx
m <- expression(x<-gsub(",",'",',p))
eval(m)
e1<-parent.frame()

evalq(d$QU01,e1)
s<-d$QU01
levels(s)<-c(1,1,1,1,1)
s
levels(s)<-c(1,2,3,4,5)
plot(subq$QU01)
max(levels(s))
max(s)
subq<-d3[,m1]
factor(subq)
order(levels(subq$QU04))
levels(subq)
sum(subq$QU01==levels(subq$QU01)[4])
sum(grepl(levels(subq$QU01)[2],subq$QU01))
listeval<-data.frame(m1=pid)
colnames(listeval)<-colnames(d3)[m1]
#rating
for (k in 1:length(m1)){
listeval[k,"inconcrete"]<-sum(grepl(levels(subq$QU01)[1],subq[,k]))
listeval[k,"name"]<-sum(grepl(levels(subq$QU01)[2],subq[,k]))
listeval[k,"request"]<-sum(grepl(levels(subq$QU01)[3],subq[,k]))
listeval[k,"unclear"]<-sum(grepl(levels(subq$QU01)[4],subq[,k]))
listeval[k,"NA"]<-sum(grepl(levels(subq$QU01)[5],subq[,k]))

}
rownames(listeval)<-listeval$m1
listeval$m1[which.max(listeval$name)]
t6<-head(listeval[order(listeval$name,decreasing = T)])
t6
df<-listeval
### sort dataframe:
#ordering dataframe by column 1
df[with(df,order(df[,3],decreasing = T)), ]
#ordering dataframe by column name 'a'
df[with(df,order(df[,"a"])), ]
df[order(df[[var]]),]
df[order(df[,var]),]

#remove undefsalz for messy data
dfc<-listeval
dfc<-subset(dfc,dfc$m1!="undefsalz")
#dfc<-dfc[with(dfc,order(dfc[,1],decreasing = F)), ]
#dfc<-dfc[1:38,]
dfc.name<-dfc[with(dfc,order(dfc[,3],decreasing = T)), ]
dfc.req<-dfc[with(dfc,order(dfc[,4],decreasing = T)), ]
dfc.inconc<-dfc[with(dfc,order(dfc[,2],decreasing = T)), ]
dfc.unclear<-dfc[with(dfc,order(dfc[,5],decreasing = T)), ]
plot(dfc.name[2,2:5])

library(stringi)
library(R.utils)
df2<-dfc
df2$png<-stri_extract_all_regex(df2$m1,"index|undef|request",simplify = T)
regxword<-paste0("(",paste(decapitalize(words),collapse = "|"),"|####)")
df2$word<-stri_extract_all_regex(df2$m1,regxword,simplify = T)
lm(df2$name~df2$request)
lm(df2$request~df2$png)
lm(df2$unclear~df2$png)
u<-runif(20)
df2$index<-df2$png=="index"
df2$req<-df2$png=="request"
df2$undef<-df2$png=="undef"
df3<-df2
df3$response<-1
lo<-length(df2$name)
lo1<-lo+1
lo2<-lo*2+1

df3[lo1:lo4,13]<-1
#df3$response<-append(df3$response,39:114,length(df3$response))
#df3$response[1:38*3]<-0
df3$response[1:lo]<-df2$name
df3$response[lo1:lo2]<-df2$request
lo3<-lo*3+1
lo4<-lo*4
77:114
df3$response[lo2:lo3]<-df2$undef
df3$response[lo3:lo4]<-df2$unclear
df3[lo1:lo4,14]<-1

df3$resp_cat[1:lo]<-"name"
df3$resp_cat[lo1:lo2]<-"request"
df3$resp_cat[lo2:lo3]<-"undef"
df3$resp_cat[lo3:lo4]<-"unclear"

df3$resp_word[1:lo]<-df2$word
df3$resp_word[lo1:lo2]<-df2$word
df3$resp_word[lo2:lo3]<-df2$word
df3$resp_word[lo3:lo4]<-df2$word

df3$resp_png[1:lo]<-df2$png
df3$resp_png[lo1:lo2]<-df2$png
df3$resp_png[lo2:lo3]<-df2$png
df3$resp_png[lo3:lo4]<-df2$png

df3$resp_word[which.max(df3$response)]



lm(response_value~word,df4)
library(lme4)
lm1<-lmer(response_value~word+(png|word),df4)
summary(lm1)
df4<-data.frame(response_value=df3$response,response_lang=df3$resp_cat,png=df3$resp_png,word=df3$resp_word)

df4$index<-0
df5<-df4
t<-df4$response_lang=="request"
df4$index<-df4$response_lang=="name"
df4$request<-df4$response_lang=="request"
df4$undef<-df4$response_lang=="un"
df5$response_lang[t]<-"index"
df5$true<-df5$png==df5$response_lang

#truth values: how often ideal answer?
#ideal 13x3 = 39 kombinations = 13 each

#lmer
plot(df4$response_value, pch=19)
abline(a=10, b=2, col="grey")
regxy = lm(y~x)
abline(regxy)
text(6.6, 18, expression(hat(E)(y) == hat(beta)[0] + hat(beta)[1]*x), pos=4)
arrows(7.4, 18.8, 7.4, coef(regxy)%*%c(1,7.4), length=.15)
segments(x, y, x, fitted(regxy), lty=3)

##################
#x = runif(30,0,10)
#x[28] = 8.5
#y = m + 2*x + rnorm(o)*3 #10+
m<-39 #ideal (correct) answer / picture
#m<-max(df4$response_value)
o<-length(df5$response_value) # anzahl answers
#y<-1:m
#m<-o
x = runif(o,0,m) # ideal random distribution over observation
y = df5$response_value # real distribution
#
# pch = 1 open circle, 2 triangle, 3 plus, 4 x, 5 diamond, 6 inverted triangle; 19 solid circle
#
# curve(rnorm(x))
# plot(x, y, pch=19)
# abline(a=m, b=2) #a=10
# text(5.8, 18, expression(E(y) == beta[0] + beta[1]*x), pos=4)
# arrows(6, 18.8, 5.9, 21.8, length=.15)
# segments(x, y, x, 10+2*x, lty=3)
# dev.off()
#
# Figure 1.2
#
#abline(regxy)
#a<-mean(df5$response_value)
plot(x, y, pch=18,main="chosen label vs. ideal selection",xlab="ideal-fitted",ylab="selection")
abline(a=13, b=0,col="grey")
regxy = lm(y~x)
summary(lm(y~x))
abline(regxy)
text(25, 30, "Ideal", pos=4)
arrows(28, 28, 28, 13, length=.15)
text(5, 20, "Abweichung", pos=4,col=2)
arrows(7.4, 18.8, 7.4, coef(regxy)%*%c(1,7.4), length=.15,col=2)
segments(x, y, x, fitted(regxy), lty=3)
dev.off()

lm1<-lmer(response_value~true+(word|png),df5)
summary(lm1)
plot(lm1)
plot(regxy)
regxy$effects

#############
codef<-function(x) stri_extract_all_regex(x,"(#[A-Z]{3})")
#ms7<-lapply(ms6, codef)
ms7<-lapply(sent1, codef)
# unlist(head(ms7[ms5][]))
#ms7<-lapply(sent1, codef)
ms8<-unique(unlist(ms7)) #unique coded features
ms8<-ms8[!is.na(ms8)]
##############13143.
library(koRpus)
getwd()
dirtext
dirout
cha<-list.files(dirout)
x<-treetag(paste(dirout,cha[1],sep = "/"),treetagger = "manual",lang="de",
           TT.options = list(path=file.path("~/pro/treetagger"),preset="de"),format = "file")

xf<-tempfile(fileext = ".txt")
treetag(paste(dirout,cha[1],sep = "/"),treetagger = "manual",lang="de",
           TT.options = list(path=file.path("~/pro/treetagger"),preset="de"),format = "file")
install.koRpus.lang("de")
library(koRpus.lang.de)
y<-taggedText(x)
summary(x)
plot(x)
codesdir
codeusedir
tagdir<-"local/HU-LX/pepper"
writexl::write_xlsx(y2,paste(tagdir,"xl/GCAtokens.xlsx",sep="/"))
write_delim(y2,paste(codeusedir,"GCAtokens.tt",sep = "/"),delim = "\t",)
y2<-y[,2:4]
colnames(y2)<-c("tok","tag","lem")
y2$lemma<-gsub("<unknown>","N.A.",y2$lemma)

x<-c(4,5,3,7,7,6,8,7,6,5)
### TRANSPOSE matrix table
t() #base!

a<-1:10
b<-1:13
c<-1:15
d<-data.frame(a,b,c,check.rows = F)

boxplot(a,b,c)
### CUT, intervals
aaa <- c(1,2,3,4,5,2,3,4,5,6,7)
cut(aaa, 3)

### playground ###
x<-array()
y<-array()
z<-array()
z1<-array()
z2<-array()

for (t in 1:100){
for (k in 1:t){
n <- k
x[k]<-n/sum(1:n)*n
y[k]<-2-x[k]
z[k]<-x[k]*y[k]
x1<-sum(z)
z1<-z*x1
}
x
#plot(x)
#plot(y)
#plot(z)
#z
#x1<-sum(z)
#plot(z1)
z2[k]<-sum(z1)
#x2<-z2*z
#z2[k]<-z1
}
plot(z2)
z2
###########
getwd()
tempsrc<-"hux_ha_main.Rmd"
knitdir<-"pdf"
outdir<-"hux_ha_pdf"
outfilepdf<-"hux_ha_main.pdf"
rmarkdown::render(tempsrc,output_dir = knitdir,output_file = outfilepdf,output_format = "bookdown::pdf_document2")

#minirig pdflatex issue:
writeLines(c(
  '\\documentclass{article}',
  '\\begin{document}', 'Hello world!', '\\end{document}'
), 'test.tex')
library(tinytex)
tinytex::pdflatex('test.tex')
tinytex::install_tinytex()

format(Sys.time(),'Ymd(H.m)')
format(Sys.time(), "%Y%m%d(%H.%m)")
sum4<-createview()
parsethrough()
chose<-sel1
lmeforms<-create_lmeforms(dta,"rtc")
sum1<-lmer(lmeforms$gr,dset)
summary(sum1)
sum1<-lmer(lmeforms$old[[1]],dset)
summary(sum1)
sum1
library(utils)
download.file('https://github.com/esteeschwarz/DH_essais/raw/main/sections/hux2021/hux_HA/hux_ha_main.Rmd','huxdown.Rmd')


#STEP ARRAY (GPT)
seq(from = 1, to = 100, by = 2)[1]
seq(from = 1, to = 100, by = 2)
seq(1,27,3)
library(utils)
URLencode("https://sample url",reserved = T)
URLencode("a url with spaces and / and @")

#lookaround
regx19i<-"((?<=<castList>)((Personen.)(.*)){1,7}(?=</castList>))"
repl19i<-"<head>\\3</head>\\4"

### ASKGPT:
source("~/boxHKW/21S/DH/local/R/askchatgpt.R")
prompt<-'where and how do i configure the corpus metadata for an annis corpus. name the files to manipulate and give an example of a sample configuration'
prompt<-'write an R code snippet example that inserts a html document of 3 nodes into a <sample> node in an xml document.'
prompt<-'write an R code snippet using the xml2-package that replaces a complete node of an xml document with a html document of 3 nodes. do not use xmlTree(). do not use replace_node()'
prompt<-'what are the API endpoints for the SketchEngine TenTen corpus family to use in the corpname=xxx field?'
prompt<-'provide a complete query for the SketchEngine endpoint </view?> that queries a corpus (bnc2) for the word <jobs>. the request should not query for the lemma of <jobs>, but for the exact token and the proposal should provide precise information on the API endpoint and not only on the CQL syntax. the query is performed via API and not in the SketchEngine GUI.'
prompt<-'propose a technical method (python, R) to distinguish between abstract and concrete meaning of words'
q<- paste0('{"model": "text-davinci-003", "prompt": "',prompt,'", "temperature": 0, "max_tokens": 1200}')
askgpt(q)

# Create a sample XML document
doc <- xml_new_root("sample")

# Insert a HTML document of 3 nodes into the <sample> node
xmlInternalTreeParse(doc, "<html><body><p>This is a sample HTML document.</p><p>It has two nodes.</p><p>The end.</p></body></html>", asText = TRUE)
top <-doc
textNodes <- xmlSApply(top, inherits, "sample")
sapply(xml_children(top)["sample"], xmlv)
doc
top
xmlValue(xml_child(xml_child(xml_child(tei.dracor, 1), 2), 1))
) = tei.33373.person
xmlValue(xml_find_all(tei.dracor, "//partDesc")) = tei.33373.person
node <- xmlNode("foo", "Some text")
xmlValue(xml_find_all(tei.dracor,"//partDesc"))

xmlValue(xmlTextNode("some more raw text"))
node
xmlNode(xml_find_all(tei.dracor,"//"))
xml_add_child(xml_child(xml_child(xml_child(tei.dracor, 1), 2), 1),.value =    list(tei.33373.person))
  tei.dracor[[1]][[2]]


xml_child(xml_child(xml_child(tei.dracor, 1), 2), 1))
xmlTree(tei.33373.person)

# Create a sample XML document
doc <- xmlTree("<root><node1>Node 1</node1><node2>Node 2</node2></root>")

# Create a sample HTML document
html_doc <- xmlTree("<html><head><title>My HTML Document</title></head><body><p>This is a sample HTML document.</p></body></html>")

# Replace the node2 element with the HTML document
doc[["node2"]] <- xmlTree(tei.33373.person)

# Print the modified XML document
print(doc)[1]
####
# Read in the XML document
doc <- read_xml("my_document.xml")
doc<-tei.dracor
# Create a new HTML document
html_doc <- read_html("my_html_document.html")
html_doc<-tei.33373.person
# Replace the node in the XML document with the HTML document
replaceNodes(xml_child(xml_child(xml_child(tei.dracor, 1), 2), 1),tob)
(xml_child(xml_child(xml_child(tei.dracor, 1), 2), 1),list(html_doc))
list(html_doc)[[1]][1][1]

  # removing nodes

  doc = xmlParse("<top><a/><b/><c><d/><e>bob</e></c></top>")
top = xmlRoot(doc)
top
tob<-xmlParse("<sample>textsame</sample>")
top<-tei.dracor
replaceNodes(top[["//partDesc"]], tob)
addChildren(tei.dracor[[1]][[2]][[1]])
# a and c have disappeared.
top
####
library(xml2)

# Read in the XML document
#doc <- read_xml("my_xml_document.xml")
doc<-tei.dracor
# Create a new HTML document
#html_doc <- read_html("my_html_document.html")
html_doc <- tei.33373.person
# Find the node to be replaced
node <- xml_find_all(doc, "//teiHeader/profileDesc/particDesc")
#node <- xml_find_all(doc, "//teiHeader/*")
node<-xml_child(xml_child(xml_child(doc, 1), 2), 1)
# Replace the node with the HTML document
doc2<-xml_replace(doc, node, html_doc)
  node
filename<-"~/Documents/GitHub/ETCRA5_dd23/R/data/sample2.xml"
  xmlfile = xmlTreeParse(filename, useInternalNodes = TRUE)
  xmltop = xmlRoot(xmlfile)
  #xmltop =  xml_new_root (xmlfile)
  newNode = newXMLNode(name = "newlyCreatedNode")
  xml.b<-addChildren(xmltop[[1]][[3]][[1]], kids = list(newNode))
getwd()
  write_xml(xml.b,"~/Documents/GitHub/ETCRA5_dd23/R/data/sample2m.xml")


  xmlToS4()
  txt = paste0("<doc><part><name>ABC</name><type>XYZ</type>',
              <cost>3.54</cost><status>available</status></part></doc>")
  doc = xmlParse(txt)

  setClass("part", representation(name = "character",
                                  type = "character",
                                  cost = "numeric",
                                  status= "character"))
x1<-  xmlToS4(xmlRoot(doc)[["part"]])
doc<-xmlParseDoc(src.tei)
x1<-xmlToList(doc)
x1<-xmlRoot(doc)
x2<-xmlToList(x1)
x3<-xmlToDataFrame(x1)
write_csv(x2,"teix2.csv")
x3<-as.data.frame(x2)

source<-"https://stackoverflow.com/questions/48120782/r-write-list-to-csv-line-by-line"
# crush to flat matrix
my_mat <- do.call(rbind, x2) #x2=my_list
# add in list names as new column
my_df <- data.frame(id = names(x2), my_mat)
my_df$fileDesc$teiHeader$titleStmt$title$text

frame_src<-("https://raw.githubusercontent.com/esteeschwarz/hux2021/main/framesample.html")
frame_src<-"~/Documents/GitHub/hux2021/framesample.html"
frame_src<-"framesample.html"
file.info(frame_src)
library(readtext)
library(xml2)
library(httr)

#frame_src<-"https://ada-sub.dh-index.org/es/callr.html"
re<-GET(frame_src)
t<-httr::content(re,"text")
b<-readtext(frame_src,text_field = "t")
b$text

renderDocument(htmlTemplate(text_ = read_html(frame_src),document_ = F))
renderDocument(htmlTemplate(filename  = frame_src,document_ = F))
renderDocument(htmlTemplate(text_ = t,document_ = "auto"))
renderDocument(read_html(frame_src))
readChar(frame_src)


zzfil <- tempfile("testchar")
zz <- file(zzfil, "wb")
x <- readLines(frame_src)
nc <- stri_count_boundaries(x,"char")
nc<-sum(nc)
writeChar(x, zz, nc, eos = NULL)
#writeChar(x, zz, eos = "\r\n")
#close(zz)
renderDocument(htmlTemplate(text_ = read_lines(filezzfil),document_ = F))
zzfil
###
cat(mark(c("Hello _World_!", "", "Welcome to **markdown**.")))
###
library(httr)
x<-GET("https://dracor.org/api/corpora/ger/play/lessing-emilia-galotti/spoken-text")
re<-content(x,"text")
src<-"https://echtzeit.rotefadenbuecher.de/entertxt.html"
x<-GET(src)
re<-content(x,"text")
dta_t<-plot.stats(src,"ttr",50)
library(xml2)
srchtml<-read_html(src)
txthtml<-xml_text(srchtml)

### shiny themes
install.packages("bslib")
bslib::bs_theme_preview()
install.packages("DT")

an <- c('x','y')
names(an) <- an
library(abind)
abind(lapply(an, get), along=3)

library(dplyr)
library(ggplot2)
library(lubridate)
library(timetk)
library(rlang)
cdf.2<-c.df.n
#cdf.2$timestamp<-(gsub("(........)..","\\1",cdf.2$timestamp))
cdf.2$timestamp<-(gsub("(....)(..)(..)..","\\1-\\2-\\3 00:00:00",cdf.2$timestamp))
#format(cdf.2$timestamp[2],"%Y %M %D")
cdf.2 %>%
  plot_time_series(timestamp, as.double(views),
                   .interactive = F,
                   .plotly_slider = TRUE)
cdf.2$timestamp<-as_datetime(cdf.2$timestamp)
cdf.2 %>%
  group_by(article) %>%
  plot_time_series(timestamp, views,
                   .facet_ncol = 2, .facet_scales = "free",
                   .interactive = F)
x <- matrix(runif(100), ncol = 5)
group <- sample(1:8, 20, TRUE)
(xsum <- rowsum(x, group))
## Slower versions
tapply(x, list(group[row(x)], col(x)), sum)
t(sapply(split(as.data.frame(x), group), colSums))
x <- matrix(runif(100), ncol = 5)
group <- sample(1:8, 20, TRUE)
group
(xsum <- rowsum(x, group))
## Slower versions
tapply(x, list(group[row(x)], col(x)), sum)
t(sapply(split(as.data.frame(x), group), colSums))
aggregate(x, list(group), sum)[-1]

library(lme4)
library(lmerTest)
library(nlme)
fm1 <- lme(distance ~ Sex * age, Orthodont, random = ~ age, method = "ML")
logLik(fm1)
logLik(fm1, REML = TRUE)

#matrix transpose:
t()

length(ex1 <- expression(1 + 0:9)) # 1
ex1
eval(ex1)
ex1<-
t1<-1:10
t2<-11:20
t3<-21:30


ex1<-expression(t1,t2,t3)
trun<-function(ex){
  print(data.frame(e=eval(ex[1])))
}
eval(ex1[1])
trun(ex1)

# Define the maximum value for the outer loop
max_outer <- 10

# Nested for loop
for (i in 1:max_outer) {
  for (j in 1:i) {
    # Calculate the number to print
    num_to_print <- (i - 1) * max_outer + j
    cat(num_to_print, " ")
  }
  cat("\n")  # Move to the next line after each iteration of the outer loop
}

a<-c(letters[1:10])
b<-c(a,letters[5:15])
b[10:13]<-"o"
b
unique(b)
b[7]<-"k"
b
### says unique() creates unique array in order of appearance! not alphabetically. i always thought this is naturally so but
### but experienced issues with reduced array someplace, where the order of the unique array didnt correspond the order of appearance...

a<-sample(LETTERS[1:6],1000,replace = T)
b<-sample(0:1,1000,replace = T)
df<-data.frame(cat=a,hyp=b)
df$hyp[df$cat=="A"|df$hyp=="F"]<-1
df$hyp[df$cat=="B"|df$cat=="C"|df$hyp=="D"|df$hyp=="E"]<-0
df$cat[1]<-"0I"
df$hyp[1]<-0
l1<-lm(hyp~cat,df[1:100,])
summary(l1)
plot(l1)
predict(l1,newdata = df[101:1000,])
df[101:120,]
sum(df$cat=="E")
sum(df$cat=="B")
sum(df$cat=="A")
sum(df$cat=="C")
sum(df$cat=="E")
sum(df$cat=="F")
sum(df$cat=="E")*6
1000/6

#20240106(17.33)
#14021.batch.rename
###################
f<-list.files("TRN-csv")
fr<-gsub(".trn",".csv",f)
file.rename(f,fr)

sm.make<-sample(trndf.lm$lfd[trndf.lm$alt=="make"],5)
sm.build<-sample(trndf.lm$lfd[trndf.lm$alt=="build"],5)
sm<-c(sm.make,sm.build,sample(1:length(trndf.lm$scb),10))
trndf.lm[sm,]


#14027.
library("quanteda")
library(quanteda.textstats)
set.seed(20)
dfmat1 <- dfm(tokens(c("a a b b c d", "a d d d", "a a a")))

textstat_frequency(dfmat1)
textstat_frequency(dfmat1, groups = c("one", "two", "one"), ties_method = "first")
textstat_frequency(dfmat1, groups = c("one", "two", "one"), ties_method = "average")

con<-file(description="filesm.txt","r")
t<-readLines(con = con)
print(t)

install.packages("tinytex")
install.packages("remotes")
remotes::install_github("rstudio/bookdown")
remotes::install_github("ismayc/thesisdown")
install.packages("devtools")
#install.packages("huwiwidown")
devtools::install_github("phister/huwiwidown")
library(huwiwidown)
install.packages("knit2wp")
devtools::install_github(c("duncantl/XMLRPC", "duncantl/RWordPress"))
library(RWordPress)
?RWordPress
library(knitr)
?knit2wp
barplot(plotlist$nouns.f.cp,main="semantic alternates w/ equivalent meaning",ylab = "% in corpus")
knitr::opts_knit$set(out.format = "markdown")
knitr::opts_knit$set(knit_params(rmd))
render(rmd)
library(rmarkdown)
rmdy<-yaml_front_matter(rmd)
rmdy
knit
opts_knit$set(yam)
opts_knit$get()
knit("README.Rmd")
wrap_rmd("_READMEw.Rmd",80)
update.packages("curl")
library(curl)
installed.packages()
remove.packages("curl")
install.packages("curl")
library(devtools)
update_packages("knitXwp")
4#library(knit)
check(".")

library(httr)
r<-GET("https://example.com/xmlrpc.php")
t<-content(r,"text")
t
a<-"https://yourwordpress.blog/xmlrpc.php"
r<-GET(a)

library(knitr)
knit2wp

library(rmarkdown)

library(graphics)


top<-10000
a<-sample(top,top)
c<-sqrt(length(a))
b<-matrix(a,c,c)
image(b)

mdx<-readLines("wp001.md")
library(quanteda.textplots)
library(quanteda.textstats)
library(quanteda)
mdfm<-dfm(tokens(mdx))
mdkey<-textstat_keyness(mdfm)
md.p<-textstat_lexdiv(mdfm)
md.p<-textstat_entropy(mdfm)
md.p$p<-1
mdp.df<-cbind(entropy=md.p$entropy,p=md.p$p/md.p$entropy)
plot(md.p$entropy,type = "l")
textplot_keyness(mdkey)
textplot_wordcloud(mdfm)

plot(1:10, 1:10, main = "text(...) examples\n~~~~~~~~~~~~~~",
     sub = "R is GNU ©, but not ® ...")
text(6, 10, "the text is CENTERED around (x,y) = (6,2) by default",
     cex = .8)
clipX()
testclipx<-c("clipX","is","a","function","to","process","clipboard","content.","it","depends","on","the","clipr","library.")
c("thing","thing1","bag","lot","chairs","mother","service","period","a-other","sum.obs","dif","sum")



install.packages("markdown",repos = "https://cloud.r-project.org")
library()
pkg<-installed.packages()
write.csv(pkg,"pkg.csv")
c<-read.csv("rdependencies.csv")
Sys.getenv("R_LIBS_USER")
file extension
library(tools)
file_ext(f)

####> DUMP object:

xt6$statistic
dump("xt6",file=dtemp)
readLines(dtemp)%>%write_clip()
write_clip(writeLines(xt6))

##>wks
##>wks
##>wks
##>
##>
##>
##>


plot(-1:1, -1:1, type = "n", xlab = "Re", ylab = "Im")
K <- 16; text(exp(1i * 2 * pi * (1:K) / K), col = 2)
K
k<-text(1,0.5, 
     "Le français, c'est façile: Règles, Liberté, Egalité, Fraternité...")
k


# Load necessary libraries
library(reshape2)
dat<-expression(sample(1:20,10))
test1<-data.frame(value=eval(dat),Label=letters[1:5])
test2<-data.frame(value=eval(dat),Label=letters[6:10])
df<-rbind(test1,test2)
df
# Read your data (replace 'TestData.csv' with your actual file)
#df <- read.csv("TestData.csv", header = TRUE)

# Melt the data by "Label"
df.m <- melt(df, id.var = "Label")
df.m
df.m2 <- melt(df, id.var = "Label")
df.m2
# Create a blank plot
boxplot(df.m$value ~ df.m$variable, col = "white", names = c("F1", "F2", "F3","F4","F5"))
boxplot(df.m$value ~ df.m$variable, col = "transparent",plot=T)
par(new=F)
# Add the two traces (Good and Bad) with different colors
boxplot(df.m2$value[df.m2$Label%in%c("a")] ~ df.m2$Label[df.m2$Label%in%c("a")],add = T, col = "blue",at=1)
boxplot(df.m2$value[df.m2$Label%in%c("c")] ~ df.m2$Label[df.m2$Label%in%c("c")],add = T, col = "green",at=1)
boxplot(cbind(test1$value,test2$value) , add = F)

# Customize the plot (add labels, title, etc.)
axis(1, at = c(1, 2), labels = c("Good", "Bad"))
title(main = "Boxplots for Good vs. Bad")

# Show the plot

###############
# connect to remote mariadb:
# shell tunnel: ssh -L 8888:127.0.0.1:3306 user@host
# sleep 20 option
library(DBI)
library(RMySQL)
db <- dbConnect(MySQL(), host = "127.0.0.1", user = "", 
                password = "", dbname = "", port = 8888)
# 36 if broken pipe!
sql_query <- "SELECT * FROM table"
results <- dbGetQuery(db, sql_query)
results
###############

#distance

# Create a matrix
tokens_matrix <- matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, ncol=3)

# Compute the absolute distance
dist_matrix <- dist(tokens_matrix)

# Print the distance matrix
print(dist_matrix)

t1<-c(1:10)
dist()
t1<-c(letters[1:10],"d","e","a")
#dist(t1["a"],t1["d"])
m<-grep("a",t1)[1]
m2<-grep("d",t1)
d1<-m2-m
d1
m<-grep("b",t1)[1]
m2<-grep("d",t1)
d1<-m2-m
d1
load()
get.tok.dist<-function(toklist){
  for (k in )
}

####
library(httr)
library(xml2)
x<-GET("https://pad.riseup.net/p/ig-metaphern")
htm<-read_html(content(x,"text"))
body<-xml_find_all(htm,'body')
#not get.


#strip diacritics, hebrew
sample1 <- "הֻסְמַק"
result <- gsub("\\p{M}", "", sample1, perl = TRUE)
print(result)

echo 'export PATH=/usr/local/bin/xmlformat.pl:$PATH' >> ~/.profile

noquote(strsplit("A text I want to display with spaces", NULL)[[1]])

unlist(strsplit("abc def ghi", ""))
unlist(strsplit("a.b.c", "."))

### to latex:
library(rmarkdown)
#library(knitr)
?render_latex
library(rmarkdown)
#for (k in f4){
t<-readLines(k)
render_latex(t)
  render(t,latex_document())
#}


  markdown_strings <- c(
    "# Title",
    "This is the first paragraph.",
    "This is the second paragraph.",
    "## Subtitle",
    "This is another paragraph under a subtitle."
  )
  
  # Combine the markdown strings into a single string
  markdown_content <- paste(markdown_strings, collapse = "   \n\n")
  markdown_strings<-readLines(k)
  markdown_content.b <- paste(markdown_strings, collapse = "   \n\n")
  markdown_content.cv <- paste(markdown_cv, collapse = "   \n\n")
  markdown_content<-paste(markdown_content.b,markdown_content.cv)
  # Write the markdown content to a temporary file
  temp_md_file <- tempfile(fileext = ".Rmd")
  writeLines(markdown_content, temp_md_file)
  writeLines(markdown_content, "temp.md")
  #writeLines(markdown_strings, temp_md_file)
  
  # Render the markdown file to LaTeX
  out.o<-list()
  out.o$output<-list(pdf_document=list("highlight-style"="zenburn",keep_tex="true"))
  render(temp_md_file,output_format = pdf_document(
    highlight = "tango", linkcolor="blue",keep_tex = TRUE),
         output_dir= ".",intermediates_dir = ".",output_file = "./output.pdf")
### no.

### in yaml header:
---
output:
  pdf_document:
    keep_tex: true
    pandoc_args: [
    "--variable", "colorlinks=true",
    "--variable", "fontsize=12pt"
  ]
---
#wks.

### lapply iteration count:

      # Use lapply() with an anonymous function to pass both the element and its index
      result <- lapply(seq_along(my_list), function(i) {
        my_function(my_list[[i]], i)
      })

### wait, sleep, pause
    Sys.sleep(10)
    
#15031.snc

# chunks, cluster
    
    l.df<-length(com.df$url)
    chunks<-ceiling(l.df/1000)
    # Create the vector
    vector <- 1:l.df
    
    # Define the chunk size
    chunk_size <- 500  # Example chunk size
    
    # Function to split the vector into chunks of equal length
    split_into_chunks <- function(vec, chunk_size) {
      split(vec, ceiling(seq_along(vec) / chunk_size))
    }
    
    # Split the vector into chunks
    chunks <- split_into_chunks(vector, chunk_size)
    







?map_chr
    
    
########
    library(dplyr)
    df1 <- tibble(x = 1:2, y = letters[1:2])
    df2 <- tibble(x = 4:5, z = 1:2)
    
    # You can supply individual data frames as arguments:
    df3<-bind_rows(df1, df2)
    
    # Or a list of data frames:
    bind_rows(list(df1, df2))
    
    # When you supply a column name with the `.id` argument, a new
    # column is created to link each row to its original data frame
    bind_rows(list(df1, df2), .id = "id")
    bind_rows(list(a = df1, b = df2), .id = "id")
    
    
    ## example of using 'incomparables'
    x <- data.frame(k1 = c(NA,NA,3,4,5), k2 = c(1,NA,NA,4,5), data = 1:5)
    y <- data.frame(k1 = c(NA,2,NA,4,5), k2 = c(NA,2,3,NA,NA), data = 1:5)
    merge(x, y, by = c("k1","k2")) # NA's match
    merge(x, y, by = "k1") # NA's match, so 6 rows
    merge(x, y, by = "data",incomparables = NA) # 2 rows
merge(x,y,by="data")    

#error
e<-simpleError("testerror")
com_button_load<-tryCatch(remdr$findElement(using = "link text", LINK_TEXT_1),error=function(e)cat("no epub, moving forth\n"),finally = print("checked epub load"))

#grouped barplot
# Reshape data for grouped barplot
library(reshape2)
df1_wide <- dcast(df1, q ~ corp, value.var = "dist")

# Ensure the order of conditions a-f
df1_wide$q <- factor(df1_wide$q, levels = c("a", "b", "c", "d", "e", "f"))
df1_wide <- df1_wide[order(df1_wide$q), ]

# Create the matrix for barplot
bar_matrix <- t(as.matrix(df1_wide[, c("obs", "ref")]))

# Plot grouped barplot
barplot(
  bar_matrix,
  beside = TRUE,
  names.arg = levels(df1_wide$q),
  col = c("black", "red"),
  las = 1,
  cex.names = 0.7,
  main = "Distances distribution of corpus/reference corpus over conditions",
  ylab = "token distance"
)
legend("topright", legend = c("obs", "ref"), fill = c("black", "red"))

word <- function(C, k) paste(rep.int(C, k), collapse = "")
## names from the first, too:
utils::str(L <- mapply(word, LETTERS[1:6], 6:1, SIMPLIFY = FALSE))

mapply(word, "A", integer()) # gave Error, now list()

#####################################################

fruit <- c("apple", "banana", "pear", "pineapple")
str_detect(fruit, "a")
str_detect(fruit, "^a")
str_detect(fruit, "a$")
str_detect(fruit, "b")
str_detect(fruit, "[aeiouf]")

# Also vectorised over pattern
m<-str_detect("aecfg", letters)
letters[m]
# Returns TRUE if the pattern do NOT match
str_detect(fruit, "^p", negate = TRUE)
l1<-"@Zilla.(indem sie bey Abel niedersinkt.) O du Richter der Welt! .. Abel!.. — "
str_match(l1,"^@([^.]+?)\\.(.*)")
?str_match
line.true<-"speaker"
!line.true%in%c("stage","speaker","test")
