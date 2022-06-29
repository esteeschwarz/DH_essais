#12253.drama analysis
#20220620(21.37)
#####################
#tutorial: https://quadrama.github.io/DramaAnalysis/tutorial/3/quick-start.html

#####################
install.packages(c("DramaAnalysis", "magrittr", 
                   "igraph", "highcharter", 
                   "rmarkdown", "fmsb", 
                   "knitr"))

library(DramaAnalysis)
library(magrittr)
library(igraph)
?installData
installData(dataDirectory = "data/klemm_besuch/nlp",baseUrl = "https://github.com/esteeschwarz",remoteUrl = "https://github.com/esteeschwarz/DH_drama.git")
installData(dataDirectory = "drama_local",baseUrl = "https://github.com/esteeschwarz",remoteUrl = "https://github.com/esteeschwarz/DH_drama.git")
#wks.
?loadDrama
loadDrama("data/klemm_besuch/nlp/OUT/csv/esuch_(Klemm)")
?installCollectionData
installCollectionData(getOption("data/klemm_besuch/nlp"),"main","DH_drama","https://github.com/esteeschwarz/")
### wo sucht der denn? > loadDrama("data/klemm_besuch/nlp/OUT/csv/esuch_(Klemm)")
#/Users/guhl/QuaDramA/Data2/qd/csv/data/klemm_besuch/nlp/OUT/csv/esuch_(Klemm).UtterancesWithTokens.csv could not be loaded and was skipped