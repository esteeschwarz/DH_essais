##### 12172.DH.fischer
###### 20220427 / stephan schwarz
## gutenberg-DE
###### <https://www.projekt-gutenberg.org>
hhh
### summary:
- 1994 ("in den kindertagen des internet") gegründet, um beständige inhalte zu setzen und die deutsche sprache u. kultur zu fördern
- weltweit gröszte digitale sammlung deutschsprachiger literatur
- zielgruppe: 
  - lesefreudiges publikum
  - lehrer/
  - schüler/ 
  - student/
hhh 
### keys:
- liste der 10.000 mit edition 15 ausgelieferten titel 
  - download list: <https://gutenberg.abc.de/index.php?controller=attachment&id_attachment=17>
  - [show list](allworka.htm)
hhh
### info:
- gemeinfreie werke (70j+ nach tod des autors) werden originalgetreu digitalisiert
- zugänglichkeit über platform reader, keine downloadmöglichkeit, kaufoption der editionen
- frage: was ist die connection zu <https://gutenberg.org>?
- abfrage nach autor:innen (alphabetisch sortiert) oder genre
- arbeit weitgehend nicht finanziert, hier auch anbetracht der langen existenz verhältnismäszig geringes spektrum an möglichkeiten der nutzung von inhalten >>>
hhh
### luft nach oben...
- format der verkauften edition wird als html angegeben, frage bleibt nach analysemöglichkeiten, also wie das material aufbereitet ist
- keine API abfrage möglich zur automatisierten analyse des materials

hhh
#### play
```r
# 12172.DH
# 20220424(16.43)
#################
#goethe wilhelm meister 1-8: (2335)-(2343)
src1<-"https://gutenberg.org/ebooks/2335.txt.utf-8"
src2<-"https://gutenberg.org/ebooks/2336.txt.utf-8"
src3<-"https://gutenberg.org/ebooks/2337.txt.utf-8"
src4<-"https://gutenberg.org/ebooks/2338.txt.utf-8"
src5<-"https://gutenberg.org/ebooks/2339.txt.utf-8"
src6<-"https://gutenberg.org/ebooks/2340.txt.utf-8"
src7<-"https://gutenberg.org/ebooks/2341.txt.utf-8"
src8<-"https://gutenberg.org/ebooks/2342.txt.utf-8"

#get text
ext<-function(src){
  dta<-scan(src,"")
  start<-which(dta=="PRINT!")
  start2<-start[1]+20
  startbook<-which(dta[start[1]:start2]=="Wilhelm")
  start1<-startbook-1
  dta4<-dta[start[1]+start1:length(dta)]
  dta5<-dta4[!is.na(dta4)]
}

bd1<-ext(src1)
bd2<-ext(src2)
bd3<-ext(src3)
bd4<-ext(src4)
bd5<-ext(src5)
bd6<-ext(src6)
bd7<-ext(src7)
bd8<-ext(src8)

#get unique words
  bduni<-cbind(unique(bd1),
               unique(bd2),
               unique(bd3),
               unique(bd4),
               unique(bd5),
               unique(bd6),
               unique(bd7),
               unique(bd8))

  
barplot(cbind(
"I"=ttr1<-length(bduni[,1])/length(bd1),
"II"=ttr2<-length(bduni[,2])/length(bd2),
"III"=ttr3<-length(bduni[,3])/length(bd3),
"IV"=ttr4<-length(bduni[,4])/length(bd4),
"V"=ttr5<-length(bduni[,5])/length(bd5),
"VI"=ttr6<-length(bduni[,6])/length(bd6),
"VII"=ttr7<-length(bduni[,7])/length(bd7),
"VIII"=ttr8<-length(bduni[,8])/length(bd8)
),main="type-token ratio Lehrjahre 1-8")

# nice comes...
```
script source: 
<https://github.com/esteeschwarz/essais/tree/main/docs/DH/R/meister_goth.R>
vvv
![output](https://github.com/esteeschwarz/essais/raw/main/docs/DH/R/meister001.png)
hhh
##### fin
hhh
- achso: <https://www.gaga.net/pgdp/default.php> 
- ich werde das improvisieren