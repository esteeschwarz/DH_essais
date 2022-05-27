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