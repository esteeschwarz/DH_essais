#### 12324.
staged:
- OCR process transkribus, model: DiJeSt for Hebrew Script Languages (0.2 credits per page)
- correction in transkribus mask 
  - characters ~99% correct 
  - numbers in text to be corrected 
  - RTL paragraphing not always correct 
  - some lines broken
  - myfault: use of german keyboard layout for numbers results in mixed RTL/LTR lines which later is difficult to edit nomatterwhere
- R regex processing to replace #(number)# by #BILD#
  - still not simple doing due to RTL/LTR direction
  - go back to transkribus mask and edit numbers again consistently 