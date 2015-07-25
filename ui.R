shinyUI(pageWithSidebar(
  headerPanel("Average Price of House in Different States of USA"),
  sidebarPanel(
    selectInput("state", "Choose your State:", choices = c('California' = 'CA', 'New York' = 'NY', 'Texas' = 'TX', 'Washington' = 'WA')),
    sliderInput("rooms", "Choose number of rooms: ", min = 1, max = 6, value = 2)
  ),
  mainPanel(
    p("This shiny app will show you the average cost of a house in 4 highly populous states of USA. Simply select the state and the number of rooms you want, and the app will display the approximate price along with a comparison of the price over the past 3 years."),
    h4("The state you chose:"),
    verbatimTextOutput("state"),
    h4("The number of rooms you chose:"),
    verbatimTextOutput("rooms"),
    h4("The cost of the house is:"),
    verbatimTextOutput("cost"),
    h4("Change in cost over the last 3 years:"),
    plotOutput("costPlot")
  )
))