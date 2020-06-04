# This function will be called when the user invokes
# the New Project wizard using the project template defined in the template file
# at:
#
#   inst/rstudio/templates/project/statProj.dcf
#
createStatProject <- function(path, ...) {

  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # collect inputs
  params <- list(...)

  # create "data" dir
  if (params[["data"]]) {
    directory <- paste0(path, "/data")
    dir.create(directory, recursive = TRUE, showWarnings = FALSE)
  }

  # create "output" dir
  if (params[["output"]]) {
    directory <- paste0(path, "/output")
    dir.create(directory, recursive = TRUE, showWarnings = FALSE)
  }

  # create "src" dir
  if (params[["src"]]) {
    directory <- paste0(path, "/src")
    dir.create(directory, recursive = TRUE, showWarnings = FALSE)
  }

  # create "test" dir
  if (params[["data"]]) {
    directory <- paste0(path, "/test")
    dir.create(directory, recursive = TRUE, showWarnings = FALSE)
  }

  # create "tmp" dir
  if (params[["data"]]) {
    directory <- paste0(path, "/tmp")
    dir.create(directory, recursive = TRUE, showWarnings = FALSE)
  }

  # create analysis.R file
  file <- paste0(path, "/analysis.R")
  file.create(file)

}
