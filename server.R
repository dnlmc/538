library(shiny)

source("misanthropic_neighbors.R")
  
shinyServer(
  function(input, output) {
      
    output$histPlot <- renderPlot({
        
      mishouse(houses = input$houses, trials = input$trials)
    
    })
    
    output$text1 <- renderText({ 
      mishouse(houses = input$houses, trials = input$trials)
    })
        
  }
)