##### 12227.archiving multilingual corpora
###### 20220603 / stephan schwarz
#### join multiple audio files in audacity
hhh
### general:
- many of the EKMAUS audio files are physically present on different tape sources (now .mp3) which mostly differ also in quality
- task is to find the appropriate .mp3s and combine them (join the audio) into one audio file
- box.HU folder with audio files: [link](https://box.hu-berlin.de/smart-link/2bb3b244-c477-4112-b8f4-93a9f82d6437/)
hhh
### tech:
- i recommend AUDACITY, a simple yet powerful audiobearbeitungssoftware
- download audacity here: [link](https://www.audacityteam.org/download/)
- for step by step you can follow the (following) instructions or watch this short video i improvised: [link](https://box.hu-berlin.de/smart-link/e597e506-9671-471d-a839-4680151490f6/)
hhh
### step by step:
#### 1:
- download the audiofiles you want to work on in above box.HU folder
- maybe create a HU-multiLX folder on your system where you store them
- open audacity
vvv
### step by step:
#### 2:
- choose [open] from the [file] menu (datei/öffnen)
- select the .mp3s from your filesystem
- the programm should now show an import progress bar and after that
	- have created waveline views of the files
vvv
### step by step:
#### 3:
- listen to the audios you imported and compare different versions with resp. to audioquality
- you will mostly find 2 versions of the same interview cut in 2 tapes, making 4 files named like that:
- listen to the end and the beginning of the audio and try to match what you hear with the transcript
- the first part of the interview should contain the interviewer asking for the childs name, this passage you find in the beginning of the transcript
	- then naturally the other part (file) should be the second part and (step follows) be joined at the end of the first part
		- if youre able to understand turkish, try to find the passage you hear at the beginning of this (2nd) part in the transcript and check if its (the 2nd audio) the continuation of the 1st part
vvv
### step by step:
#### 4:
- now after you find what is first part and what is second of the files with the better quality:
- click into the wave of the 2nd part
- choose: [alles markieren] from the [bearbeiten] menu
- now the complete waveline shoud appear blue
- choose [copy] (STRG-C) from the [bearbeiten] menu
- now the complete waveline is in your clipboard
vvv
### step by step:
#### 5:
- now activate the 1st part of the audio window
- scroll the window to the end of the wave
- hover the pointer over the end og the wave
- the pointer should somehow (einrasten) and show a vertical line at the end of the wave
- this says that you actual position is now the end of the 1st audio wave
- click there
- and paste (STRG-V) (einfügen) the clipboard (your copied 1st audio wave) on that position
- now the waveline contains both waves, the 1st and the 2nd part waveline after that
vvv
### step by step:
#### 6:
- now you have one wave containing the complete interview
- manoeuvre to the position where the 2nd part begins and check if there is any longer gap between the parts
- if necessary, delete the gap
	- you can zoom into the view by: STRG-3 and zoom out by STRG-1 (or vcvs)
vvv
### step by step:
#### 7:
- export the audio to new file:
- choose [file/export audio]
- select format mp3
- select 128Kb/s, constant bitrate
- name the file according to the namescheme and save in your HU-LX folder
- in the tagset make a comment in the comment row, where you note e.g.: "joined [your name maybe] from tapes [the names of the original 2 audiofiles you combined]"
- you should now have a new .mp3 audio in your folder 
- voila.
hhh
fin