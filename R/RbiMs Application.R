library(shiny)
library(markdown)

# Define UI for application that draws a histogram
ui <- fluidPage(
  navbarPage("RbiMs",
             tabPanel("About",includeHTML("../Rmd/About.html")),
             tabPanel("KEGG",
                      fluidRow(
                        titlePanel("Upload data"),
                        sidebarLayout(
                          sidebarPanel(
                            fileInput("file1", "Choose your .csv or .txt file from KofamKOALA",
                                      #accept = c(
                                      # "text/csv",
                                      #"text/comma-separated-values,text/plain",
                                      #".csv")
                            ),
                            checkboxInput("use_example", "Use example data"),
                            actionButton(inputId = "view", label = "View"),
                            actionButton(inputId = "mapping", label = "Map"),
                            actionButton(inputId = "export", label = "Export"),
                            actionButton(inputId = "plot", label = "Plot")
                          ),
                          mainPanel(tableOutput("table1"))
                        )
                      )
             ),
             tabPanel("Contact Us",includeHTML("../Rmd/Contact-Us.html")),
             tabPanel("FAQ", includeHTML("../Rmd/FAQ.html"))
  )
)



server <- function(input, output, session) {
  library(rbims)
  library(dplyr)
  library(tidyverse)
  library(ggplot2)
  library(shiny)
  options(shiny.maxRequestSize=30*1024^2)
  filedata <- reactive({
    infile <- input$file1
    # if (is.null(infile)){
    #   return(NULL)      
    # }
    infile<-(infile[1,1])
    #cat(infile)
    #table1<-read_ko(infile)
    validate(need(infile, message = 'Please choose a file'))
    infile
  })
  df<- reactive({
    if(input$use_example == FALSE){
      ko <- read_ko(data_kofam = filedata())
    }else{
      example <- data.frame(c(1,2,3))
      example
    }
    #read_ko(data_kofam = filedata())
  })
  
  output$table1 <- renderTable({
    df()
  })
}

shinyApp(ui, server)