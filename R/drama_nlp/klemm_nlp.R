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
?loadDrama
?installCollectionData
installCollectionData(getOption("klemm_nlp"),"main","DH_essais","https://github.com/esteeschwarz/")
