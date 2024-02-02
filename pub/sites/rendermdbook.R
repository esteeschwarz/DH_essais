mdf<-list.files("~/Documents/GitHub/HU-LX/mdbook/workflow/src")
mdf.cl<-gsub("\\..*","",mdf)
mdf.rmd<-paste0(mdf.cl,".Rmd")
#mdf
#mdtemp<-tempdir("tmd")
k<-1
#sort(mdf)
m<-grepl("SUMMARY",mdf)
mdf<-mdf[!m]
mdf.d<-paste0("~/Documents/GitHub/HU-LX/mdbook/workflow/src/",mdf)
for(k in 1:length(mdf)){
  md<-readLines(mdf.d[k])
  m<-grep("([0-9]{1,2}\\])",md)
  rep<-paste0(k,"-\\1")
  fig<-gsub("([0-9]{1,2}\\])",rep,md[m])
  md[m]<-fig
  mdns<-paste0("mod/",mdf[k])
  mdns<-paste0("mod/",mdf.cl[k],".Rmd")
  mdns<-mdf.rmd[k]
  writeLines(md,mdns)
}
render("index.Rmd")
render_site()
library(blogdown)
hulxfiles<-list.files("~/Documents/GitHub/DH_essais/pub/hu-lx/site2/src")
hulxrmds<-paste0("~/Documents/GitHub/DH_essais/pub/hu-lx/site2/src",hulxfiles)


####
rmd_stub = "doku.Rmd"
cat(readLines(rmd_stub), sep = "\n")
output_file = rmarkdown::render(
  rmd_stub
)

