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
                            actionButton(inputId = "view", label = "View"),
                            actionButton(inputId = "mapping", label = "Map"),
                            actionButton(inputId = "export", label = "Export"),
                            actionButton(inputId = "plot", label = "Plot")
                            ),
                        mainPanel(plotOutput("KEGG"))
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
    if (is.null(infile)){
      return(NULL)      
    }
    infile<-(infile[1,1])
    cat(infile)
    table_2<-read_ko_shiny(infile)
  })
  #output$KEGG <- renderUI({
   # df <- filedata()
  #  if (is.null(df)) return(NULL)
  #KEGG <- read_ko_shiny(data_kofam =  df)})
  
}

shinyApp(ui, server)
