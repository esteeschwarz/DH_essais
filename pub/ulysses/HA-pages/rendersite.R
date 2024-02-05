.libPaths(new = "/home/runner/work/SPUND-LX/SPUND-LX/rlibs", include.site = TRUE)
library(rmarkdown)
#library(bookdown)
#library(knitr)


setwd("corpusLX/14015-HA/HA-pages")
render("_doku.Rmd")
#render("HA-notebook/_doku.Rmd")
render_site()
#setwd("corpusLX/14015-HA/HA-pages/HA-notebook")


#render_site(input = "./")