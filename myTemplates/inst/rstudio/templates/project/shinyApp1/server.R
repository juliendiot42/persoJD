# Author: Julien Diot juliendiot@ut-biomet.org
# 2020
#
# Description:
# main server file for the application
# this file sources the other server files of the app modules


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    # load all file from "src/server"
    lapply(list.files("src/server/", full.names = TRUE),
           function(f) {
               source(f, local = TRUE, encoding = "UTF-8")$value
           })
})
