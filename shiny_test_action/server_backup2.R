sumVal <- function(x,y){
  x(x()+y)
  if(x()>500){
    x(500)    
  }  else if (x()<0){
    x(0)
  }
}

redVal <- function(x,y,z){
  x(x()-(y*z))
  if(x()>500){
    x(500)    
  }  else if (x()<0){
    x(0)
  }
}


total_flour<- reactiveVal(0)
total_ham <- reactiveVal(0)
total_cheese <- reactiveVal(0)
total_egg <- reactiveVal(0) 
total_bacon <- reactiveVal(0) 
total_tomato <- reactiveVal(0) 
total_olive <- reactiveVal(0) 
total_onion <- reactiveVal(0) 
total_salami <- reactiveVal(0) 



library(shiny)
library(UsingR)
library(ggplot2)



shinyServer(
  
  function(input, output) {

    observeEvent(
      input$addValues , {
        sumVal(total_flour, as.numeric(input$flour))
        sumVal(total_ham, as.numeric(input$ham))
        sumVal(total_cheese, as.numeric(input$cheese))
        sumVal(total_egg, as.numeric(input$egg))
        sumVal(total_bacon, as.numeric(input$bacon))
        sumVal(total_tomato, as.numeric(input$tomato))
        sumVal(total_olive, as.numeric(input$olive))
        sumVal(total_onion, as.numeric(input$onion))
        sumVal(total_salami, as.numeric(input$salami))
      }
    )
    
    observeEvent(
      input$plusTen , {
        sumVal(total_flour, 10)
        sumVal(total_ham, 10)
        sumVal(total_cheese, 10)
        sumVal(total_egg, 10)
        sumVal(total_bacon, 10)
        sumVal(total_tomato, 10)
        sumVal(total_olive, 10)
        sumVal(total_onion, 10)
        sumVal(total_salami, 10)
      }
    )
    
    observeEvent(
      input$fillValues , {
        total_flour(500)
        total_ham(500)
        total_cheese(500)
        total_egg(500)
        total_bacon(500)
        total_tomato(500)
        total_olive(500)
        total_onion(500)
        total_salami(500)
      }
    )
    
    observeEvent(
      input$clearValues , {
        total_flour(0)
        total_ham(0)
        total_cheese(0)
        total_egg(0)
        total_bacon(0)
        total_tomato(0)
        total_olive(0)
        total_onion(0)
        total_salami(0)
      }
    )
    
    # observeEvent(
    #   input$pepperoni , {
    #     redVal(total_flour,as.numeric(input$pepperoni))
    #     redVal(total_ham,as.numeric(input$pepperoni))
    #     redVal(total_cheese,as.numeric(input$pepperoni))
    #     redVal(total_egg,as.numeric(input$pepperoni))
    #     redVal(total_bacon,as.numeric(input$pepperoni))
    #     redVal(total_tomato,as.numeric(input$pepperoni))
    #     redVal(total_olive,as.numeric(input$pepperoni))
    #     redVal(total_onion,as.numeric(input$pepperoni))
    #     redVal(total_salami,as.numeric(input$pepperoni))
    #   }
    # )
    
    observeEvent(
      input$pepperoni , {
        redVal(total_flour,80)
        redVal(total_ham,30)
        redVal(total_cheese,20)
        redVal(total_egg,0)
        redVal(total_bacon,10)
        redVal(total_tomato,30)
        redVal(total_olive,10)
        redVal(total_onion,20)
        redVal(total_salami,100)
      }
    )
    
    
    observeEvent(
      input$marguerita , {
        redVal(total_flour,as.numeric(input$marguerita), 50)
        redVal(total_ham,as.numeric(input$marguerita), 50)
        redVal(total_cheese,as.numeric(input$marguerita), 50)
        redVal(total_egg,as.numeric(input$marguerita), 50)
        redVal(total_bacon,as.numeric(input$marguerita), 50)
        redVal(total_tomato,as.numeric(input$marguerita), 50)
        redVal(total_olive,as.numeric(input$marguerita), 50)
        redVal(total_onion,as.numeric(input$marguerita), 50)
        redVal(total_salami,as.numeric(input$marguerita), 50)
      }
    )
    
    observeEvent(
      input$ham , {
        sumVal(total_flour,-as.numeric(input$ham)*10)
        sumVal(total_ham,-as.numeric(input$ham)*10)
        sumVal(total_cheese,-as.numeric(input$ham)*10)
        sumVal(total_egg,-as.numeric(input$ham)*10)
        sumVal(total_bacon,-as.numeric(input$ham)*10)
        sumVal(total_tomato,-as.numeric(input$ham)*10)
        sumVal(total_olive,-as.numeric(input$ham)*10)
        sumVal(total_onion,-as.numeric(input$ham)*10)
        sumVal(total_salami,-as.numeric(input$ham)*10)
      }
    )

    observeEvent(
      input$mozzarela , {
        sumVal(total_flour,-as.numeric(input$mozzarela)*10)
        sumVal(total_ham,-as.numeric(input$mozzarela)*10)
        sumVal(total_cheese,-as.numeric(input$mozzarela)*10)
        sumVal(total_egg,-as.numeric(input$mozzarela)*10)
        sumVal(total_bacon,-as.numeric(input$mozzarela)*10)
        sumVal(total_tomato,-as.numeric(input$mozzarela)*10)
        sumVal(total_olive,-as.numeric(input$mozzarela)*10)
        sumVal(total_onion,-as.numeric(input$mozzarela)*10)
        sumVal(total_salami,-as.numeric(input$mozzarela)*10)
      }
    )

    output$stock_graph <- renderPlot({
      supData <- c(total_flour(), total_ham(), total_cheese(),
                   total_egg(), total_bacon(), total_tomato(),
                   total_olive(), total_onion(), total_salami())
      namesData <- c("Flour", "Ham","Cheese", "Egg","Bacon", "Tomato", "Olive",
                     "Onion", "Salami")
      
      barplot(supData,
              names.arg = namesData,
              ylab = "Amount available",
              xlab = "Products",
              col = "blue",
              main = "Stock of goods available",
              ylim = c(0,500)
      )
      abline(h = 480, col="green", lwd=3, lty=2)
      abline(h = 20, col="red", lwd=3, lty=2)
    })
    
    
  }
)