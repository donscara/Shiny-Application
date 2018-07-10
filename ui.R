shinyUI(pageWithSidebar(
  headerPanel("Miles Per Gallon Frequency"),
  sidebarPanel(
    sliderInput('mu', 'Miles Per Gallon',value = 10, min = 10, max = 35, step = 5,)
  ),
  mainPanel(
    plotOutput('newHist')
    
  )
))