##### Web Scraping -- Google Results #####

setwd("C:/Users/caoyujin/Desktop/Web-Scraping")

library(RCurl)
library(XML)
library(rvest)

######################## Getting URLs ###################

googleSearch <- function(keyworkd, page) {
  
  index <- 1:page # web scraping from multiple pages
  index <- (index-1)*10
  
  links <- list()
  
  for (i in index){
    search.url = paste("http://www.google.com/search?q=", gsub(" ", "+", keyworkd), "&start=", index, "&*", sep = "")
    
    # read in page contents
    search.html <- getURL(search.url)
    
    # parse HTML into tree structure
    search.doc <- htmlParse(search.html)
    
    # extract url nodes using XPath.
    search.attrs <- xpathApply(search.doc, "//h3[@class='r']/a[@href]", xmlAttrs)
    search.links <- sapply(search.attrs, function(x) x[[1]])
    
    # free doc from memory
    free(search.doc)
    
    # ensure urls start with "http" to avoid google references to the search page
    search.links <- grep(paste(c("http://", "https://"), collapse = "|"), search.links, fixed = FALSE, value=TRUE)
    search.links <- unlist(lapply(search.links, function(x)substr(x,regexpr("http", x, fixed = TRUE), (regexpr("&sa", x, fixed = TRUE)-1))))
    
    # store all the lists of URLs
    links <- c(links,search.links)
  }
  
  links <- unlist(unique(links))
  return(links)
}


url_list = googleSearch("anarkkiv",2)

#################### Getting DOM Texts ######################

# use SelectorGadget to find selector id

html = read_html(url_list[5])
content = html %>% html_nodes(".summary , .story-meta .headline") %>% html_text()