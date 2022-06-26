#################
src<-"~/Documents/static/server/logs12262/access.log.24.4"
src<-"~/Documents/static/server/logs12262/access.log.25.1"

# .01 -- / #;#
# .02 " ([\d]{3}) / "#;#\1#;#
# .03 #( )([\d]{1,7}) / #\2#;#
# .04 (#[\d]{1,7}#;#) (.+?) "    \1\2#;#"
# .05 ##"(.+?)"   #"\1"#;##
# .06 .07 -||-
# .07 #\w  \w#  #
# .07 #;# ;
# ;"(POST|GET|HEAD|PROPFIND) ;

library(readtext)
dta<-readtext(src)
txt<-dta$text
###
regx1a<-"\n"
repl1a<-""
txtm1<-gsub(regx1a,repl1a,txt)
###
regx1b<-"- -"
repl1b<-"#;#"
txtm2<-gsub(regx1b,repl1b,txtm1)
###
regx1j<-'"(POST|GET|HEAD|PROPFIND)'
repl1j<-'#;#\\1#;#"'
txtm10b<-gsub(regx1j,repl1j,txtm2)
###
regx1c<-'" ([0-9]{3})'
repl1c<-'"#;#\\1#;#'
txtm3<-gsub(regx1c,repl1c,txtm10b)
###
regx1d<-"#( )([0-9]{1,7})"
repl1d<-"#\\2#;#"
txtm4<-gsub(regx1d,repl1d,txtm3)
###
regx1e<-'(#[0-9]{1,7}#;#) (.+?)"'
repl1e<-'\\1\\2#;##"'
txtm5<-gsub(regx1e,repl1e,txtm4)
###
regx1f<-'##"(.+?)"'
repl1f<-'#"\\1"#;##'
txtm6<-gsub(regx1f,repl1f,txtm5)
###
regx1f2<-'##"(.+?)"'
repl1f2<-'#"\\1"#;##'
txtm62<-gsub(regx1f2,repl1f2,txtm6)
###
regx1f3<-'##"(.+?)"'
repl1f3<-'#"\\1"#;##'
txtm63<-gsub(regx1f3,repl1f3,txtm62)
###
regx1f3<-'## "(.+?)"'
repl1f3<-'#"\\1"#;##'
txtm63<-gsub(regx1f3,repl1f3,txtm63)
###
regx1f3<-'## "(.+?")'
repl1f3<-'#"\\1\n'
txtm63<-gsub(regx1f3,repl1f3,txtm63)
###

regx1g<-"# "
repl1g<-"#"
txtm7<-gsub(regx1g,repl1g,txtm63)
###
regx1h<-" #"
repl1h<-"#"
txtm8<-gsub(regx1h,repl1h,txtm7)
###
regx1i<-"#;#"
repl1i<-";"
txtm9<-gsub(regx1i,repl1i,txtm8)
###
#regx1j<-';"(POST|GET|HEAD|PROPFIND)'
#repl1j<-';\\1;'
#txtm10<-gsub(regx1j,repl1j,txtm9)
###
#head(txtm9)
#read.table(txtm9)
log.ns<-c("ip","date","call","resp","x","page","ref","agent","y")
log.ns<-"ip;date;call;q;resp;x;ref;page;agent;y\n"
logcsv<-paste0(log.ns,txtm9)
logfile<-"~/boxHKW/21S/DH/local/ada/log12251.csv"
writeLines(logcsv,logfile)
library(readr)
logdata <- read_delim("~/boxHKW/21S/DH/local/ada/log12251.csv",";")
#####################################################################
dta<-logdata
m<-gregexec("login.php",dta$q)
sum(m[1:3130]==T)
library(stringi)
m<-stri_detect(dta$q,regex = "login.php")
mout.l<-subset(dta,m)
m<-stri_detect(mout.l$resp,regex = "login.php")
mout.l200<-subset(mout.l,mout.l$resp==200)
