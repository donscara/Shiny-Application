Shiny Presentation
========================================================
author: Donato Scarano  
date: 10/07/2018
autosize: true



========================================================
type:section


## Introduction

## - This application use the mtcars dataset to interactively display the mpg (Miles per Gallon) variable frequency.

## - A slidebar allow to select the value among those available in the dataset.

## - An interactive histogram displays frequency and mean

## - The code is divided in 2 files one for the UI(User Interface) part and the second for the Server side.


User Interface  UI Code
========================================================
```
shinyUI(pageWithSidebar(
  headerPanel("Miles Per Gallon Frequency"),
  sidebarPanel(
    sliderInput('mpg', 'Miles Per Gallon',value = 10, min = 10, max = 35, step = 5,)
  ),
  mainPanel(
    plotOutput('newHist')
    
  )
))
```
Server Code
========================================================

```
data(mtcars)

shinyServer(
  function(input, output) {
    output$newHist <- renderPlot({
      hist(mtcars$mpg, xlab='Miles Per Gallon', col='blue',main='Histogram')
      mpg <- input$mpg
      lines(c(mpg, mpg), c(0, 200),col="red",lwd=5)
      mse <- mean((mtcars$mpg - mpg)^2)
      text(12, 11, paste("mpg = ", mpg))
      text(12, 10, paste("MSE = ", round(mse, 2)))
    })
    
  }
)
```


Summary of the dataset
========================================================


```r
summary(mtcars)
```

```
      mpg             cyl             disp             hp       
 Min.   :10.40   Min.   :4.000   Min.   : 71.1   Min.   : 52.0  
 1st Qu.:15.43   1st Qu.:4.000   1st Qu.:120.8   1st Qu.: 96.5  
 Median :19.20   Median :6.000   Median :196.3   Median :123.0  
 Mean   :20.09   Mean   :6.188   Mean   :230.7   Mean   :146.7  
 3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0   3rd Qu.:180.0  
 Max.   :33.90   Max.   :8.000   Max.   :472.0   Max.   :335.0  
      drat             wt             qsec             vs        
 Min.   :2.760   Min.   :1.513   Min.   :14.50   Min.   :0.0000  
 1st Qu.:3.080   1st Qu.:2.581   1st Qu.:16.89   1st Qu.:0.0000  
 Median :3.695   Median :3.325   Median :17.71   Median :0.0000  
 Mean   :3.597   Mean   :3.217   Mean   :17.85   Mean   :0.4375  
 3rd Qu.:3.920   3rd Qu.:3.610   3rd Qu.:18.90   3rd Qu.:1.0000  
 Max.   :4.930   Max.   :5.424   Max.   :22.90   Max.   :1.0000  
       am              gear            carb      
 Min.   :0.0000   Min.   :3.000   Min.   :1.000  
 1st Qu.:0.0000   1st Qu.:3.000   1st Qu.:2.000  
 Median :0.0000   Median :4.000   Median :2.000  
 Mean   :0.4062   Mean   :3.688   Mean   :2.812  
 3rd Qu.:1.0000   3rd Qu.:4.000   3rd Qu.:4.000  
 Max.   :1.0000   Max.   :5.000   Max.   :8.000  
```
Plot
========================================================
Below is an example of plot obtained running the application.


```r
hist(mtcars$mpg, xlab='Miles Per Gallon', col='blue',main='Histogram')
```

![plot of chunk unnamed-chunk-2](Shiny Presentation-figure/unnamed-chunk-2-1.png)
