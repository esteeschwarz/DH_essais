# 13421.chat preprocess transcripts
# 20221015(08.37)
# regex notes usw.
##################
# regex101.com essais
# finds all lines introduced with correct tier labeling. 
regx1<-"/[0-9]{1,3}...[A-Z]{3}:.+/gmi"
# try invert this search to find not-labeled lines which (false hard line breaks)

# todo
- sort regex array after gefräszigkeit
- 1st: % by #%#
- @ in lines following the header by #@#, ...@
- pause #P#
- proof header, del ELL, TUR
- insert elicitation files reference
- think of hardcoded linenumbers for demonstration purpose, iterating regex insert growing number at begin of line? maybe python..., have to be unique to other numbers to be easily removed for chat convention