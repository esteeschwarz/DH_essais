# 12251.klemm besuch preview:
- script R zur auszeichnung der wikisource quelle nach dem TEI standard: https://github.com/esteeschwarz/DH_essais/blob/main/R/klemm_TEI_conversion_wks.R
- not finalised TEI encoded body of klemm(1765): https://github.com/esteeschwarz/DH_essais/blob/main/data/corpus/klemm_besuch/klemm_TEI_body.xml
- finalised TEI according to drama scheme https://github.com/esteeschwarz/DH_essais/blob/main/data/corpus/klemm_besuch/klemm_TEI_final.xml
- presentation when finished: https://school.dh-index.org/public/pr/2022-06-22
- in above folder you find also all [staged and commented](https://github.com/esteeschwarz/DH_essais/blob/main/data/corpus/klemm_besuch) essais de declaration from raw OCR to TEI

# 12252.
die auszeichnung funktioniert leider noch nicht vollautomatisiert. die castlist musz manuell editiert werden. ansonsten kann [dieser text](https://github.com/esteeschwarz/DH_essais/blob/main/data/corpus/klemm_besuch/klemm_TEI_body.xml) (same as above, TEI_body) so wie er aus R exportiert wird, in den textblock der dramavorlage importiert werden.
.01 castlist inserted with R, provisory solution
# 12253.
.01 TODO: die auszeichnung musz noch dem dracor schema angepaszt werden, die vereinfachte drama-vorlage reicht nicht, um zb. mit dem DramaNLP eine auswertung vornehmen zu können...
.02 TODO: weiterhin ist das script spezifisch auf das klemm drama angepaszt..., ein task wäre, es so zu bauen, dasz es die wikivorlagen der anderen kursstücke ebenfalls exportieren kann.
.02.1 major task..., dafür zuerst sprecherinstanzen filtern können
.03 [link](https://github.com/esteeschwarz/DH_essais/blob/main/data/corpus/klemm_besuch/nlp) zum drama_NLP output
