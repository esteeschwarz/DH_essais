## transcription: from audio
### preliminary
- download the audio you want to transcribe from the box
- **NOTE:** generally the audio has to be anonymised in another step, see [section 5-3][5-1] 
- open the audio preferably in audacity, but you can use any player that plays .mp3 files and enables you to navigate conveniently in the timeline of the audio
- open a simple plain text editor, word is also possible, you have to save the file in plain .txt format (UTF-8 encoded) at the end.

### transcription
- transcribe everything that you hear exactly as you hear it. that means, you *can* interprete what you hear if something is unclear, *but* you should **NO WAY** correct for errors of the participant you perceive. 
- that is: you transcribe any style, grammar etc. errors *as* you perceive them and annotate these within the transcript. use a consistent markup that allows you to later transfer you annotations to an exmaralda error annotation tier. you could do it like this:

excerpt:

```
aber man sollte mit#nonstandard# Personen nach dem Charakter beurteilen und wenn man das nicht macht, dann bist du auf den#nonstandard case# falschen Weg und dann bekommst du auch die (...) nicht guten#style# Freunde
```

- pauses are transcribed as (...) for longer and (.) for very short micropauses
	- be sure that you type **three dots** and not use the automatically condensed three dots of word. (i really disencourage you to using word, for 1000 other reasons. use [this one (VS Code)][5-2] for example or any other simple text editor for your system.)
- save the transcription according to the scheme, e.g. SESB-12\_VED\_DE\_ON\_PAB\_20240110.txt

### import to exmaralda
- open the partitur editor
- choose \<file\>\<new\> to create a new document
- copy the content of your transcription (the copied text should not contain anything but the transcribed text + error annotation, no meta information) in one step. i.e. you should have the complete transcribed text in the clipboard now
- paste the text into the segment labeled \<1\>
- **important:** save the transcription now according to the scheme

![][image-5-1]

![][image-5-2]


### tokenisation, pos-tagging, lemmatization
-  open the weblicht interface of exmaralda

![][image-5-3]

- get you an API key from the website to fill in the key

![][image-5-4]

- if something goes wrong, try to clean up the transcription with \<transcription\>\<clean up\> before applying the weblicht tool. that will remove any unused segments.

if everything works well the transcription should now include a lemma and pos-tag tier.

![][image-5-5]

### merge with basic template and edit metadata
follow the steps in [section 2.5-2][5-3] to get the annotation tiers and metadata scheme into your transcription. to edit the metadata and speakertable and assign the speakers, follow that guide.

[5-1]:	c_audacity.md
[5-2]:	https://code.visualstudio.com
[5-3]:	be1_exmaralda-022.md

[image-5-1]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_3_1a.png
[image-5-2]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_3_1b.png
[image-5-3]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_11b.png
[image-5-4]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_3_1c.png
[image-5-5]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_3_1e.png
