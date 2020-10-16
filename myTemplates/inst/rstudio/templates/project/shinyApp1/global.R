# Author: Julien Diot juliendiot@ut-biomet.org
# 2020
#
# Description:
# global file for the application


#### OPTIONS ####
options(stringsAsFactors = FALSE)

#### PACKAGES ####
library(shiny)
library(shinydashboard) # dashboards with 'Shiny'
# library("shinydashboardPlus") # https://rinterface.com/shiny/shinydashboardPlus/
# library(shinycssloaders) # Loading Animations
library(shinyjs) # javascript in shiny
stopifnot("sass" %in% installed.packages()) # use of SASS for generating CSS

# library(plotly) # interactive graph
# library(DT) # interactive tables



#### Functions ####
# load all file from "src/functions"
lapply(list.files("src/functions/",
                  pattern = ".R$",
                  full.names = TRUE), source)


#### Compile CSS style sheet ####
sass::sass(input = sass::sass_file("www/appStyle.scss"),
           output = "www/appStyle.css")




#### Global Variables ####
APP_VERSION <- "0.0.0"
COMMIT_ID <- getCommitID()

APP_TITLE <- "My App"
AUTHOR <- "Julien Diot"

## UI related variables ##
W_sideBar <- 300
