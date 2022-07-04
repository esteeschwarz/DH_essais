https://dracor.org/api/corpora/ger/play/herzenskron-hoang-puff/tei
https://dracor.org/api/corpora/ger/play/klemm-der-besuch/tei
----
bash: batch rename .csv
autoload zmv
zmv '*:(*)' '$1'
----
regex replace data reference in .csv files
drst,.+?:0
drst,0