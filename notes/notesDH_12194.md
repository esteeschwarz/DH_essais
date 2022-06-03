#12104.notes DH
#### seitenzahlen löschen:
\[.{1,4}\]
\[0-9\]{1,4}
\[[0-9]{3}\]

^Schnaps\. (.*)$
replace
<sp><speaker>Schnaps. </speaker><p>\1</p></sp>

#12217.network extraction klemm(1765)
.01 regex get scenes for replace
((Erster|Zweyter|Dritter|Vierter|Fünfter|Sechster|Siebenter|Achter|Neunter) (Auftritt. ))
.02 replace 
<div type="scene">\1</div>
.wks
.03 get speaker stage, clear: find all name occurences, finish search at first [.] that is all names until first [.]
.03.1 (Celimene.*)\. doesnt finish at [.]
.03.2 embrace in <stage>
.04 get paragraph, clear: find all text between .03 and <div type="scene">
.04.1 embrace in <p>
12227.
.01 (div>.*?\.) wks. 
