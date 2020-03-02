somaVal <- function(x,y){
  x(x()+y)
}

total_flour<- reactiveValues(stock = 0)
total_ham <- reactiveValues(stock = 0)
total_cheese <- reactiveValues(stock = 0)
total_egg <- reactiveValues(stock = 0)
total_bacon <- reactiveValues(stock = 0)
total_tomato <- reactiveValues(stock = 0)
total_olive <- reactiveValues(stock = 0)
total_onion <- reactiveValues(stock = 0)
total_salami <- reactiveValues(stock = 0)
total_test <- reactiveVal(0)
total_test2 <- reactiveVal(0)

supData <- c(total_test,total_test2)

library(shiny)
library(UsingR)
library(ggplot2)



shinyServer(
  
  function(input, output) {
    supData <- c(total_flour, total_ham, total_cheese,
                 total_egg, total_bacon, total_tomato,
                 total_olive, total_onion, total_salami)
  
    observeEvent(
      input$addValues , {
        total_flour$stock <- total_flour$stock + abs(as.numeric(input$flour))
        total_ham$stock <- total_ham$stock + as.numeric(input$ham)
        total_cheese$stock <- total_cheese$stock + as.numeric(input$cheese)
        total_egg$stock <- total_egg$stock + as.numeric(input$egg)
        total_bacon$stock <- total_bacon$stock + as.numeric(input$bacon)
        total_tomato$stock <- total_tomato$stock + as.numeric(input$tomato)
        total_olive$stock <- total_olive$stock + as.numeric(input$olive)
        total_onion$stock <- total_onion$stock + as.numeric(input$onion)
        total_salami$stock <- total_salami$stock + as.numeric(input$salami)
        #total_test(total_test()+ as.numeric(input$test))
        somaVal(supData[0], as.numeric(input$test))
      }
    )
    
    observeEvent(
      input$plusTen , {
        total_flour$stock <- total_flour$stock + 10
        total_ham$stock <- total_ham$stock + 10
        total_cheese$stock <- total_cheese$stock + 10
        total_egg$stock <- total_egg$stock + 10
        total_bacon$stock <- total_bacon$stock + 10
        total_tomato$stock <- total_tomato$stock + 10
        total_olive$stock <- total_olive$stock + 10
        total_onion$stock <- total_onion$stock + 10
        total_salami$stock <- total_salami$stock + 10
      }
    )
    
    observeEvent(
      input$clearValues , {
        total_flour$stock <- 0
        total_ham$stock <- 0
        total_cheese$stock <- 0
        total_egg$stock <- 0
        total_bacon$stock <- 0
        total_tomato$stock <- 0
        total_olive$stock <- 0
        total_onion$stock <- 0
        total_salami$stock <- 0
      }
    )
    
    observeEvent(
      input$fillValues , {
        total_flour$stock <- 500
        total_ham$stock <- 500
        total_cheese$stock <- 500
        total_egg$stock <- 500
        total_bacon$stock <- 500
        total_tomato$stock <- 500
        total_olive$stock <- 500
        total_onion$stock <- 500
        total_salami$stock <- 500
      }
    )
    
    output$flour_value <- renderPrint({ input$flour })
    output$ham_value <- renderPrint({ input$ham })
    output$cheese_value <- renderPrint({ input$cheese })
    output$egg_value <- renderPrint({input$egg})
    output$bacon_value <- renderPrint({input$bacon})
    output$tomato_value <- renderPrint({input$tomato})
    output$olive_value <- renderPrint({input$olive})
    output$onion_value <- renderPrint({ input$onion})
    output$salami_value <- renderPrint({input$salami})
    
    
    output$test_value <- renderPrint({supData[1]})
    # output$stock_ham <- renderPrint({total_ham$stock})
    # output$stock_cheese <- renderPrint({total_cheese$stock})
    output$stock_graph <- renderPlot({
      barplot(c(total_flour$stock, total_ham$stock, total_cheese$stock, 
                total_egg$stock, total_bacon$stock, total_tomato$stock,
                total_olive$stock, total_onion$stock, total_salami$stock, total_test()),
              names.arg = c("Flour", "Ham","Cheese", "Egg","Bacon", "Tomato", "Olive",
                            "Onion", "Salami", "teste"),
              ylab = "Amount available",
              xlab = "Products",
              col = "blue",
              main = "Stock of goods available")
    })
    
    
  }
)