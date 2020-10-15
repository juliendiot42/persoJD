# Author: Julien Diot juliendiot@ut-biomet.org
# 2020
#
# Description:
# Functions not not related to the app purpose, yet useful.



#' Get last commit sha hash
getCommitID <- function() {
  if ("git2r" %in% installed.packages()) {
    if (file.exists(".git/")) {
      if (length(git2r::commits()) >= 1) {
        id <- git2r::commits()[[1]]$sha
      } else {
        id <- "No commit"
      }
    } else {
      id <- "No git repo"
    }
  } else{
    id <- "Package git2r not installed"
  }
  id
}

#' Custom box function
#' It is the same function than shinydashboard::box
#' but with a new parameter "boxClass"
myBox <-
  function(...,
           title = NULL,
           footer = NULL,
           status = NULL,
           solidHeader = FALSE,
           background = NULL,
           width = 6,
           height = NULL,
           collapsible = FALSE,
           collapsed = FALSE,
           boxClass = ""){


    boxClass <- paste0("box ", boxClass) # <--- modification here



    if (solidHeader || !is.null(background)) {
      boxClass <- paste(boxClass, "box-solid")
    }
    if (!is.null(status)) {
      shinydashboard:::validateStatus(status)
      boxClass <- paste0(boxClass, " box-", status)
    }
    if (collapsible && collapsed) {
      boxClass <- paste(boxClass, "collapsed-box")
    }
    if (!is.null(background)) {
      shinydashboard:::validateColor(background)
      boxClass <- paste0(boxClass, " bg-", background)
    }
    style <- NULL
    if (!is.null(height)) {
      style <- paste0("height: ", shinydashboard:::validateCssUnit(height))
    }
    titleTag <- NULL
    if (!is.null(title)) {
      titleTag <- h3(class = "box-title", title)
    }
    collapseTag <- NULL
    if (collapsible) {
      buttonStatus <- status %OR% "default"
      collapseIcon <- if (collapsed)
        "plus"
      else
        "minus"
      collapseTag <-
        div(class = "box-tools pull-right",
            tags$button(
              class = paste0("btn btn-box-tool"),
              `data-widget` = "collapse",
              shiny::icon(collapseIcon)
            ))
    }
    headerTag <- NULL
    if (!is.null(titleTag) || !is.null(collapseTag)) {
      headerTag <- div(class = "box-header", titleTag, collapseTag)
    }
    div(
      class = if (!is.null(width))
        paste0("col-sm-", width),
      div(
        class = boxClass,
        style = if (!is.null(style))
          style,
        headerTag,
        div(class = "box-body", ...),
        if (!is.null(footer))
          div(class = "box-footer", footer)
      )
    )
  }
