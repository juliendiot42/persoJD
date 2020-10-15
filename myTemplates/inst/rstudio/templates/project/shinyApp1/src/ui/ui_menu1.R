# Author: Julien Diot juliendiot@ut-biomet.org
# 2020
#
# Description:
# ui file of the app module: "menu 1"

tabItem(tabName = "menu1",
        # lines 1  ----
        fluidRow(
            shinydashboard::box(width = 3,
              title = "Buttons",

              actionButton("action", "Action")
            ),

            shinydashboard::box(width = 3,
              title = "Single checkbox",

              checkboxInput("checkbox",
                            "Choice A", value = TRUE)
            ),

            shinydashboard::box(width = 3,
              title = "Checkbox group",
              checkboxGroupInput("checkGroup",
                                 "Select several:",
                                 choices = list(
                                   "Choice 1" = 1,
                                   "Choice 2" = 2,
                                   "Choice 3" = 3
                                 ),
                                 selected = 1)
              ),

            shinydashboard::box(width = 3,
              title = "Date input",

              dateInput("date",
                        "Set date:",
                        value = "2014-01-01"))
        ),


        # lines 2  ----
        fluidRow(
          shinydashboard::box(width = 3,
                              title = "Date range",
                 dateRangeInput("dates", "From, to:")),

          shinydashboard::box(width = 3,
                              title = "File input",
                 fileInput("file", "Upload file:")),

          shinydashboard::box(width = 3,
                              title = "Help text",
                 helpText("Note: help text isn't a true widget,",
                          "but it provides an easy way to add text to",
                          "accompany other widgets.")),

          shinydashboard::box(width = 3,
                              title = "Numeric input",
                 numericInput("num",
                              "Value:",
                              value = 1))

        ),
        # lines 3  ----

        fluidRow(
          shinydashboard::box( width = 3,
                               title = "Radio buttons",
                 radioButtons(
                   "radio",
                   "Select one:",
                   choices = list(
                     "Choice 1" = 1,
                     "Choice 2" = 2,
                     "Choice 3" = 3
                   ),
                   selected = 1
                 )),

          shinydashboard::box( width = 3,
                               title = "Select box",
                 selectInput(
                   "select",
                   "Select in list:",
                   choices = list(
                     "Choice 1" = 1,
                     "Choice 2" = 2,
                     "Choice 3" = 3
                   ),
                   selected = 1
                 )),

          shinydashboard::box( width = 3,
                               title = "Sliders",
            sliderInput(
              "slider1",
              "Value:",
              min = 0,
              max = 100,
              value = 50
            ),
            sliderInput(
              "slider2",
              "Value from, to: ",
              min = 0,
              max = 100,
              value = c(25, 75)
            )
          ),

          shinydashboard::box( width = 3, title = "Text input",
                 textInput("text", "Your text:",
                           value = "Enter text..."))
        )

)
