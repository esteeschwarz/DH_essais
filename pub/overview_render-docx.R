#20240121(07.14)
#14042.overview-docx.from.mdbook-src
####################################
library(rmarkdown)
render("overview.md.child.Rmd")
tmd<-readLines("overview.md.child.md")
m<-grep("\\\\\\[[a-zA-Z.]{1,12}\\\\\\]",tmd)
tmd[m]
#gsub("\\\\\\[([a-zA-Z.]{1,9})\\\\\\]","[\\1]",tmd[m])
tmd[m]<-gsub("\\\\\\[([a-zA-Z.]{1,12})\\\\\\]","[\\1]",tmd[m])
writeLines(tmd,"overview.child.temp.md")
render("overview.docx.parent.Rmd")
file.copy("overview.docx.parent.docx","/Users/guhl/boxHKW/share/pfaff-corpusclass-overview.docx",overwrite = T)
