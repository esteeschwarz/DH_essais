#12263.klemm visite html VLG from wiki scrape html
#20220627(21.42)
################
library(rvest)
library(stringi)
###################################
###################################
# lisa scrape:
src<-"https://de.wikisource.org/wiki/Der_Besuch_(Klemm)"
dta1<-read_html(src)
xpathkl<-'//*[@id="mw-content-text"]/div[1]/div[2]'
#xpath copied from browser developer tools (safari)
x<-html_nodes(dta1,xpath = xpathkl)
txt<-html_nodes(dta1,xpath = xpathkl) %>%html_text()

set<-x
regx1<-array()
repl1<-array()
regx1[1]<-'<span class="Page.+?</span>'
repl1[1]<-""
m<-gregexec(regx1[1],set,perl = T)
m
regmatches(set,m)
txtm1a<-gsub(regx1[1],repl1[1],set,perl = T)
writeLines(txtm1a,klemmtemp)

regx1[2]<-'<div style="text-align:center.+?>(.+?>)(.+?)( Auftritt.)(.+?)</div>'
repl1[2]<-"<h2>\\2\\3</h2>"
m<-gregexec(regx1[2],set,perl = T)
m
regmatches(set,m)
txtm2a<-gsub(regx1[2],repl1[2],txtm1a,perl = T)
writeLines(txtm2a,klemmtemp)

regx1[3]<-'(?<=</h2>).+?(<div style=.+?)>' # here needs multiline search
repl1[3]<-"<h2>\\2\\3</h2>"
m<-gregexec(regx1[3],set,perl = T)
m
regmatches(set,m)
txtm2a<-gsub(regx1[3],repl1[3],txtm1a,perl = T)
writeLines(txtm2a,klemmtemp)

