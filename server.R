land <- read.csv("land.csv", stringsAsFactors = F)
houseCost <- function(state, rooms) {
  cost <- land[land$STATE == state & land$Date == '2015', ]
  cost <- as.numeric(cost$Home.Value)
  cost <- cost + 0.25 * cost * rooms
  return(cost)
}

comparison <- function(state, rooms) {
  costData <- land[land$STATE == state, ]
  costData$Home.Value <- costData$Home.Value + 0.25 * costData$Home.Value * rooms
  costPlot <- plot(costData$Date, costData$Home.Value, type = "o", xlab = "Year", ylab = "Cost in USD", xaxp = c(2013, 2015, 2))
  return(costPlot)
}

shinyServer(
  function(input, output) {
    output$state <- renderPrint({input$state})
    output$rooms <- renderPrint({input$rooms})
    output$cost <- renderPrint({houseCost(input$state, input$rooms)})
    output$costPlot <- renderPlot({comparison(input$state, input$rooms)})
  }
)