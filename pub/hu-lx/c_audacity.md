# how to anonymise/combine audios using audacity
#### prerequisites
- download and install [audacity][1]
- if you will using headphones to listen, make sure to FIRST plug in the headphones and THEN start audacity. that will enable your core audio to use the headphones as standard output.

## anonymise
- first download audiofiles to anonymize from the HU box. folder: [SES audio cut/renamed][2]. note: the file will probably (depending on your operating system) pop up/open automatically in your default media player application after download. close that application.
- in audacity import audio from downloads folder:
- *[datei] \> [öffnen] \> datei in downloads auswählen \> [öffnen]*

![][image-1]

- listen to the audio and find occurences of clear names
- the example here shows the workflow for two instances
- generally zoom in before *[play] *to be able to follow the moving cursor position. 
- if you want to stop playing, hit the [pause] button instead of the [stop] button. that will prevent the cursor from returning to 0-position.

![][image-2]

- e.g first instance at roughly  `0:09`
- ausschnitt vergröszern to specify location:
- mark location with pointer (*click \> move right \> release click*)
- *[ansicht] \> [zoom] \> [heranzoomen] [cmd+1]*

![][image-3]

![the white field shows the selected (markierte) range in the audio][image-4]

- repeat/narrow mark location with pointer (*click \> move right \> release click*)

![][image-5]

- insert BEEP sound over location:
- *[erzeugen] \> [klang]*

![][image-6]

![][image-7]

- change amplitude dB to `0,2`

![][image-8]

- voila. first sinuscurve inserted.
- repeat for every instance.
- second instance at `11:53`
- zoom in

![][image-9]

![][image-10]

![][image-11]

![][image-12]

## combine
- how to copy content of 2nd & 3rd audio after end of 1st

![][image-13]

- click into wave of 2nd audio
- select complete wave:
- *[auswählen] \> [alles] [cmd-A]*

![][image-14]

- copy selected wave
- *[bearbeiten] \> [kopieren] [cmd-C]*

![][image-15]

![][image-16]

- now change to wave of 1st audio

![][image-17]

![][image-18]

- hover cursor over end of the track
- click. should appear one yellow line

![][image-19]

- insert the audio you copied before:
- *[bearbeiten] \> [einfügen] [cmd-V]*

![][image-20]

- now second audio should appear after first audio.
- repeat for every audio which is to be added (e.g. 3rd, 4th audio)

![][image-21]

![][image-22]

![][image-23]

![][image-24]

![][image-25]

## export mp3
- select complete wave
- eport audio to file:
- *[datei]\>[exportieren]\>[als mp3 exportieren]*
- choose filename (renamed kid!) according to scheme of anonymised & combined
- choose *constant bitrate* for (export bitrate) at 128kbps (its more compressed then to lesser size)
- upload to HU box anonymised, combined.

![][image-26]

![][image-27]

[1]:	https://audacityteam.org
[2]:	https://box.hu-berlin.de/smart-link/04099902-f842-4a14-985c-5e9ec29d917a/

[image-1]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2020.47.01.png
[image-2]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2020.48.40.png
[image-3]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2020.48.40.png
[image-4]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2020.57.50.png
[image-5]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2020.58.25.png
[image-6]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2020.58.45.png
[image-7]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2020.59.35.png
[image-8]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2020.59.51.png
[image-9]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.03.20.png
[image-10]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.03.32.png
[image-11]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.03.42.png
[image-12]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.11.51.png
[image-13]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.14.12.png
[image-14]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.14.26.png
[image-15]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.14.42.png
[image-16]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.15.08.png
[image-17]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.15.34.png
[image-18]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.16.11.png
[image-19]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.16.43.png
[image-20]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.17.30.png
[image-21]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.18.41.png
[image-22]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.18.54.png
[image-23]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.19.07.png
[image-24]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.19.22.png
[image-25]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.20.19.png
[image-26]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.20.40.png
[image-27]:	https://ada-sub.dh-index.org/school/api/png/ses-overview/Bildschirmfoto%202022-07-13%20um%2021.21.33.png