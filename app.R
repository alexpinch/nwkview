# Alex Pinch, adapted from ChatGPT
# Last updated Feb. 1st 2023

library(shiny)
library(ape)

ui <- fluidPage(
  titlePanel("Newick Tree"),
  sidebarLayout(
    sidebarPanel(
      fileInput("treefile", "Upload Newick tree file (.nwk)")
    ),
    mainPanel(
      plotOutput("treeplot")
    )
  )
)

server <- function(input, output) {
  treefile_data <- reactive({
    inFile <- input$treefile
    if (is.null(inFile))
      return(NULL)
    read.tree(inFile$datapath)
  })
  
  output$treeplot <- renderPlot({
    treefile <- treefile_data()
    if (is.null(treefile))
      return()
    
    plot(treefile, type = "phylogram", edge.label.cex = 0.8)
  })
}

shinyApp(ui, server)
