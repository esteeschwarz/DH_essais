## transcription: by merge imported text and template
note: for this method some technical skills are needed, but you definitely save effort transcribing.   

### preliminary
- open the original .pdf you want to transcribe and a simple text editor, rather not word, use [this one (VS Code)][4-1] for example. 
- best is to have a parallel view of the .pdf and the editor in horizontal split
- download the template \<LLDM\_exmaralda\_basictemplate.exb\> from the HU box or [here][4-2]   

### transcription
- transcribe (type) the text as is is written in the .pdf into a plain text file in the editor
- transcribe *every* written form, including stroke through words or phrases, i.e. every information that could be later on analysed
	- you can mark up information like this or use your own (consistent!) system, important is, that you later (see [sec. 2.4-4][4-3]) be able to transfer your marked up information into an annotation in the transcript, e.g. like here where "an" was stroke through in the original text:

`gut erinnern an die Zeit in der Grundschule und _an-strike_ die ersten Jahre auf dem Gymnasium, in der immer viel abgeschrieben wurde`

- you can type the whole text in one paragraph, include punctuation etc., be careful transcribing whitespaces, there mustnt be double-whitespaces, be sure of that.
- save the file as .txt   

### import text to EXMARaLDA

![][image-4-1]

![][image-4-2]

- you have your plain text to be split into segments, which will be one segment / word or punctuation mark. 
- for that you choose: \<split at regular expression\> with the following input (regex formula) (which is very important to be exactly copied into the field:

`( |([,.;:!?()] )|[a-zäöüß](?=([,.;:?!()] )))`   


- in the square brackets (left and right) you see all the punctuation signs after and before which a new segment should be created.    
- NOTE: if you discovered (transcribed) more of these, you should put them into the brackets to the left and right (1st and 3rd bracket), not in the middle one.
		 
![][image-4-3]

- you should now have a partitur with one transcription line containing your text tokenized
- save that transcript, its just a temporary step

### merge with basic template

- first, remove the speaker:

![][image-4-4]

![][image-4-5]

- merge:

![][image-4-6]

- you have to choose the \<LLDM\_exmaralda\_basictemplate.exb\> and double click on it, if it then appears in the box below, you can click \<merge\>. this will combine the tiers of both your transcription and the basic template.

![][image-4-7]

- now there should be a partitur with all 6 tiers from the basic transcript plus your transcription
- clean up the transcription and remove the time labels as follows

![][image-4-8]

![][image-4-9]

![][image-4-10]



### speakertable
- edit the speakertable to relabel the tiers:

![][image-4-11]

![][image-4-12]

- here you insert the speaker abbreviation as label from the .pdf (e.g. MIM), the language used in the transcript and the L1/L2 if named in the questionaire.
- then fill in the values of the template attributes for the speaker with the corresponding values of the transcript (from the questionaire)
	- left is the attribute name, right the value which is to adapt
- if all works well, the partitur should now display tiers labeled with your participant + the category like

![][image-4-13]

- remove the obsolete [v] tier which is redundant of the basic template.

![][image-4-14]

- instead, assign the correct speaker to your \<TXT\> tier:

![][image-4-15]

![][image-4-16]

### metadata
- edit the transcript metadata:

![][image-4-17]

- choose \<template\> and open the LLDM\_basictemplate

![][image-4-18]

![][image-4-19]

![][image-4-20]

- like above replace the values of the template attributes for the metadata with the corresponding values of the transcript (from the questionaire)
	- left is the attribute name, right the value which is to adapt
- add project name and transcription name according to scheme

#### fin
```r
print("voila:")
print("dont forget to save your work!")
```

[4-1]:	https://code.visualstudio.com
[4-2]:	https://github.com/esteeschwarz/HU-LX/blob/main/trans/LLDM_exmaralda_basictemplate.exb
[4-3]:	be1_exmaralda-041.md

[image-4-1]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22a.png
[image-4-2]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22b.png
[image-4-3]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22c.png
[image-4-4]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_1.png
[image-4-5]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22d.png
[image-4-6]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22e.png
[image-4-7]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22f.png
[image-4-8]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22g.png
[image-4-9]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22h.png
[image-4-10]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22j.png
[image-4-11]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_1.png
[image-4-12]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_2.png
[image-4-13]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22k.png
[image-4-14]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22L.png
[image-4-15]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22m.png
[image-4-16]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22n.png
[image-4-17]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_7a.png
[image-4-18]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_7b.png
[image-4-19]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_7c.png
[image-4-20]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_7d.png
