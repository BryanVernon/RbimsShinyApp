library(shiny)
library(markdown)

# Define UI for application that draws a histogram
ui <- navbarPage(
  "RbiMs",
  tabPanel("Home", includeHTML("../Rmd/Home.html")),
  tabPanel("About",includeHTML("../Rmd/About.html")),
  tabPanel("Upload data",includeHTML("../Rmd/Upload-data.html")),
  tabPanel("Contact Us",includeHTML("../Rmd/Contact-Us.html"))
  )
  

# Define server logic required to draw a histogram
server <- function(input, output) {

}

# Run the application 
shinyApp(ui = ui, server = server)
