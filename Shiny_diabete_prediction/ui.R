library(shiny)
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Diabetes predicition"),
    sidebarPanel(
      numericInput('glucose' , 'Glucose mg/dl', 90, min = 50, max = 200, step = 5 ),
      submitButton( 'Submit')
      ), # Closes the sidebar panel bracket
      mainPanel (
        h3("Results of prediction"),
        h4("You entered"),
        verbatimTextOutput('inputValue'),
        h4("Wich resulted in a prediction of "),
        verbatimTextOutput('prediction')
      )
    )
  )