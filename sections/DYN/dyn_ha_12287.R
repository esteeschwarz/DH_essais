#12287.dyn_ha: extract multiLX
#20220715(18.43)
#essai to extract multilingual and neologist expressions from german texts
################
getwd()
src<-paste0(getwd(),"/dyn_ha_wolf_out01/wordlist.csv")
dta<-read.csv2(src)
