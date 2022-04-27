# This function will be called when the user invokes
# the New Project wizard using the project template defined in the template file
# at:
#
#   inst/rstudio/templates/project/xxxx.dcf
#
createStatProject <- function(path, ...) {

  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # collect inputs
  params <- list(...)

  # create new folders
  newFolders <- c('data', 'output', 'src', 'test', 'tmp')
  for (folder in newFolders) {
    if (params[[folder]]) {
      directory <- paste0(path, "/", folder)
      dir.create(directory, recursive = TRUE, showWarnings = FALSE)
    }
  }

  # create analysis.R file
  file <- paste0(path, "/analysis.R")
  file.create(file)

}


createShinyProject <- function(path, ...) {
  templateAppPath <- system.file("rstudio/templates/project/shinyApp1/",
                                 package = "JD.Templates")
  R.utils::copyDirectory(templateAppPath, path)
}


