
library(shiny)

shinyApp(
  ui = fluidPage(
    titlePanel("File Input Example"),
    sidebarLayout(
      sidebarPanel(
        fileInput("file", "Choose CSV File")
      ),
      mainPanel(
        tableOutput("contents")
      )
    )
  ),
  
  server = function(input, output) {
    output$contents <- renderTable({
      req(input$file)
      read.csv(input$file$datapath)
    })
  }
)