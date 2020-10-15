# Author: Julien Diot juliendiot@ut-biomet.org
# 2020
#
# Description:
# ui file of the app module: "menu 2"

tabItem(tabName = "menu2",
        fluidRow(
          shinydashboard::box(
            width = 4,
            height = "100%",
            title = "Input",
            div(
              id = "inputDiv",
              class = "divClass",
              h1("Menu 2"),
              sliderInput("bins",
                          "Number of bins:",
                          min = 1,
                          max = 50,
                          value = 30)
            )
          ),
          shinydashboard::box(
            width = 8,
            title = "Output",
            div(
              id = "output",
              # class = "divClass",
              plotOutput("distPlot")
            )
          ),

          myBox(
            width = 12,
            title = "Debug",
            boxClass = "debug",
            div(
              id = "output",
              verbatimTextOutput("debug1")
            )
          )

        )

)

