## transcription: from scratch in template
note: this method is demanding fewer technical skills, but takes longer to transcribe = type the text. if you decide to do use a more technical demanding method, which allows for easy and fast transkription, skip to [section 2.3-2][3-1].   
### preliminary
- open the original .pdf you want to transcribe and the partitur editor. best is to have a parallel view of the .pdf and the partitur in horizontal split
- open the template \<LLDM\_exmaralda\_basictemplate.exb\> which you download from the HU box or [here][3-2]. 
- in this template you have already the necessary tiers for the transkription and annotation created. (without content)
### speakertable
- edit the speakertable to relabel the tiers:

![][image-3-1]

![][image-3-2]

- here you insert the speaker abbreviation as label from the .pdf (e.g. MIM), the language used in the transcript and the L1/L2 if named in the questionaire.
- then fill in the values of the template attributes for the speaker with the corresponding values of the transcript (from the questionaire)
	- left is the attribute name, right the value which is to adapt
### metadata
- edit the transcript metadata:

![][image-3-3]

![][image-3-4]

- like above fill in the values of the template attributes for the metadata with the corresponding values of the transcript (from the questionaire)
	- left is the attribute name, right the value which is to adapt

### transcribe the text from the .pdf:
- click into a segment
- type the text
	- at the end of one unit (which is still to define: either sentence, word or syntactic unit) insert a \<space:leerzeichen:whitespace\> to signal the chat processor, that this is a segment. when you done with one segment and the end of available empty segments of the transcription tier is reached, one new segment is opened when you hit \<return:enter\> and you can type in the next unit.
	- precisely: for text tokenised per word the steps will be:
		- type word  \> type whitespace \> hit return
			- note: in each after these steps automatically opened new segment you have to type the first character twice, since the input is possible only when you started typing. you will see what is meant by trying...
		- repeat for every word (AND punctuation mark!)

![][image-3-5]

if you need to insert an empty segment in the middle of the transcript (because you forgot to transcribe a word e.g.) you can split an event which creates an empty segment.

![][image-3-6]

![][image-3-7]

you can also write the whole sentence into on segment an then split like above the segments where you want by positioning your cursor at the right position. the new segment will be created exactly where your cursor is, that would be after the whitespace between 2 words if you place it there. if there was a word after the whitespace, then that would be the content of the next segment (including every word which followed, you have to repeat the step for each word in the sentence.)  
the reverse operation (combining segments) is also possible; mark the segments you want to combine (like cells in an excel table, not with SHIFT-hold, but by moving over them mouse-clicked) and choose \<event:merge\>.

- save your transcription, it will be saved as .exb

[3-1]:	be1_exmaralda-022.md
[3-2]:	https://github.com/esteeschwarz/HU-LX/blob/main/trans/LLDM_exmaralda_basictemplate.exb

[image-3-1]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_1.png
[image-3-2]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_7d.png
[image-3-3]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_7a.png
[image-3-4]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_7d.png
[image-3-5]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_4.png
[image-3-6]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_4bb.png
[image-3-7]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/exm_2_4cc.png
