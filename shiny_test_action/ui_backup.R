library(shiny)


shinyUI(
  pageWithSidebar(
    headerPanel(h3("This app will help you to control the goods of your Pizzaria")
    ),
    sidebarPanel(
      p("In this place you will enter the material received for your stock"),
      fluidRow( column(5,numericInput("flour", label = h5("Flour"), value = 0),offset = 1), 
                column(5,numericInput('ham', label = h5('Ham'), value = 0) ,offset = 0)),
      fluidRow( column(5,numericInput("cheese", label = h5("Cheese"), value = 0),offset = 1), 
                column(5,numericInput('egg', label = h5('Egg'), value = 0) ,offset = 0)),
      # numericInput("flour", label = h5("Flour"), value = 0),
      # numericInput('ham', label = h5('Ham'), value = 0),
      # numericInput('cheese', label = h5('Cheese'), value = 0),
      # numericInput('egg', label = h5('Egg'), value = 0),
      # numericInput('bacon', label = h5('Bacon'), value = 0),
      # numericInput('tomato', label = h5('Tomato'), value = 0),
      # numericInput('olive', label = h5('Olive'), value = 0),
      # numericInput('onion', label = h5('Onion'), value = 0),
      # numericInput('salami', label = h5('Salami'), value = 0),
      actionButton("addValues", "Confirm values!")#,
      # h5("Amount of flour", verbatimTextOutput("flour_value", placeholder = TRUE)),
      # h5("Amount of ham", verbatimTextOutput("ham_value", placeholder = TRUE)),
      # h5("Amount of cheese", verbatimTextOutput("cheese_value", placeholder = TRUE))
      ),
      mainPanel (
        div(
          h3("This shows your stock area", align = "center"),
          plotOutput("stock_graph",height = 500)
        ),
        div(
          h3("In this area you can register your sales", align = "center")
        )
        # p('Output text 1'), textOutput('text1'),
        # p('Output text 2'), textOutput('text2'),
        # p('Output text 3'), textOutput('text3')

      )
    )
  )