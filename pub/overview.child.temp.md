-   [1 meta](#meta)
-   [2 EXMARALDA workflow](#exmaralda-workflow)
    -   [2.1 general](#general)
    -   [2.2 transcription: from scratch in
        template](#transcription-from-scratch-in-template)
        -   [2.2.1 preliminary](#preliminary)
        -   [2.2.2 speakertable](#speakertable)
        -   [2.2.3 metadata](#metadata)
        -   [2.2.4 transcribe the text from the
            .pdf:](#transcribe-the-text-from-the-.pdf)
    -   [2.3 transcription: by merge imported text and
        template](#transcription-by-merge-imported-text-and-template)
        -   [2.3.1 preliminary](#preliminary-1)
        -   [2.3.2 transcription](#transcription)
        -   [2.3.3 import text to EXMARaLDA](#import-text-to-exmaralda)
        -   [2.3.4 merge with basic
            template](#merge-with-basic-template)
        -   [2.3.5 speakertable](#speakertable-1)
        -   [2.3.6 metadata](#metadata-1)
    -   [2.4 transcription: from audio](#transcription-from-audio)
        -   [2.4.1 preliminary](#preliminary-2)
        -   [2.4.2 transcription](#transcription-1)
        -   [2.4.3 import to exmaralda](#import-to-exmaralda)
        -   [2.4.4 tokenisation, pos-tagging,
            lemmatization](#tokenisation-pos-tagging-lemmatization)
        -   [2.4.5 merge with basic template and edit
            metadata](#merge-with-basic-template-and-edit-metadata)
-   [3 EXMARALDA export](#exmaralda-export)
    -   [3.1 how to export .exb (EXMARALDA-files) to .txt CHAT
        format](#how-to-export-.exb-exmaralda-files-to-.txt-chat-format)
-   [4 EXMARALDA coding](#exmaralda-coding)
    -   [4.1 normalisation](#normalisation)
    -   [4.2 pos-tag / lemmatize](#pos-tag-lemmatize)
    -   [4.3 formulate the ZH](#formulate-the-zh)
-   [5 how to anonymise/combine audios using
    audacity](#how-to-anonymisecombine-audios-using-audacity)
    -   [5.1 anonymise](#anonymise)
    -   [5.2 combine](#combine)
    -   [5.3 export mp3](#export-mp3)
-   [6 SES Database](#ses-database)
    -   [6.1 columns explained](#columns-explained)
    -   [6.2 summary](#summary)
-   [7 Sketch Engine](#sketch-engine)
    -   [7.1 log in to Sketch Engine](#log-in-to-sketch-engine)
    -   [7.2 create new corpus](#create-new-corpus)
    -   [7.3 import texts](#import-texts)
    -   [7.4 compile corpus](#compile-corpus)
-   [8 ANNIS framework](#annis-framework)
    -   [8.1 SES sample procedure to create ANNIS
        corpus](#ses-sample-procedure-to-create-annis-corpus)
    -   [8.2 ANNIS ready to use
        installation:](#annis-ready-to-use-installation)
-   [9 BERLANGDEV](#berlangdev)
    -   [9.1 short overview of basic
        workflow:](#short-overview-of-basic-workflow)
-   [10 SES: BERLANGDEV media status](#ses-berlangdev-media-status)
-   [11 SES class findings](#ses-class-findings)
    -   [11.1 class findings](#class-findings)
    -   [11.2 class findings](#class-findings-1)
    -   [11.3 class findings](#class-findings-2)
    -   [11.4 principle of accountability
        ](#principle-of-accountability-24-1)
    -   [11.5 SES distribution analysis](#ses-distribution-analysis)
        -   [11.5.1 small significance
            testing:](#small-significance-testing)
        -   [11.5.2 lmer coefficients](#lmer-coefficients)
-   [12 GLOSSARY/ANNEX: on a funny note](#glossaryannex-on-a-funny-note)
    -   [12.1 to avoid further confusion](#to-avoid-further-confusion)

rsnc:ref,

# 1 meta

version: 20240121(07.21)  
authored: st. schwarz, FUB

#### 1.0.0.1 content

-   EXMARALDA
-   audacity: how to anonymise interview audio
-   explanations to the SES database
-   SketchEngine import corpus
-   ANNIS framework
-   BERLANGDEV workflow
-   BERLANGDEV media status
-   class findings

#### 1.0.0.2 info:

please find [here](https://box.fu-berlin.de/s/Hr7Fad5bTjSmtKT) a .docx /
pdf version of the pages.  
**mdbook instance:** you can also use the \<print\> button on the top
right side to generate an uptodate printed version.  
to make sure you are viewing the most recent version of the wrap up,
reload the pages by visiting:
<https://pinghook.dh-index.org?page=pfaff-corpusclass-overview>

for trouble with technical terms/expressions used please consult the
[glossary](z1_annex.md) at the end.

# 2 EXMARALDA workflow

## 2.1 general

-   info/download: [EXMARALDA Partitur
    Editor](https://exmaralda.org/de/partitur-editor-de/)
-   assuming you have successfully installed exmaralda on your system
    here follow some instructions on how to work with it.
-   you cannot open the .exb (exmaralda format) directly from the HU
    box, you have to download and open the files in the partitureditor.

## 2.2 transcription: from scratch in template

note: this method is demanding fewer technical skills, but takes longer
to transcribe = type the text. if you decide to do use a more technical
demanding method, which allows for easy and fast transkription, skip to
[section 2.3-2](be1_exmaralda-022.md).

### 2.2.1 preliminary

-   open the original .pdf you want to transcribe and the partitur
    editor. best is to have a parallel view of the .pdf and the partitur
    in horizontal split
-   open the template \<LLDM_exmaralda_basictemplate.exb\> which you
    download from the HU box or
    [here](https://github.com/esteeschwarz/HU-LX/blob/main/trans/LLDM_exmaralda_basictemplate.exb).
-   in this template you have already the necessary tiers for the
    transkription and annotation created. (without content)

### 2.2.2 speakertable

-   edit the speakertable to relabel the tiers:

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_1.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_7d.png)

-   here you insert the speaker abbreviation as label from the .pdf
    (e.g. MIM), the language used in the transcript and the L1/L2 if
    named in the questionaire.
-   then fill in the values of the template attributes for the speaker
    with the corresponding values of the transcript (from the
    questionaire)
    -   left is the attribute name, right the value which is to adapt

### 2.2.3 metadata

-   edit the transcript metadata:

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_7a.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_7d.png)

-   like above fill in the values of the template attributes for the
    metadata with the corresponding values of the transcript (from the
    questionaire)
    -   left is the attribute name, right the value which is to adapt

### 2.2.4 transcribe the text from the .pdf:

-   click into a segment
-   type the text
    -   at the end of one unit (which is still to define: either
        sentence, word or syntactic unit) insert a
        \<space:leerzeichen:whitespace\> to signal the chat processor,
        that this is a segment. when you done with one segment and the
        end of available empty segments of the transcription tier is
        reached, one new segment is opened when you hit \<return:enter\>
        and you can type in the next unit.
    -   precisely: for text tokenised per word the steps will be:
        -   type word \> type whitespace \> hit return
            -   note: in each after these steps automatically opened new
                segment you have to type the first character twice,
                since the input is possible only when you started
                typing. you will see what is meant by trying…
        -   repeat for every word (AND punctuation mark!)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_4.png)

if you need to insert an empty segment in the middle of the transcript
(because you forgot to transcribe a word e.g.) you can split an event
which creates an empty segment.

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_4bb.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_4cc.png)

you can also write the whole sentence into on segment an then split like
above the segments where you want by positioning your cursor at the
right position. the new segment will be created exactly where your
cursor is, that would be after the whitespace between 2 words if you
place it there. if there was a word after the whitespace, then that
would be the content of the next segment (including every word which
followed, you have to repeat the step for each word in the sentence.)  
the reverse operation (combining segments) is also possible; mark the
segments you want to combine (like cells in an excel table, not with
SHIFT-hold, but by moving over them mouse-clicked) and choose
\<event:merge\>.

-   save your transcription, it will be saved as .exb

## 2.3 transcription: by merge imported text and template

note: for this method some technical skills are needed, but you
definitely save effort transcribing.

### 2.3.1 preliminary

-   open the original .pdf you want to transcribe and a simple text
    editor, rather not word, use [this one (VS
    Code)](https://code.visualstudio.com) for example.
-   best is to have a parallel view of the .pdf and the editor in
    horizontal split
-   download the template \<LLDM_exmaralda_basictemplate.exb\> from the
    HU box or
    [here](https://github.com/esteeschwarz/HU-LX/blob/main/trans/LLDM_exmaralda_basictemplate.exb)

### 2.3.2 transcription

-   transcribe (type) the text as is is written in the .pdf into a plain
    text file in the editor
-   transcribe *every* written form, including stroke through words or
    phrases, i.e. every information that could be later on analysed
    -   you can mark up information like this or use your own
        (consistent!) system, important is, that you later (see
        [sec. 2.4-4](be1_exmaralda-041.md)) be able to transfer your
        marked up information into an annotation in the transcript,
        e.g. like here where “an” was stroke through in the original
        text:

`gut erinnern an die Zeit in der Grundschule und _an-strike_ die ersten Jahre auf dem Gymnasium, in der immer viel abgeschrieben wurde`

-   you can type the whole text in one paragraph, include punctuation
    etc., be careful transcribing whitespaces, there mustnt be
    double-whitespaces, be sure of that.
-   save the file as .txt

### 2.3.3 import text to EXMARaLDA

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22a.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22b.png)

-   you have your plain text to be split into segments, which will be
    one segment / word or punctuation mark.
-   for that you choose: \<split at regular expression\> with the
    following input (regex formula) (which is very important to be
    exactly copied into the field:

`( |([,.;:!?()] )|[a-zäöüß](?=([,.;:?!()] )))`

-   in the square brackets (left and right) you see all the punctuation
    signs after and before which a new segment should be created.  
-   NOTE: if you discovered (transcribed) more of these, you should put
    them into the brackets to the left and right (1st and 3rd bracket),
    not in the middle one.

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22c.png)

-   you should now have a partitur with one transcription line
    containing your text tokenized
-   save that transcript, its just a temporary step

### 2.3.4 merge with basic template

-   first, remove the speaker:

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_1.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22d.png)

-   merge:

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22e.png)

-   you have to choose the \<LLDM_exmaralda_basictemplate.exb\> and
    double click on it, if it then appears in the box below, you can
    click \<merge\>. this will combine the tiers of both your
    transcription and the basic template.

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22f.png)

-   now there should be a partitur with all 6 tiers from the basic
    transcript plus your transcription
-   clean up the transcription and remove the time labels as follows

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22g.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22h.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22j.png)

### 2.3.5 speakertable

-   edit the speakertable to relabel the tiers:

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_1.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_2.png)

-   here you insert the speaker abbreviation as label from the .pdf
    (e.g. MIM), the language used in the transcript and the L1/L2 if
    named in the questionaire.
-   then fill in the values of the template attributes for the speaker
    with the corresponding values of the transcript (from the
    questionaire)
    -   left is the attribute name, right the value which is to adapt
-   if all works well, the partitur should now display tiers labeled
    with your participant + the category like

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22k.png)

-   remove the obsolete [v] tier which is redundant of the basic
    template.

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22L.png)

-   instead, assign the correct speaker to your \<TXT\> tier:

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22m.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_22n.png)

### 2.3.6 metadata

-   edit the transcript metadata:

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_7a.png)

-   choose \<template\> and open the LLDM_basictemplate

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_7b.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_7c.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_7d.png)

-   like above replace the values of the template attributes for the
    metadata with the corresponding values of the transcript (from the
    questionaire)
    -   left is the attribute name, right the value which is to adapt
-   add project name and transcription name according to scheme

#### 2.3.6.1 fin

``` r
print("voila:")
print("dont forget to save your work!")
```

## 2.4 transcription: from audio

### 2.4.1 preliminary

-   download the audio you want to transcribe from the box
-   **NOTE:** generally the audio has to be anonymised in another step,
    see [section 5-3](c_audacity.md)
-   open the audio preferably in audacity, but you can use any player
    that plays .mp3 files and enables you to navigate conveniently in
    the timeline of the audio
-   open a simple plain text editor, word is also possible, you have to
    save the file in plain .txt format (UTF-8 encoded) at the end.

### 2.4.2 transcription

-   transcribe everything that you hear exactly as you hear it. that
    means, you *can* interprete what you hear if something is unclear,
    *but* you should **NO WAY** correct for errors of the participant
    you perceive.
-   that is: you transcribe any style, grammar etc. errors *as* you
    perceive them and annotate these within the transcript. use a
    consistent markup that allows you to later transfer you annotations
    to an exmaralda error annotation tier. you could do it like this:

excerpt:

    aber man sollte mit#nonstandard# Personen nach dem Charakter beurteilen und wenn man das nicht macht, dann bist du auf den#nonstandard case# falschen Weg und dann bekommst du auch die (...) nicht guten#style# Freunde

-   pauses are transcribed as (…) for longer and (.) for very short
    micropauses
    -   be sure that you type **three dots** and not use the
        automatically condensed three dots of word. (i really
        disencourage you to using word, for 1000 other reasons. use
        [this one (VS Code)](https://code.visualstudio.com) for example
        or any other simple text editor for your system.)
-   save the transcription according to the scheme,
    e.g. SESB-12_VED_DE_ON_PAB_20240110.txt

### 2.4.3 import to exmaralda

-   open the partitur editor
-   choose \<file\>\<new\> to create a new document
-   copy the content of your transcription (the copied text should not
    contain anything but the transcribed text + error annotation, no
    meta information) in one step. i.e. you should have the complete
    transcribed text in the clipboard now
-   paste the text into the segment labeled \<1\>
-   **important:** save the transcription now according to the scheme

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_3_1a.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_3_1b.png)

### 2.4.4 tokenisation, pos-tagging, lemmatization

-   open the weblicht interface of exmaralda

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_11b.png)

-   get you an API key from the website to fill in the key

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_3_1c.png)

-   if something goes wrong, try to clean up the transcription with
    \<transcription\>\<clean up\> before applying the weblicht tool.
    that will remove any unused segments.

if everything works well the transcription should now include a lemma
and pos-tag tier.

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_3_1e.png)

### 2.4.5 merge with basic template and edit metadata

follow the steps in [section 2.5-2](be1_exmaralda-022.md) to get the
annotation tiers and metadata scheme into your transcription. to edit
the metadata and speakertable and assign the speakers, follow that
guide.

# 3 EXMARALDA export

## 3.1 how to export .exb (EXMARALDA-files) to .txt CHAT format

-   open .exb file in partitur editor
    -   this is only relevant if you dont have the exported file (with
        which you work in the moment and that you want to export) opened
        in exmaralda.
-   open the export dialogue:
    -   *\<file\>:\<export\>*
-   choose HIAT segmentation
    -   if you have the transcript segmented per token (word)
        -   e.g. the transcripts for YAS are segmented per token, so
            choosing CHAT-segmention as export option would put each
            token in a single line in the textfile.
    -   to have a convenient reading view with, choosing the HIAT
        segmentation export disables the segmentation in this case.
        -   for this to work, there has to be a full-stop (.) at the end
            of each sequence to segment the output into sentence lines
-   choose a location in your filesystem
-   choose *\<dateiformat\>:\<CHAT\>*
-   name the file with a .txt extension (to conveniently open it in a
    texteditor
    -   the name scheme is then as follows:
        `{filename(childcode, e.g. MIM)}_{language(DE/EN)}_{textversion(WN/WE)}_{venue(SESB/RKO)}_{10/12}.txt`
-   like e.g.: `MIM_DE_WN_SESB_12.txt`
    -   this is not obligatory, you could also save it with the .cha
        (CHAT) file extension since the document structure is CHAT
        format, it doesnt matter, you can open .cha files in a
        texteditor also…)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_01.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_02.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_03.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_04.png)

------------------------------------------------------------------------

#### 3.1.0.1 the 2 versions view:

<figure>
<img
src="https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_05.png"
alt="partitur editor view of .exb file" />
<figcaption aria-hidden="true">partitur editor view of .exb
file</figcaption>
</figure>

<figure>
<img
src="https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_6.png"
alt="texteditor view of CHAT file" />
<figcaption aria-hidden="true">texteditor view of CHAT file</figcaption>
</figure>

# 4 EXMARALDA coding

#### 4.0.0.1 how to annotate the transcript

## 4.1 normalisation

if you have finished transcribing the primary text, it is necessary to
add further tiers (rows) for annotation.  
you will first add a tier, with a normalised version of the text as
content. for that:

-   add a new tier
-   choose to \<copy events from\> the speaker tier and label it
    [norm]

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_10a.png)

-   now you have a copy of the speakerline called X [norm] with the
    same text as in your transcription tier.
-   *normalisation* in this context means that you correct the text in
    that tier for
    -   spelling (orthographic) errors (exluding interpunctuation
        mistakes)
    -   your personal markup of e.g. strike through and other
        annotations to the text you made in the process of transcribing
        -   you should here (in the normalisation tier) remove anything
            from the text which is *not* text of the participant.
        -   use the X[com] (comment) tier to transfer what you
            observed or, if you already annoted under linguistic
            aspects, use the [ERR.xxx] tiers and write down you
            observations
-   the [norm] tier is necessary in the next step, where you pos-tag
    and lemmatize the tokens. to be able to do this automatically, all
    tokens have to be lexical items i.e. without any spelling errors or
    markup to enable the algorithm tag them correctly

## 4.2 pos-tag / lemmatize

-   use the WebLicht interface of exmaralda
-   get an API key, find the link via the menu dialogue
    -   you have to provide your institutional affiliation to get that
        key
    -   copy/paste the key into the field in the dialogue
-   choose the german or english pos-tagger/ morph tagger and the
    language of the speaker text
-   ** to preserve ERR tiers after postagging there has to be at least
    one entry in the tier, else empty tiers will be deleted in the
    process of tagging**

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_11a.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_11b.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_11c.png)

## 4.3 formulate the ZH

**follows**

# 5 how to anonymise/combine audios using audacity

#### 5.0.0.1 prerequisites

-   download and install [audacity](https://audacityteam.org)
-   if you will using headphones to listen, make sure to FIRST plug in
    the headphones and THEN start audacity. that will enable your core
    audio to use the headphones as standard output.

## 5.1 anonymise

-   first download audiofiles to anonymize from the HU box. folder: [SES
    audio
    cut/renamed](https://box.hu-berlin.de/smart-link/04099902-f842-4a14-985c-5e9ec29d917a/).
    note: the file will probably (depending on your operating system)
    pop up/open automatically in your default media player application
    after download. close that application.
-   in audacity import audio from downloads folder:
-   *[datei] \> \[öffnen\] \> datei in downloads auswählen \>
    \[öffnen\]*

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2020.47.01.png)

-   listen to the audio and find occurences of clear names
-   the example here shows the workflow for two instances
-   generally zoom in before *[play] *to be able to follow the moving
    cursor position.
-   if you want to stop playing, hit the [pause] button instead of the
    [stop] button. that will prevent the cursor from returning to
    0-position.

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2020.48.40.png)

-   e.g first instance at roughly `0:09`
-   ausschnitt vergröszern to specify location:
-   mark location with pointer (*click \> move right \> release click*)
-   *[ansicht] \> [zoom] \> [heranzoomen] \[cmd+8-1\]*

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2020.48.40.png)

<figure>
<img
src="https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2020.57.50.png"
alt="the white field shows the selected (markierte) range in the audio" />
<figcaption aria-hidden="true">the white field shows the selected
(markierte) range in the audio</figcaption>
</figure>

-   repeat/narrow mark location with pointer (*click \> move right \>
    release click*)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2020.58.25.png)

-   insert BEEP sound over location:
-   *[erzeugen] \> [klang]*

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2020.58.45.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2020.59.35.png)

-   change amplitude dB to `0,2`

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2020.59.51.png)

-   voila. first sinuscurve inserted.
-   repeat for every instance.
-   second instance at `11:53`
-   zoom in

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.03.20.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.03.32.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.03.42.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.11.51.png)

## 5.2 combine

-   how to copy content of 2nd & 3rd audio after end of 1st

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.14.12.png)

-   click into wave of 2nd audio
-   select complete wave:
-   *\[auswählen\] \> [alles] \[cmd-A\]*

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.14.26.png)

-   copy selected wave
-   *[bearbeiten] \> [kopieren] \[cmd-C\]*

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.14.42.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.15.08.png)

-   now change to wave of 1st audio

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.15.34.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.16.11.png)

-   hover cursor over end of the track
-   click. should appear one yellow line

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.16.43.png)

-   insert the audio you copied before:
-   *[bearbeiten] \> \[einfügen\] \[cmd-V\]*

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.17.30.png)

-   now second audio should appear after first audio.
-   repeat for every audio which is to be added (e.g. 3rd, 4th audio)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.18.41.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.18.54.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.19.07.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.19.22.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.20.19.png)

## 5.3 export mp3

-   select complete wave
-   eport audio to file:
-   *[datei]\>[exportieren]\>\[als mp3 exportieren\]*
-   choose filename (renamed kid!) according to scheme of anonymised &
    combined
-   choose *constant bitrate* for (export bitrate) at 128kbps (its more
    compressed then to lesser size)
-   upload to HU box anonymised, combined.

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.20.40.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.21.33.png)

# 6 SES Database

open the database *SES_database_by_tokens.xlsx* in excel or numbers (the
database is about 26MByte, on a Mac choose rather Excel, the processing
will be faster than in Numbers).  
in general you would prefer
e.g. [OpenRefine](https://openrefine.org/docs/manual/installing) instead
of excel or numbers for best working with the table.

to filter the table rows for specific tokens, speakers etc: - open
*Daten \> Filter* - click the dropdown arrow in the column you want to
filter in, e.g. p_speaker - deselect the „select all“ button (click on
it; by default its selected with a häkchen) - now there should be no
häkchen in any square/button - select e.g. the speaker you want to
filter for / häkchen setzen - apply filter - you can apply several
filters at once to limit concordance to language of interview or age or
whatever limitation you want - if you want to filter in the token
column, you can put in/search for a free text token and then select what
matches your search - if you want to turn filters off you have to be
again in the dropdown filter option of the column and remove the filter
there, \> *filter entfernen*

## 6.1 columns explained

| column           | explanation                                                                                                         | example                                                                                         |
|:-------------------|:-------------------------|:-------------------------|
| p_interview      | transcript                                                                                                          | GCA                                                                                             |
| p_speaker        | speaker                                                                                                             | #GCA                                                                                            |
| p_token          | token                                                                                                               | Mach                                                                                            |
| p_lemma_SkE      | sketch engine lemma                                                                                                 | machen-v                                                                                        |
| p_lemma          | only the lemma                                                                                                      | machen                                                                                          |
| p_turn           | turn, sentence                                                                                                      | #GCA : 43 Mach ich die Arbeit die Schule c_NPV .                                                |
| p_turn_preceding | the preceding turn                                                                                                  | #INT : 42 ( activities_after_school ) was machst du nach der Schule , wenn du nicht hier bist ? |
| p_transcriptLine | transcript line of the token                                                                                        | 43                                                                                              |
| m_feature_eval   | empty evaluation column for your researches. you can use this as a selector for finding by turning it TRUE or FALSE | FALSCH                                                                                          |
| m_free_col       | empty evaluation column for your researches. you can use this as a selector for finding by turning it TRUE or FALSE | 0                                                                                               |
| t_tag_SkE        | full german RFTag. the following columns seperate this tag into the single items                                    | VIMP.Full.2.Sg                                                                                  |
| t_PoS_ok         | selector to switch if the tag is correct                                                                            | 1                                                                                               |
| t_PoS            | PartOfSpeech                                                                                                        | VIMP                                                                                            |
| t_category       | NA                                                                                                                  | Full                                                                                            |
| t_funct          | NA                                                                                                                  | \-                                                                                              |
| t_case           | NA                                                                                                                  | \-                                                                                              |
| t_pers           | NA                                                                                                                  | 2                                                                                               |
| t_num            | NA                                                                                                                  | Sg                                                                                              |
| t_gender         | NA                                                                                                                  | \-                                                                                              |
| t_tense          | NA                                                                                                                  | \-                                                                                              |
| t_mode           | NA                                                                                                                  | \-                                                                                              |
| part_L1          | participant L1                                                                                                      | G                                                                                               |
| part_sex         | participant sex                                                                                                     | f                                                                                               |
| part_age         | participant age                                                                                                     | 8                                                                                               |
| part_CoB         | participant contry of birth                                                                                         | Greece                                                                                          |
| part_YiG         | participant years in germany                                                                                        | 0.5                                                                                             |
| part_YoSH        | particiant years of school in heritage country                                                                      | 0                                                                                               |
| part_LPM         | participant language proficiency mother                                                                             | kann deutsch                                                                                    |
| part_LPF         | participant language proficiency father                                                                             | kann deutsch                                                                                    |
| part_LUM         | participant language use mother                                                                                     | greek                                                                                           |
| part_LUF         | participant language use father                                                                                     | greek                                                                                           |
| part_LUS         | participant language use siblings                                                                                   | greek                                                                                           |
| part_LUFR        | participant language use friends                                                                                    | N.A.                                                                                            |
| c_NSM            | nonstandard semantics                                                                                               | 0                                                                                               |
| c_PAU            | pause                                                                                                               | 0                                                                                               |
| c_NPV            | nonstandard possessive                                                                                              | 1                                                                                               |
| c_NNS            | nonstandard not specified                                                                                           | 0                                                                                               |
| c_NPR            | nonstandard preposition                                                                                             | 0                                                                                               |
| c_NAG            | nonstandard agreement                                                                                               | 0                                                                                               |
| c_0MD            | zero modal                                                                                                          | 0                                                                                               |
| c_0SU            | zero subject                                                                                                        | 0                                                                                               |
| c_NWO            | nonstandard word order                                                                                              | 0                                                                                               |
| c_0OB            | zero object                                                                                                         | 0                                                                                               |
| c_0PR            | zero preposition                                                                                                    | 0                                                                                               |
| c_COM            | comment                                                                                                             | 0                                                                                               |
| c_NCM            | nonstandard comparison                                                                                              | 0                                                                                               |
| c_0AR            | zero article                                                                                                        | 0                                                                                               |
| c_NVP            | nonstandard VP                                                                                                      | 0                                                                                               |
| c_0VP            | zero VP                                                                                                             | 0                                                                                               |
| c_NGN            | nonstandard gender                                                                                                  | 0                                                                                               |
| c_0AU            | zero auxiliary                                                                                                      | 0                                                                                               |
| c_0CP            | zero copula                                                                                                         | 0                                                                                               |
| c_NEX            | nonstandard existential                                                                                             | 0                                                                                               |
| c_NRL            | nonstandard relative                                                                                                | 0                                                                                               |
| c_NAR            | nonstandard article                                                                                                 | 0                                                                                               |
| c_NMD            | nonstandard modal                                                                                                   | 0                                                                                               |
| c_0PT            | zero predicate                                                                                                      | 0                                                                                               |
| c_NPE            | nonstandard person                                                                                                  | 0                                                                                               |
| c_0RF            | zero reflexive                                                                                                      | 0                                                                                               |
| c_NIO            | nonstandard i.o.                                                                                                    | 0                                                                                               |
| c_NPS            | nonstandard person                                                                                                  | 0                                                                                               |
| c_0PN            | zero plural/numeral                                                                                                 | 0                                                                                               |
| c_NPO            | nonstandard pronoun                                                                                                 | 0                                                                                               |
| c_0RL            | zero relative                                                                                                       | 0                                                                                               |
| c_0EX            | zero existential                                                                                                    | 0                                                                                               |
| c_NNN            | nonstandard not specified                                                                                           | 0                                                                                               |
| c_NCP            | nonstandard copula                                                                                                  | 0                                                                                               |
| c_0RP            | zero reflexive pronoun                                                                                              | 0                                                                                               |
| c_0PD            | zero predicate                                                                                                      | 0                                                                                               |
| c_NVC            | nonstandard vocab                                                                                                   | 0                                                                                               |
| c_NEA            | nonstandard extra article                                                                                           | 0                                                                                               |
| c_NCN            | nonstandard conditional                                                                                             | 0                                                                                               |

## 6.2 summary

as you see in above table, theres a lot of possible filtering options
working with the SES database.  
you can do simple queries for token, lemma or PoS tag or refine your
query applying filters to metadata or coded features as well.

# 7 Sketch Engine

this is a short tutorial of how to import texts to [Sketch
Engine](https://auth.sketchengine.eu/#login) to create a corpus of your
own. you can then do researches in this corpus via the SketchEngine
exploration tools.

## 7.1 log in to Sketch Engine

open the Sketch Engine login page via:
<https://auth.sketchengine.eu/#login> and choose your affiliated
institution. you can also create your own account or log in via google.

<figure>
<img
src="https://ada-sub.dh-index.org/school/api/png/ses-overview/mdb-01-001.png"
alt="login13-1" />
<figcaption aria-hidden="true">login13-1</figcaption>
</figure>

<figure>
<img
src="https://ada-sub.dh-index.org/school/api/png/ses-overview/mdb-01-002.png"
alt="login13-2" />
<figcaption aria-hidden="true">login13-2</figcaption>
</figure>

## 7.2 create new corpus

1.  in the dashboard click \>manage corpus\<

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/mdb-01-003.png)

1.  select \>new corpus\<

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/mdb-01-004.png)

## 7.3 import texts

1.  give your corpus a name and provide a description. choose the
    language of your corpus:

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/mdb-01-005.png)

1.  import your texts. these can be single files of the supported format
    (.txt, .pdf. etc.) or a .zip file of these. if you want to import
    the SES transcripts, choose the
    `version without header for sketchengine` that you will find in the
    HU-BOX.

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/./mdb-01-006.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/./mdb-01-007.png)

1.  the upload takes some time. if the texts have been uploaded
    successfully, you see your upload summary and wordcount.

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/./mdb-01-008.png)

## 7.4 compile corpus

start the compilation of your corpus. this will tag the texts with
PartOfSpeech-tags and lemmatize the words. more information on the used
(for german) tagset you find
[here](https://www.sketchengine.eu/German-rftagger-part-of-speech-tagset/).

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/mdb-01-009.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/mdb-01-010.png)

your corpus is now ready to be explored. find all information to the
query language and further guides in the [Sketch Engine
Help](https://www.sketchengine.eu/German-rftagger-part-of-speech-tagset/)

# 8 ANNIS framework

find your way through: <https://corpus-tools.org/annis/>, install ANNIS
on your system and try to import the zipped ANNIS SES corpus you find in
the HU-box. \> folder: `sketch engine Work`, namescheme of latest zip:
`[datestamp]_SES_annis_tagged_corpus.zip `

## 8.1 SES sample procedure to create ANNIS corpus

**the following is just for documentation of the process; you wont have
to follow these steps, just follow above instructions to install ANNIS
on your system and import the zipped corpus.** - upload files in HU box
folder `version without header for SketchEngine upload` to SketchEngine
\> *create new corpus* - *expert compiler settings* \> adapt `docscheme`
to \> `sesCPT` - with that done you can already explore the SES corpus
in the SketchEngine GUI using the built in CQL (corpus query language)
commands. - download corpus (vertical) - corpus is now a database of
token, PoS, lemma; tagged according to the *GermanRF tagset*[1] used by
SketchEngine - process database in:
[conc-essai.R](https://github.com/esteeschwarz/HU-LX/blob/main/scripts/conc_essai.R) -
splits PoS tag (scheme: `x.x.x.x.x`) into seperate columns defining
classes of PoS tags - writes single .xlsx files for each kid into
folder - ANNIS preprocessing: -
[pepper](https://corpus-tools.org/pepper/): `xls > treetagger format`
from .xlsx files folder. [parameter
file](https://github.com/esteeschwarz/HU-LX/blob/main/scripts/r-conxl1.pepper) -
pepper: `treetagger > annis graph format` from treetagger files folder.
[parameter
file](https://github.com/esteeschwarz/HU-LX/blob/main/scripts/r-conxl2.pepper) -
zip annis graph files - upload annis.zip to ANNIS localhost server

## 8.2 ANNIS ready to use installation:

please find here: [link follows]() an ANNIS server installation with the
SES corpus ready to use. (! 20230904: the link is not yet freely
available, use the link shared in moodle if you dont want to use your
own local installation !)

# 9 BERLANGDEV

this part will include workflow description of how to upload content to
BERLANGDEV and edit metadata.

## 9.1 short overview of basic workflow:

-   login to
    [BERLANGDEV](https://rs.cms.hu-berlin.de/berlangdev/pages/collection_manage.php)
-   click \<upload\>
-   upload dialogue opens.

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/berlang_res_type.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/berlang_res_coll.png)

-   you can skip everything except:
    -   top \> ressourcentyp: choose type of ressource to upload
    -   bottom \> zur kollektion hinzufügen: choose collection to which
        to upload resource
    -   you can upload several resources at once and edit metadata
        afterwards
-   when the resource appears in the collection view, click on it (opens
    it)
-   go to \<edit metadata/metadaten bearbeiten\>

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/berlang_ed_meta.png)

-   add ID of related resource to insert metadata (e.g. any ID of
    another resource of the same kid)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/berlang_copy_meta.png)

-   IMPORTANT: make sure to edit the metadata (which contains now just a
    copy of the other resource from where you copied it) and adapt it to
    your resource. theres few entries which you will have to change tout
    cas:

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/berlang_res_name.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/berlang_res_filename.png)

-   check for: interview language, which my differ depending from which
    resource you copied the metadata.
-   make sure filename points to your resource and name depicts the
    correct resource in the overview.
-   if you had uploaded several trials of the same resource which will
    have lead to an automatically generated number at the end of the
    description, please remove any earlier of your upload trials and
    change the displayname of the final resource according to the
    scheme, without any trailing numbers or additions may derive from
    your computers filesystem.
-   finally: connect all related resource, i.e. add all resource IDs of
    the same kid into the bottom field \<verwandte resourcen\>

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/berlang_rel_res.png)

# 10 SES: BERLANGDEV media status

|  id | child | CHAT | sanscodes | pdf | audio |
|----:|:------|-----:|----------:|----:|------:|
|   1 | GCA   |    1 |         1 |   1 |     1 |
|   2 | GCB   |    1 |         1 |   1 |     1 |
|   3 | GCC   |    1 |         1 |   1 |     1 |
|   4 | GCD   |    1 |         1 |   1 |     1 |
|   5 | GCE   |    1 |         1 |   1 |     1 |
|   6 | GCF   |    1 |         1 |   1 |     1 |
|   7 | GCG   |    1 |         1 |   1 |     1 |
|   8 | GDA   |    1 |         1 |   1 |     1 |
|   9 | GDB   |    1 |         1 |   1 |     0 |
|  10 | GDC   |    1 |         1 |   1 |     1 |
|  11 | GDD   |    1 |         1 |   1 |     1 |
|  12 | GDE   |    1 |         1 |   1 |     0 |
|  13 | GDF   |    1 |         1 |   1 |     1 |
|  14 | TAA   |    1 |         1 |   1 |     1 |
|  15 | TAB   |    1 |         1 |   1 |     0 |
|  16 | TAC   |    1 |         1 |   1 |     0 |
|  17 | TAD   |    1 |         1 |   1 |     1 |
|  18 | TAE   |    1 |         1 |   1 |     1 |
|  19 | TAF   |    1 |         1 |   1 |     1 |
|  20 | TAG   |    1 |         1 |   1 |     1 |
|  21 | TAH   |    1 |         1 |   1 |     1 |
|  22 | TAI   |    1 |         1 |   1 |     1 |
|  23 | TBB   |    1 |         1 |   1 |     1 |
|  24 | TBC   |    1 |         1 |   1 |     1 |
|  25 | TBD   |    1 |         1 |   1 |     1 |
|  26 | TBE   |    1 |         1 |   1 |     1 |
|  27 | TBF   |    1 |         1 |   1 |     1 |
|  28 | TBG   |    1 |         1 |   1 |     1 |
|  29 | TBH   |    1 |         1 |   1 |     1 |
|  30 | TBI   |    1 |         1 |   1 |     1 |
|  31 | TBK   |    1 |         1 |   1 |     1 |
|  32 | TBL   |    1 |         1 |   1 |     1 |
|  33 | TBM   |    1 |         1 |   1 |     1 |
|  34 | TBN   |    1 |         1 |   1 |     1 |
|  35 | TBO   |    1 |         1 |   1 |     1 |
|  36 | TBP   |    1 |         1 |   1 |     1 |
|  37 | TBQ   |    1 |         1 |   1 |     1 |
|  38 | TBR   |    1 |         1 |   1 |     1 |
|  39 | TBS   |    1 |         1 |   1 |     1 |
|  40 | TBT   |    1 |         1 |   1 |     1 |
|  41 | TBU   |    1 |         1 |   1 |     1 |
|  42 | TBV   |    1 |         1 |   1 |     1 |

# 11 SES class findings

brief overview of student findings exploring the corpus

## 11.1 class findings

| Student            | Child.Code | Age | Prepositions                                                                | Articles | Conjunctions | Paraphrase.with.verb | Hesitation.phenomena..Pauses..repeated.articles                           |
|:--------|:--------|:--------|:--------|:--------|:--------|:--------|:--------|
| Griechische Kinder | NA         | NA  | NA                                                                          | NA       | NA           | NA                   | NA                                                                        |
| Laura              | GCC        | 9   | auf: 3, an: 1, in: 7, nach: 1, zu: 7 - zun: 1, hinter:0, neben:0, vor:1     | NA       | NA           | NA                   | Viele Pausen, häufiges Zögern                                             |
| NA                 | GDC        | 8   | auf: 12, an:1, in 19 anstatt <im:1>, nach:5, zu:1, hinter:0, neben:0, vor:1 | NA       | NA           | NA                   | viele Pausen                                                              |
| NA                 | GCG        | 9   | NA                                                                          | NA       | NA           | NA                   | überlegt oft kurz, wenn sie nicht genau weiß, was sie zunächst sagen wird |
| NA                 | GDD        | 9   | NA                                                                          | NA       | NA           | NA                   | NA                                                                        |
| Türkische Kinder   | NA         | NA  | NA                                                                          | NA       | NA           | NA                   | NA                                                                        |
| Laura              | TAC        | 12  | auf: 16, an: 2, in: 6, nach: 4, zu: 7, hinter: 0, neben: 2, vor: 1          | NA       | NA           | NA                   | wenig Pausen oder Zögern                                                  |
| NA                 | TBF        | 12  | NA                                                                          | NA       | NA           | NA                   | NA                                                                        |
| NA                 | TAI        | 13  | auf: 8, an: 1, in: 12, nach: 5, zu: 3, hinter: 1, neben: 3, vor: 1          | NA       | NA           | NA                   | Viele Pausen, häufiges Zögern                                             |
| NA                 | TBB        | 14  | NA                                                                          | NA       | NA           | NA                   | NA                                                                        |

## 11.2 class findings

| Student            | Child.Code | Age | Prepositions | Noticing                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Self.correction..content.or.form.                                                                                                                                                                                                                                                                                                                             | Interviewer                                                                                                                                                                                                                                                                                                                                                                                                                                                | More.information                   |
|:--------|:--------|:--------|:--------|:--------|:--------|:--------|:--------|
| Griechische Kinder | NA         | NA  | NA           | NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | NA                                                                                                                                                                                                                                                                                                                                                            | NA                                                                                                                                                                                                                                                                                                                                                                                                                                                         | NA                                 |
| Katharina          | GDA        | 11  | NA           | 0016 bis 0022 (answers INT not transcripted)//GDA: Hier, das Maedchen und ein Jung basteln einen Schneemann. Das Maedchen macht ein Mohrruebe fuer Nase. Und hier gibt sie…@ ’ne…@ ’ne Stock 90 obj i.o.. //INT: was ist das? //GDA: Das hier? hm //INT: was macht man damit? //GDA: Machen sauber. //INT: Genau, n Besen./\[später:\] und nicht den Besen/–\>Bedeutungsverhandlung: gemeinsam Semantik umschreiben und erfassen; dann Vorschlag, der aufgegriffen wird/ | 0194 [Drachen] wenn es ganz gut Luft ist, Luft gib’s, dann… /0237 Hier fragt ein Frau…@ den Schna- Schaffner wo geht da, der Zug                                                                                                                                                                                                                            | lacht viel, macht Späße, fragt freundlich nach, stimmt, genau/Recasts/0096 (answer not transcripted) Er faellt sich um. Hmh, fällt runter. (Übergeneralisierung reflexive Verben)/0104 (answer not transcripted) \[der Junge\] fangt. Ja, fängt. /0181 (answer not transcripted) Soll ich sagen, wohin sie gehört? Ja, dann ist da noch irgendwas, was dazu gehört./0182 (answer not transcripted) Hier sind so Kristall. Eis. Ja genau, Eis. Eiskristalle | NA                                 |
| Türkische Kinder   | NA         | NA  | NA           | NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | NA                                                                                                                                                                                                                                                                                                                                                            | NA                                                                                                                                                                                                                                                                                                                                                                                                                                                         | NA                                 |
| Katharina          | TAF        | 13  | NA           | Zeile 0059 (Chat file) Kopf/–\> Noticing, Pause + direkter Vorschlag – lernt direkt etwas neues/0091 (Chat) Besen/–\> Vorschlag, der direkt übernommen wird./0103 0104 (Chat) Mohrrübe/                                                                                                                                                                                                                                                                                  | Sie setzt sich im einen Wagen und der Maedchen zieht sie- zieht er. (0068)/Ja, wenn du kein Fahrer- Fahrkarte hast, dann musst du wieder aussteigen. (0163)/weil, er traegt viel schwerer und er traegt (…) langs- ne bisschen leichter (0131) /da finden die- da find der Junge sein Vater und Mutter (0179)/–\> Umstrukturierung Syntax auch für L1 typisch | Interviewer sagt v.a. ok, gut, hmh, prima, alles ist erlaubt, lacht, ermutigt bei langen Pausen, weiterzumachen//Nachfrage Zeile 0038 (Chat) Irrenhaus//Recast 0146 (answer from INT not transcipted)//der Apfel gehoert die Aepfeln. Und warum gehören die beiden zusammen?                                                                                                                                                                               | Viele und lange, ungefüllte Pausen |
| NA                 | TBV        | 14  | NA           | NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | NA                                                                                                                                                                                                                                                                                                                                                            | NA                                                                                                                                                                                                                                                                                                                                                                                                                                                         | NA                                 |
| NA                 | TBE        | 13  | NA           | NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | NA                                                                                                                                                                                                                                                                                                                                                            | NA                                                                                                                                                                                                                                                                                                                                                                                                                                                         | NA                                 |
| NA                 | TBF        | 12  | NA           | NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | NA                                                                                                                                                                                                                                                                                                                                                            | NA                                                                                                                                                                                                                                                                                                                                                                                                                                                         | NA                                 |
| NA                 | TBM        | 13  | NA           | NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | NA                                                                                                                                                                                                                                                                                                                                                            | NA                                                                                                                                                                                                                                                                                                                                                                                                                                                         | NA                                 |
| NA                 | TBN        | 14  | NA           | NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | NA                                                                                                                                                                                                                                                                                                                                                            | NA                                                                                                                                                                                                                                                                                                                                                                                                                                                         | NA                                 |

## 11.3 class findings

| Student            | Child.Code | Age | Prepositions                                                                          | Articles                                               | Conjunctions                        | Hesitation.phenomena..Pauses..repeated.articles | Self.correction..content.or.form.                      |
|:--------|:--------|:--------|:--------|:--------|:--------|:--------|:--------|
| Griechische Kinder | NA         | NA  | NA                                                                                    | NA                                                     | NA                                  | NA                                              | NA                                                     |
| Miriam             | GCA        | 8   | auf: 3/an: 1 -\> am: 1/in: 31/nach: 4/zu: 3/hinter: 1/neben:/vor: 0                   | Reduced forms ///n: 1 -\> ein/einen                    | und: 95/dann: 11/danach: 0/weil: 1  | Viele Pausen, häufiges Zögern                   | Wenig Selbstkorrekturen                                |
| NA                 | GCE        | 11  | auf: 0/an: 0/in: 0/nach: 0/zu: 0/hinter: 0/neben: 0/vor: 0                            | Reduced forms ///                                      | und: 180/dann: 25/danach: 2/weil: 3 | Wenig Pausen oder Zögern                        | Mehr Selbstkorrekturen                                 |
| NA                 | GDE        | 10  | auf: 31/an: 0/in: 49 -\> inzu: 1/nach: 5/zu: 26 -\> inzu: 1/hinter: 3/neben: 2/vor: 3 | Reduced forms ///n: 4 -\> ein/einen//ne: 5 -\> eine//s | und: 57/dann: 13/danach: 1/weil: 9  | Seit 10 Jahren in Deutschland/Keine Audio-Datei | NA                                                     |
| NA                 | GDF        | 11  | auf: 10/an: 0/in: 25/nach: 6/zu: 15/hinter: 2/neben: 2/vor: 2                         | Reduced forms /                                        | Und/Und dann/danach/weil            | Wenig Pausen oder Zögern                        | Bewusste Selbstkorrekturen                             |
| Türkische Kinder   | NA         | NA  | NA                                                                                    | NA                                                     | NA                                  | NA                                              | NA                                                     |
| Miriam             | TAA        | 13  | auf: 16/an: 2/in: 6/nach: 4/zu: 7/hinter: 0/neben: 2/vor: 1                           | Reduced forms /                                        | Und/Und dann/danach/weil            | Wenig Pausen oder Zögern                        | Inhaltliche Selbstkorrekturen, weniger grammatikalisch |
| NA                 | TAD        | 14  | auf: 2 -\> aufm: 1/an: 0/in: 5 -\> inne: 1/nach: 2/zu: 6/hinter: 1/neben: 2/vor: 0    | Reduced forms /                                        | Und/Und dann/danach/weil            | Viele Pausen, häufiges Zögern                   | Wenig Selbstkorrekturen                                |
| NA                 | TBC        | 14  | auf: 14/an: 6/in: 9/nach: 2/zu: 16/hinter: 3 -\> hinterher: 1/neben: 4/vor: 0         | Reduced forms /                                        | Und/Und dann/danach/weil            | Viele Pausen, häufiges Zögern                   | Wenig Selbstkorrekturen                                |
| NA                 | TBD        | 13  | auf: 14/an: 0/in: 18/nach: 6/zu: 7/hinter: 0/neben: 1 -\> daneben: 1/vor: 2           | Reduced forms /                                        | Und/Und dann/danach/weil            | Wenig Pausen oder Zögern                        | Wenig Selbstkorrekturen                                |
| Carol              | test-ok    | NA  | NA                                                                                    | NA                                                     | NA                                  | NA                                              | NA                                                     |

## 11.4 principle of accountability [2]

roughly: the number of occurences of one (coded nonstandard) feature
over the number of total instances of the feature (including standard +
nonstandard realisations). e.g.:

| token  | instances | standard       | nonstandard                | normalised             |
|------|---------|-------------|-----------------------|-----------------------|
| schnee | 54        | 33             | 21                         | 38.8888889             |
|        |           |                |                            |                        |
|        | all       | coded “FALSCH” | coded “1” (feature = TRUE) | percent (D2/B2\\\\100) |

workflow:

<figure>
<img
src="https://ada-sub.dh-index.org/school/api/png/ses-overview/sesdb004-INT.png"
alt="filter out #INT speaker" />
<figcaption aria-hidden="true">filter out #INT speaker</figcaption>
</figure>

<figure>
<img
src="https://ada-sub.dh-index.org/school/api/png/ses-overview/sesdb004-schnee.png"
alt="filter after token schnee" />
<figcaption aria-hidden="true">filter after token schnee</figcaption>
</figure>

<figure>
<img
src="https://ada-sub.dh-index.org/school/api/png/ses-overview/sesdb004-schnee2.png"
alt="analyse turn (manually)" />
<figcaption aria-hidden="true">analyse turn (manually)</figcaption>
</figure>

<figure>
<img
src="https://ada-sub.dh-index.org/school/api/png/ses-overview/sesdb004-schnee3.png"
alt="set evaluation column to 1=TRUE if nonstandard occurence (context)" />
<figcaption aria-hidden="true">set evaluation column to 1=TRUE if
nonstandard occurence (context)</figcaption>
</figure>

1.  filter out #INT speaker
2.  filter after token [schnee]
3.  analyse turn and define wether standard or nonstandard feature
4.  set evaluation column to 1=TRUE for nonstandard occurences
5.  sum up number of total instances
6.  sum up number of positives (nonstandard realisation)
7.  compute number of negatives (standard)
8.  compute percentage

## 11.5 SES distribution analysis

the following is the output table of the multivariate analysis of a
frequency table of all feature codes over all target childs.  
the frequency table was exported from an ANNIS installation of the SES
corpus. the query for getting the proper results is:  
`codetag = /c_.*/ & int = /T.*|G.*/ & #1 . #2` this outputs all occuring
codes over the transcripts and associates them to the speaker, either
T=any turkish or G=any greek. with that you get a frequency table
looking like this (exerpt):

| featurecode | child | count |
|-------------|-------|-------|
| NPR         | GCA   | 16    |
| COM         | TBR   | 16    |
| COM         | TAA   | 15    |
| 0AR         | TBL   | 14    |
| NPR         | TBT   | 14    |
| 0AR         | GCB   | 14    |
| COM         | TBL   | 14    |
| 0AR         | GDA   | 13    |
| COM         | TBM   | 13    |
| NNS         | TBQ   | 13    |
| 0AR         | TBS   | 13    |
| COM         | GCA   | 13    |
| NPR         | TBU   | 12    |
| NPR         | GCC   | 12    |
| 0AR         | TBT   | 12    |
| COM         | TBU   | 12    |
| 0AR         | TBU   | 11    |
| NNS         | GCB   | 11    |

visualised:
![](https://ada-sub.dh-index.org/school/api/png/ses-overview/coded%20features%20over%20corpus.png)

![](https://ada-sub.dh-index.org/school/api/png/ses-overview/coded%20features%20over%20kids.png)

### 11.5.1 small significance testing:

script source:
<https://github.com/esteeschwarz/HU-LX/blob/main/scripts/distribution-analysis.R>

the applied lmer (linear mixed effects regression model) [3] formula
is:  
`count ~ feature + (1 | L1)`  
in words: *we posited a main effect of feature and random effects of
L1*. with this assumption a significance of `p < 0.05` was tested at 0AR
(zero article), i.e. the coding of this feature (here) depends
significant on the L1 use of the target child. **IMPORTANT:** this does
not allow general statements about the relation of 0AR feature and L1
since the transcript corpus was not coded/annotated until every instance
of each feature.

### 11.5.2 lmer coefficients

|             |          |            |     |         |                          |     |     |
|----------|-------|---------|----|-------|-------------------------------|:---|:---|
|             | Estimate | Std. Error | df  | t value | Pr ( \\\\\\\\\\\\\\\\ t) |     |     |
| feature0AR  | 5,324    | 2,778      | 333 | 1,916   | 0,056                    |     |     |
| featureNPR  | 4,286    | 2,786      | 333 | 1,538   | 0,125                    |     |     |
| featureNAG  | 3,353    | 2,817      | 333 | 1,19    | 0,235                    |     |     |
| featureNNS  | 2,8      | 2,792      | 333 | 1,003   | 0,317                    |     |     |
| feature0SU  | 2,571    | 2,777      | 333 | 0,926   | 0,355                    |     |     |
| featureNGN  | 1,893    | 2,786      | 333 | 0,679   | 0,497                    |     |     |
| featureNPE  | 2        | 2,957      | 333 | 0,676   | 0,499                    |     |     |
| feature0PR  | 1,682    | 2,799      | 333 | 0,601   | 0,548                    |     |     |
| feature0OB  | 1,261    | 2,797      | 333 | 0,451   | 0,652                    |     |     |
| featureNSM  | 1,167    | 2,794      | 333 | 0,418   | 0,677                    |     |     |
| featureNWO  | 1,067    | 2,828      | 333 | 0,377   | 0,706                    |     |     |
| (Intercept) | 1        | 2,738      | 333 | 0,365   | 0,715                    |     |     |
| feature0EX  | 1        | 3,353      | 333 | 0,298   | 0,766                    |     |     |
| feature0MD  | 1        | 3,872      | 333 | 0,258   | 0,796                    |     |     |
| featureNPO  | 1        | 3,872      | 333 | 0,258   | 0,796                    |     |     |
| featureNVP  | 0,667    | 2,957      | 333 | 0,225   | 0,822                    |     |     |
| featureNEX  | 0,6      | 2,999      | 333 | 0,2     | 0,842                    |     |     |
| feature0RF  | 0,5      | 3,353      | 333 | 0,149   | 0,882                    |     |     |
| featureNCM  | 0,429    | 2,927      | 333 | 0,146   | 0,884                    |     |     |
| feature0CP  | 0,375    | 2,822      | 333 | 0,133   | 0,894                    |     |     |
| feature0AU  | 0,333    | 2,957      | 333 | 0,113   | 0,91                     |     |     |
| feature0VP  | 0,308    | 2,841      | 333 | 0,108   | 0,914                    |     |     |
| featureNRL  | 0,267    | 2,828      | 333 | 0,094   | 0,925                    |     |     |
| featureNPV  | 0,091    | 2,86       | 333 | 0,032   | 0,975                    |     |     |
| feature0AP  | 0        | 3,872      | 333 | 0       | 1                        |     |     |
| feature0EL  | 0        | 3,872      | 333 | 0       | 1                        |     |     |
| feature0PD  | 0        | 3,872      | 333 | 0       | 1                        |     |     |
| feature0PN  | 0        | 3,061      | 333 | 0       | 1                        |     |     |
| feature0PT  | 0        | 3,872      | 333 | 0       | 1                        |     |     |
| feature0RL  | 0        | 3,872      | 333 | 0       | 1                        |     |     |
| feature0RP  | 0        | 3,872      | 333 | 0       | 1                        |     |     |
| featureNAR  | 0        | 2,927      | 333 | 0       | 1                        |     |     |
| featureNAU  | 0        | 3,872      | 333 | 0       | 1                        |     |     |
| featureNCA  | 0        | 3,872      | 333 | 0       | 1                        |     |     |
| featureNCJ  | 0        | 3,872      | 333 | 0       | 1                        |     |     |
| featureNCN  | 0        | 3,872      | 333 | 0       | 1                        |     |     |
| featureNCP  | 0        | 3,872      | 333 | 0       | 1                        |     |     |
| featureNEA  | 0        | 3,872      | 333 | 0       | 1                        |     |     |
| featureNIO  | 0        | 3,872      | 333 | 0       | 1                        |     |     |
| featureNMD  | 0        | 3,872      | 333 | 0       | 1                        |     |     |
| featureNNN  | 0        | 3,872      | 333 | 0       | 1                        |     |     |
| featureNPN  | 0        | 3,872      | 333 | 0       | 1                        |     |     |
| featureNPS  | 0        | 2,957      | 333 | 0       | 1                        |     |     |
| featureNVC  | 0        | 3,872      | 333 | 0       | 1                        |     |     |

# 12 GLOSSARY/ANNEX: on a funny note

## 12.1 to avoid further confusion

some explanation to terms used maybe outdated and other stuff useful to
know:

| term used                      | german                                | english                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|-----|------|--------------------------------------------------------------|
| leerzeichen, space, spacebar   | whitespace                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| return, enter, CR              | senden, bestätigen, ausführen, zurück |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| CMD, command                   | apple: befehlstaste                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| CTRL, control, steuerung, STRG | apple: steuerungstaste                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| ALT                            | apple: wahltaste                      | apple: option                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| SHIFT                          | apple: umschalten wtf.                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| backspace                      | ?                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| delete                         | ?                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| extension                      |                                       | the part of the filename after the dot (.) which enables your operating system to recognize the fileformat and choose the appropriate application to open the file with. e.g.: .mp3 for music, .jpg for pictures, .txt for plaint text files, .docx for word documents. (the extension doesnt really matter, you can open any file from within any application as well with the \\open\\ dialogue of the application, but to enable opening a file by just clicking at it, it has to have an extension to signal the system which app to choose. |
| segmentation                   |                                       | in the partitur editor you can segment a transcript/text into several parts. the decision of what is part of a segment depends on the questions you have to the text or how you want to annotate it. segmentation per token allows for token limited annotation, segmentation per clause or sentence for wider range annotation. a segment has to be finished with a whitespace, i.e. the last character of a segment has to be a leerzeichen/whitespace/empty character.                                                                        |
| regex, regular expressions     | reguläre ausdrücke                    | [info](https://ahkde.github.io/docs/v1/misc/RegEx-QuickRef.htm) / [learn/try out regular expressions](https://regexr.com)                                                                                                                                                                                                                                                                                                                                                                                                                        |

to dive deeper into the sujet:
<https://de.wikipedia.org/wiki/Tastenkombination>

[1] <https://www.sketchengine.eu/German-rftagger-part-of-speech-tagset/>

[2] Labov, William. Sociolinguistic Patterns / William Labov. 1. publ.
Oxford: Blackwell, 1972. Print.

[3] Bates u. a., „Fitting Linear Mixed-Effects Models Using lme4“. 2015.
[doi: 10.18637/jss.v067.i25-01](10.18637/jss.v067.i01)
