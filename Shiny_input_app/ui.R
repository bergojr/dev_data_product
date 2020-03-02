library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Illustrating inputs"),
    sidebarPanel(
      numericInput('id1' , 'Numeric input labeled id1', 0, min = 0, max = 10, step = 1 ),
      checkboxGroupInput( 'id2', 'Checkbox' , c('Value 1' = '1', 
                                                'Value 2' = '2', 
                                                'Value 3' = '3' )),
      dateInput( 'date' , 'Date:')
      ), # Closes the sidebar panel bracket
      mainPanel (
        h3("Ilustrating outputs"),
        h4("You entered"),
        verbatimTextOutput('oid1'),
        h4("You choose"),
        verbatimTextOutput('oid2'),
        h4("Today is"),
        verbatimTextOutput('odate')
        
        # code('Some Code'),
        # p('Some ordinary text')
      )
    )
  )