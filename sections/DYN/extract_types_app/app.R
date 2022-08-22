# 12341.DYN HA types extraction
# 20220820(10.34) 
# author: esteeschwarz
# app deployed at:https://vision2020.shinyapps.io/postdeutsch_dynamics/
##########################################################
# stages:
# 20220822 working, deployed.

# Load packages ----------------------------------------------------------------
library(shiny)
library(readtext)
#library(markdown)
#library(htmltools)
library(pdftools)
library(stringi)
library(tools)
library(curl)
library(markdown)
library(htmltools)

#source("~/boxHKW/21S/DH/local/R/curlsendmail.R")
mdsrc_01<-"https://raw.githubusercontent.com/esteeschwarz/DH_essais/main/sections/DYN/DYN_HA.12282.md"
# loaddata

# UI ---------------------------------------------------------------------------
ui <- pageWithSidebar(
  
  # Title ----
  headerPanel("Dynamiken postdeutscher Gegenwartslyrik: collaborative approach."),
  
  # Sidebar ----
  sidebarPanel(
    "please provide a book for further analysis:",br(),
    fileInput("file1","upload .pdf or .txt file"),
    "and download extracted word types:",br(),
    downloadButton("downloadData","download"),br(),br(),
    "or submit directly...",
    textInput("submit","please type 'submit!'",value = "type!" ),
    verbatimTextOutput("thankyou"),
    verbatimTextOutput("sent")
      ),
  # Main panel ----
  mainPanel(
    HTML(markdownToHTML(file = mdsrc_01)),
    #verbatimTextOutput()
    verbatimTextOutput("contents"))
)
  # Server -----------------------------------------------------------------------
server <- function(input, output) {
  # Sendmail ----
  senddata<-function(dta){
    #recipients<-readline("enter email:")
    recipients<-"st@rotefadenbuecher.de"
    sender<-"dh@rotefadenbuecher.de"
    msg<-dta
    cred<-read.csv("~/boxHKW/21S/DH/local/DYN/dhmailcred.csv",header = T)
    #attch<-file(description  = attf)
    message<-c('From: "stephan dh" <muell@rotefadenbuecher.de>
To: "dh recipient" <st@rotefadenbuecher.de>
Subject: hello world

Test email from R curl.',msg)
    if(input$submit=="submit!"){
    send_mail(sender,recipients,message,smtp_server="smtp://smtp.ionos.de",use_ssl = "try",
              username=cred$username,password=cred$password)
      output$sent<-renderPrint(
        cat("data sent successfully")
     #   input$submit<-"type"
      )
    }
  }
  
  #### outputs:
  output$sent<-renderPrint({cat("please do submit!")})
  output$contents <-renderPrint({
    file<-input$file1
    ext<-file_ext(file$datapath)
    req(file)
    # validate(need(ext=="pdf"|ext=="txt","please upload a pdf file"))
    ifelse (ext=="pdf",extracted<-1,extracted<-2)
    #cat(extracted)
    textpdf<-"sampletext"
    texttxt<-"sampletext"
    if (extracted==1){textpdf<-pdf_text(file$datapath)}
    if (extracted==2){texttxt<-readtext(file$datapath)$text}
    ld1<-0
    le1<-0
    d1<-textpdf
    d2<-stri_extract_all_words(d1)
    ld1<-length(d2[[1]])
  #  d3<-unique(d2[[1]])
    ld3<-length(d3)
    e1<-texttxt
    e2<-stri_extract_all_words(e1)
    le1<-length(e2[[1]])
    ifelse(extracted==1,extract_types<-unique(d2[[1]]),extract_types<-unique(e2[[1]]))
    cat("extracted data overview:\n")
    cat("tokens:",ld1+le1)
    cat("types:",)
    print(extract_types)    
    #        extract_types<-unique(stri_extract_all_words(extracted))
    #  print(extract_types)
    output$downloadData<-downloadHandler(
      filename="types_extracted.txt",
      content=function(file){writeLines(extract_types,file)}
    )
  #  mailsubmit<-reactive({
    #  input$senddata
   # })
   # output$sent<-reactive({
      
      #})
    output$thankyou<-renderPrint({
      cat("Thank you for unterstützung!")
      senddata(extract_types)
     # cat("mail sent successfully")
    #  input$senddata
      
      })
    # file.create("types_extracted.txt")
  })
  # output$downloadData<-downloadHandler(
  #   filename="types_extracted.txt",
  #   content=function(file){write_lines(extracted,file)}
  # )
}
# Create the Shiny app object --------------------------------------------------
shinyApp(ui = ui, server = server)

