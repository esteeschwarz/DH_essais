# EXMARALDA export
## how to export .exb (EXMARALDA-files) to .txt CHAT format
- open .exb file in partitur editor
	- this is only relevant if you dont have the exported file (with which you work in the moment and that you want to export) opened in exmaralda.
- open the export dialogue:
	- *\<file\>:\<export\>*
- choose HIAT segmentation
	- if you have the transcript segmented per token (word)
		- e.g. the transcripts for YAS are segmented per token, so choosing CHAT-segmention as export option would put each token in a single line in the textfile.
	- to have a convenient reading view with, choosing the HIAT segmentation export disables the segmentation in this case.
		- for this to work, there has to be a full-stop (.) at the end of each sequence to segment the output into sentence lines
- choose a location in your filesystem
- choose *\<dateiformat\>:\<CHAT\>*
- name the file with a .txt extension (to conveniently open it in a texteditor
	- the name scheme is then as follows:
`{filename(childcode, e.g. MIM)}_{language(DE/EN)}_{textversion(WN/WE)}_{venue(SESB/RKO)}_{10/12}.txt`
- like e.g.: `MIM_DE_WN_SESB_12.txt` 
	- this is not obligatory, you could also save it with the .cha (CHAT) file extension since the document structure is CHAT format, it doesnt matter, you can open .cha files in a texteditor also...)

![][image-6-1]

![][image-6-2]

![][image-6-3]

![][image-6-4]

---- 
#### the 2 versions view:
![partitur editor view of .exb file][image-6-5]

![texteditor view of CHAT file][image-6-6]

[image-6-1]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_01.png
[image-6-2]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_02.png
[image-6-3]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_03.png
[image-6-4]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_04.png
[image-6-5]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_05.png
[image-6-6]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_6.png
