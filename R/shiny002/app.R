#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

ui <- bootstrapPage(
  h3("URL components"),
  verbatimTextOutput("urlText"),
  
  h3("Parsed query string"),
  verbatimTextOutput("queryText")
)

server <- function(input, output, session) {
  
  # Return the components of the URL in a string:
  output$urlText <- renderText({
    paste(sep = "",
          "protocol: ", session$clientData$url_protocol, "\n",
          "hostname: ", session$clientData$url_hostname, "\n",
          "pathname: ", session$clientData$url_pathname, "\n",
          "port: ",     session$clientData$url_port,     "\n",
          "search: ",   session$clientData$url_search,   "\n",
          "mydummy", "HELLO FUCT!"
    )
  })
  
  # Parse the GET query string
  output$queryText <- renderText({
    query <- parseQueryString("whatdefuck")
    
    # Return a string with key-value pairs
    paste(names(query), query, sep = "=", collapse=", ")
  })
}

shinyApp(ui, server)