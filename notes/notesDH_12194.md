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
.01 (</div>.*?\.) wks.
.02 replace <stage>\1</stage>
.03 (<div type="scene">)(Erster|Zweyter|Dritter|Vierter|Fünfter|Sechster|Siebenter|Achter|Neunter)( Auftritt.)
.04 <div type="scene"><head>\2\3</head>
.05 (</stage>)(Celimene.|Erast.|Chlorinde.|Damis.|Cydalise.|Finette.)
.06 \1<sp><speaker>\2</speaker>
.07a \1<p>\2</p></sp><sp><speaker>\3</speaker>
.07b (</speaker>)(.*?)(Celimene\.|Erast\.|Chlorinde\.|Damis\.|Cydalise\.|Finette\.)(.*!?(</speaker>))
.07c (</speaker>)(?!<p>)(.*?)(Celimene\.|Erast\.|Chlorinde\.|Damis\.|Cydalise\.|Finette\.)
.08 \1<p>\2</p></sp><sp><speaker>\3</speaker>

Zum Beispiel bedeutet das Suchmuster <.+> (das kein Fragezeichen enthält): "Suche nach einem <, gefolgt von 1 oder mehr Zeichen, gefolgt von einem >". Um zu verhindern, dass das Suchmuster die komplette Zeichenkette <em>text</em> findet, fügen Sie nach dem Pluszeichen ein Fragezeichen an: <.+?>. Dies führt dazu, dass die Übereinstimmung bereits beim ersten '>' endet und dementsprechend nur der erste HTML-Tag <em> gefunden wird.
(?=...) ist eine positive vorausschauende Behauptung, weil sie verlangt, dass ein bestimmtes Suchmuster existieren muss. (?!...) hingegen ist eine negative vorausschauende Behauptung, weil sie verlangt, dass ein bestimmtes Suchmuster fehlen muss. (?<=...) und (?<!...) sind positive bzw. negative zurückschauende Behauptungen, weil sie nach links und nicht nach rechts von der aktuellen Position schauen.
12243.api fetch bibliography:
.01 weblink:
https://www.zotero.org/groups/940512/dlina/library
https://www.zotero.org/groups/4713246/avl_dyn/library
.02 sample API: 
https://api.zotero.org/users/475425/items?format=atom&v=3
.03 AVL_dyn atom / formattet html
https://api.zotero.org/groups/4713246/items?format=atom&v=3
https://api.zotero.org/groups/4713246/items?format=bib