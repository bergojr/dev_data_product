
library(shiny)
library(UsingR)
data(galton)


shinyServer(
  
  function(input, output) {
    
    # You can access the value of the widget with input$num, e.g.
    output$flour_value <- renderPrint({ input$flour })
    output$ham_value <- renderPrint({ input$ham })
    output$cheese_value <- renderPrint({ input$cheese })
    if (input$addValues == 0 ){
      output$total_flour <- reactive(renderPrint({input$flour}))
    } else {
      output$total_flour <- renderPrint({output$total_flour+input$flour})
    }
    
  }
)