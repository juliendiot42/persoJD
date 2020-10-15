# Author: Julien Diot juliendiot@ut-biomet.org
# 2020
#
# Description:
# server file of the app module: "menu 2"

output$distPlot <- renderPlot({

  # generate bins based on input$bins from ui.R
  x    <- faithful[, 2]

  bins <- seq(min(x), max(x), length.out = input$bins + 1)

  # draw the histogram with the specified number of bins
  hist(x, breaks = bins, col = 'darkgray', border = 'white')

})


output$debug1 <- renderPrint({

  print("input$bins:")
  print(input$bins)

})
