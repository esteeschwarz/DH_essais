# 12341.DYN HA types extraction
# 20220820(10.34) 
# author: esteeschwarz
# app deployed at:https://vision2020.shinyapps.io/hux2021/
##########################################################
# stages:
# 20220820 working, deployed.

# Load packages ----------------------------------------------------------------
library(shiny)
library(readtext)
#library(markdown)
#library(htmltools)
library(pdftools)
# loaddata

# UI ---------------------------------------------------------------------------
ui <- pageWithSidebar(
  
  # Title ----
  headerPanel("Dynamiken postdeutscher Gegenwartslyrik. collaborative essai."),
  
  # Sidebar ----
  sidebarPanel(
    "please provide a book for further analysis",
    fileInput("file1","upload .pdf or .txt file"),
    downloadButton("downloadData","download")
  ),
  # Main panel ----
  mainPanel(
                         verbatimTextOutput("contents"),
  verbatimTextOutput("thankyou"))
)
            
# Server -----------------------------------------------------------------------
server <- function(input, output) {
  
  #### outputs:
  output$contents <-renderPrint({
    file<-input$file1
    ext<-tools::file_ext(file$datapath)
    req(file)
   # validate(need(ext=="pdf"|ext=="txt","please upload a pdf file"))
    ifelse (ext=="pdf",extracted<-1,extracted<-2)
    #cat(extracted)
    textpdf<-"sampletext"
    texttxt<-"sampletext"
    if (extracted==1){textpdf<-pdf_text(file$datapath)}
    if (extracted==2){texttxt<-readtext(file$datapath)$text}
    d1<-textpdf
    d2<-stri_extract_all_words(d)
    d3<-unique(d2[[2]])
    e1<-texttxt
    e2<-stri_extract_all_words(e1)
    e3<-unique(e2[[1]])
    

    ifelse(extracted==1,extract_types<-d3,extract_types<-e3)
print(extract_types)    
#        extract_types<-unique(stri_extract_all_words(extracted))
 #  print(extract_types)
    output$downloadData<-downloadHandler(
      filename="types_extracted.txt",
      content=function(file){write_lines(extract_types,file)}
    )
    output$thankyou<-renderPrint({
      cat("Thank you for unterstützung!")
    })
   # file.create("types_extracted.txt")
  })
  # output$downloadData<-downloadHandler(
  #   filename="types_extracted.txt",
  #   content=function(file){write_lines(extracted,file)}
  # )
}
# Create the Shiny app object --------------------------------------------------
#shinyApp(ui = ui, server = server)

