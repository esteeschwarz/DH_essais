#### 12324.
staged:
- transcription [source](https://wholelifeacademy.hkw.de/index.php/s/DoLZ9N33yF4e2Jw)
- first essais with [escriptorium](https://escriptorium.fr), not able to running server instance
- OCR process [transkribus](https://readcoop.eu), model: "DiJeSt for Hebrew Script Languages" (0.2 credits per page)
- correction in transkribus mask 
  - characters ~99% correct 
  - numbers in text to be corrected 
  - RTL paragraphing not always correct 
  - some lines broken
  - myfault: use of german keyboard layout for numbers results in mixed RTL/LTR lines which later is difficult to edit nomatterwhere
- R regex processing to replace #(number)# by #BILD#
  - still not simple doing due to RTL/LTR direction
  - go back to transkribus mask and edit numbers again consistently 
  - 12325.
  - add start/end main (paragraph of interest) tags in transkribus
  - substitute (<number>) by symbol referenced pdf page 7
  - (only on left pdf pages, right pages TODO)
- 12326.
  - the final .docx and text file show the content of the pdf reverse, i.e. top to bottom from last page to first, right side first, left side second (like hebrew eben, i cant deduce if the .pdf pages order is in reading order...)