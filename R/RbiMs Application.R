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
<<<<<<< HEAD
                                      # "text/csv",
                                      #"text/comma-separated-values,text/plain",
                                      #".csv")
                            ),
                            checkboxInput("use_example", "Use example data"),
=======
                                       # "text/csv",
                                        #"text/comma-separated-values,text/plain",
                                        #".csv")
                                      ),
>>>>>>> cd955088e567b2e2ce8e0c337243a460711b3bc1
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
<<<<<<< HEAD
    #read_ko(data_kofam = filedata())
  })
=======
    infile<-(infile[1,1])
    cat(infile)
    table_2<-read_ko_shiny(infile)
  })
  #output$KEGG <- renderUI({
   # df <- filedata()
  #  if (is.null(df)) return(NULL)
  #KEGG <- read_ko_shiny(data_kofam =  df)})
>>>>>>> cd955088e567b2e2ce8e0c337243a460711b3bc1
  
  output$table1 <- renderTable({
    df()
  })
}

shinyApp(ui, server)