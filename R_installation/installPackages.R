options("Ncpus" = 6)

installPackages <- function(pkg) {

  # color consol messages:
  red <- function(x) paste0('\033[31m', x,'\033[39m')
  green <- function(x) paste0('\033[32m', x,'\033[39m')
  yellow <- function(x) paste0('\033[33m', x,'\033[39m')
  blue <- function(x) paste0('\033[34m', x,'\033[39m')


  if (!pkg %in% rownames(installed.packages())) {

    error <- 0
    warn <- 0
    cat(paste0('Installing "', pkg, '"...\n'))
    msg <- tryCatch(expr = {
      utils::install.packages(pkg, quiet = TRUE)
      paste0('Package "', pkg, '" installed.\n')
    },
    error = function(e) {
      error <<- 1
      paste0('Error with "', pkg, '".\n\t', e$message, "\n")
    },
    warning = function(w) {
      warn <<- 1
      paste0('Warning with "', pkg, '":\n\t', w$message, "\n")
    }
    )

    if (error) {
      cat(red(msg))
      return(("ERROR !"))
    } else if (warn) {
      cat(yellow(msg))
      return("Warning")
    } else{
      cat(green(msg))
      return("OK")
    }


  } else{
    msg <- paste0('Package "', pkg, '" already installed.\n')
    cat(blue(msg))
    return("already installed")
  }
}


pkgList <- c(
  "crayon",
  "Rcpp",
  "devtools",
  "roxygen2",
  "testthat",
  "rJava",
  "xlsx",
  "tidyverse", # ggplot2, dplyr...
  "data.table",
  "plotly",
  "DT",
  "rmarkdown",
  "shiny",
  "plumber",
  "htmltools",
  "stringr",
  "digest",
  "RColorBrewer",
  "RCurl",
  "R6",
  "httr",
  "lme4",
  "MASS",
  "markdown",
  "addinslist",
  "colourpicker",
  "assignparams",
  "magick",
  "caret",
  "doParallel",
  "qrcode",
  "BiocManager",
  "markdownInput",
  "xaringan",
  "citr",
  "sass",
  "microbenchmark",
  "profvis",
  "beepr"
)

sapply(pkgList, installPackages)

devtools::install_github("timflutre/rutilstimflutre")
devtools::install_github("juliendiot42/rjdiotperso")
devtools::install_github("juliendiot42/persoJD/myRmdTemplates")

update.packages()
