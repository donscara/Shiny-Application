data(mtcars)

shinyServer(
  function(input, output) {
    output$newHist <- renderPlot({
      hist(mtcars$mpg, xlab='Miles Per Gallon', col='blue',main='Histogram')
      mu <- input$mu
      lines(c(mu, mu), c(0, 200),col="red",lwd=5)
      mse <- mean((mtcars$mpg - mu)^2)
      text(12, 11, paste("mu = ", mu))
      text(12, 10, paste("MSE = ", round(mse, 2)))
    })
    
  }
)
