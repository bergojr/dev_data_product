library(shiny)


shinyUI(
  pageWithSidebar(
    headerPanel(h3("This app will help you to control the resources of your Pizzeria"),
    ),
    sidebarPanel(
      p("In this place you will enter the material received for your stock"),
      numericInput("flour", label = h5("Flour"), value = 0),
      numericInput('ham', label = h5('Ham'), value = 0),
      numericInput('cheese', label = h5('Cheese'), value = 0),
      actionButton("addValues", "Confirm values!")
      # h5("Amount of flour", verbatimTextOutput("flour_value", placeholder = TRUE)),
      # h5("Amount of ham", verbatimTextOutput("ham_value", placeholder = TRUE)),
      # h5("Amount of cheese", verbatimTextOutput("cheese_value", placeholder = TRUE))
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

      )
    )
  )