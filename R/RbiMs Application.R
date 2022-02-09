library(shiny)
library(markdown)

# Define UI for application that draws a histogram
ui <- navbarPage(
  "RbiMs",
  tabPanel("Home", includeMarkdown("Rmd/Home.Rmd")),
  tabPanel("About",includeMarkdown("Rmd/About.Rmd")),
  tabPanel("Contact Us",includeMarkdown("Rmd/Contact Us.Rmd"))
  )
  

# Define server logic required to draw a histogram
server <- function(input, output) {

}

# Run the application 
shinyApp(ui = ui, server = server)
