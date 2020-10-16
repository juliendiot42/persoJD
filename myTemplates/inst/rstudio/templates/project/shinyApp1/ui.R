# Author: Julien Diot juliendiot@ut-biomet.org
# 2020
#
# Description:
# main UI file for the application
# this file contain the main structure of the GUI and source
# the ui of the app modules


shinyUI(
    dashboardPage(
        title = APP_TITLE,
        skin = "black",

        # app title
        dashboardHeader(
            title = tagList(shiny::icon("gear", "fa-2x"),
                            paste("\t", APP_TITLE)),
            titleWidth = W_sideBar
        ),

        # dashboard sidebar items
        dashboardSidebar(
            width = W_sideBar,
            sidebarMenu(
                id = "leftMenu",
                menuItem("Menu 1 title",
                         tabName = "menu1",
                         icon = icon("leaf")),
                menuItem("Menu 2 title",
                         tabName = "menu2",
                         icon = icon("leaf"))
            )
        ),


        # dashboard body
        dashboardBody(
            # javascript function
            tags$head(
                tags$link(rel = "stylesheet",
                          type = "text/css",
                          href = "appStyle.css"), # in www folder
                tags$link(rel = "stylesheet",
                          href = "https://fonts.googleapis.com/css?family=Nunito")
            ),

            tabItems(tabItem(tabName = "hidden", useShinyjs())),
            # load all file from "src/ui"
            do.call(tabItems,
                    lapply(
                        list.files("src/ui/", full.names = TRUE),
                        function(f){
                            source(f, local = TRUE, encoding = "UTF-8")$value
                        }))
            # tabItems(
            # source("src/ui/ui_menu1.R", local = TRUE, encoding = "UTF-8")$value,
            # source("src/ui/ui_menu2.R", local = TRUE, encoding = "UTF-8")$value
            # )
        )
    ) # close dashboardPage
) # close shinyUI
