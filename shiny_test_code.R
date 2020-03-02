library(shiny)

ui <- pageWithSidebar(
headerPanel(h3("Hello Shiny")
),
sidebarPanel(
  # textInput(inputId = 'text1',label = "Input text 1"),
  # textInput(inputId = 'text2',label = "Input text 2"),
  # actionButton("goButton", "Go!")
  p("In this place you will enter the material received for your stock"),
  numericInput("flour", label = h5("Flour"), value = 0),
  numericInput('ham', label = h5('Ham'), value = 0),
  numericInput('cheese', label = h5('Cheese'), value = 0),
  actionButton("addValues", "Confirm values!"),
  h5("Amount of flour", verbatimTextOutput("flour_value", placeholder = TRUE)),
  h5("Amount of ham", verbatimTextOutput("ham_value", placeholder = TRUE)),
  h5("Amount of cheese", verbatimTextOutput("cheese_value", placeholder = TRUE))
),
mainPanel (
  div(
    h3("Total of flour", verbatimTextOutput("total_flour")),
    code('Some Code'),
    p('Some ordinary text')
  ),
  div(
    h3("Main Panel text"),
    code('Some Code'),
    p('Some ordinary text')
  )
  # p('Output text 1'), textOutput('text1'),
  # p('Output text 2'), textOutput('text2'),
  # p('Output text 3'), textOutput('text3')
  
)
)
#fluidPage(
#   numericInput("x", label = "number", value = 150), 
#   textOutput("n1out"), 
#   textOutput("n2out"), 
#   textOutput("n3out")
# )


# f = function(x){
#   return(x^2)
# }
# 
# g = function(x){
#   return(x^3)
# }

server <- function(input, output) {
  
  # n1 <- reactive({
  #   f(input$x)
  # })
  # 
  # n2 <- reactive({
  #   g(input$x)
  # })
  # 
  # n3 <- reactive({
  #   n1() - n2()
  # })
  # 
  # output$n1out =  renderText({
  #   print(n1())
  # })
  # 
  # output$n2out =  renderText({
  #   print(n2())
  # })
  # 
  # output$n3out =  renderText({
  #   print(n3())
  # })

    # output$text1 <- renderText({input$text1})
    # output$text2 <- renderText({input$text2})
    # output$text3 <- renderText({
    #   if (input$goButton == 0) {
    #     "Voce nao apertou o botao"
    #   } else {
    #     "Voce apertou o botao"
    #   }
    # })
    
    f <- function(x,y) {
      y <- y+x
      return (y)
    } 
    
    
    n1 <- reactive({f(input$flour, total_flour)})
    # output$total_flour <- renderText({
    #   print(n1())
    # })
    
    # # You can access the value of the widget with input$num, e.g.
    output$flour_value <- renderPrint({ input$flour })
    output$ham_value <- renderPrint({ input$ham })
    output$cheese_value <- renderPrint({ input$cheese })
    output$total_flour <- renderPrint({n1()})
    
    #if ( input$addValues == 0 ){
    #  x <<- input$flour
    #} else {
    #  y <<- input$ham
    #}
    
    # output$total_flour <- renderPrint({
    #   if (input$addValues == 0 ){
    #       #output$total_flour <- renderPrint({input$flour})
    #       x
    #     } else {
    #       # total_flour <- input$flour
    #       # output$total_flour <- renderPrint({"total_flour"})
    #       y
    #     }
    # }
}

shinyApp(ui, server)