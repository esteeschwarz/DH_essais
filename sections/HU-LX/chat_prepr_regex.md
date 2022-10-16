# 13421.chat preprocess transcripts
# 20221015(08.37)
# regex notes usw.
##################
# regex101.com essais
# finds all lines introduced with correct tier labeling. 
regx1<-"/[0-9]{1,3}...[A-Z]{3}:.+/gmi"
# try invert this search to find not-labeled lines which (false hard line breaks)