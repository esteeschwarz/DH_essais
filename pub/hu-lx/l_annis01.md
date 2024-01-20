# ANNIS framework
find your way through: [https://corpus-tools.org/annis/][1], install ANNIS on your system and try to import the zipped ANNIS SES corpus you find in the HU-box. \> folder: `sketch engine Work`, namescheme of latest zip: `[datestamp]_SES_annis_tagged_corpus.zip `

## SES sample procedure to create ANNIS corpus
**the following is just for documentation of the process; you wont have to follow these steps, just follow above instructions to install ANNIS on your system and import the zipped corpus.**
- upload files in HU box folder `version without header for SketchEngine upload` to SketchEngine \> *create new corpus*
-  *expert compiler settings* \> adapt `docscheme` to \> `sesCPT` 
	- with that done you can already explore the SES corpus in the SketchEngine GUI using the built in CQL (corpus query language) commands.
- download corpus (vertical)
	- corpus is now a database of token, PoS, lemma; tagged according to the *GermanRF tagset*[^1] used by SketchEngine
- process database in: [conc-essai.R][2]
	- splits PoS tag (scheme: `x.x.x.x.x`) into seperate columns defining classes of PoS tags
	- writes single .xlsx files for each kid into folder
	- ANNIS preprocessing: 
		- [pepper][3]: `xls > treetagger format` from .xlsx files folder. [parameter file][4]
		- pepper: `treetagger > annis graph format` from treetagger files folder. [parameter file][5]
		- zip annis graph files
- upload annis.zip to ANNIS localhost server

## ANNIS ready to use installation:
please find here: [link follows]() an ANNIS server installation with the SES corpus ready to use. (! 20230904: the link is not yet freely available, use the link shared in moodle if you dont want to use your own local installation !)

[^1]:	https://www.sketchengine.eu/German-rftagger-part-of-speech-tagset/

[1]:	https://corpus-tools.org/annis/
[2]:	https://github.com/esteeschwarz/HU-LX/blob/main/scripts/conc_essai.R
[3]:	https://corpus-tools.org/pepper/
[4]:	https://github.com/esteeschwarz/HU-LX/blob/main/scripts/r-conxl1.pepper
[5]:	https://github.com/esteeschwarz/HU-LX/blob/main/scripts/r-conxl2.pepper
