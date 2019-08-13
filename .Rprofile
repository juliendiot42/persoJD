# Sample Rprofile.site file

# Things you might want to change
# options(papersize="a4")
options(editor="C:\\Users\\julie\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe")
# options(pager="internal")

# R interactive prompt
# options(prompt="> ")
# options(continue="+ ")
options(continue="... ")

# to prefer Compiled HTML
# help options(chmhelp=TRUE)
# to prefer HTML help
# options(htmlhelp=TRUE)

# General options
# options(tab.width = 4)
# options(width = 130)
# options(graphics.record=TRUE)
# options(stringsAsFactors=FALSE)

# CRAN repository:
options(repos = c(CRAN = "https://cran.ism.ac.jp/"))

# quit without asking to save workspace image
utils::assignInNamespace(
  "q",
  function (save = "no", ...) {
    quit(save = save, ...)
  }
  , "base")


.First <- function(){
  if(interactive()){
    library(utils)

    red <- function(x) paste0('\033[31m', x,'\033[39m')
    green <- function(x) paste0('\033[32m', x,'\033[39m')
    yellowItalic <- function(x) paste0('\033[33m\033[3m', x,'\033[23m\033[39m')
    blue <- function(x) paste0('\033[34m', x,'\033[39m')

    cat(paste0(
      green("\nWelcome Julien !!! - "),
      yellowItalic(date()), "\n",
      "  - CRAN repository:\n",
      "\t",options("repos"),"\n",
      "  - Packages library path:\n",paste0("\t",.libPaths(), collapse = "\n"),"\n\n",
      "  - 'stringsAsFactors' is \"", options("stringsAsFactors"),"\".\n",
      "  - 'q()' will not save the workspace image.\n",
      "  - Working directory: ", getwd(), "\n",
      "\n"))

    remove(red, green , yellowItalic , blue)
  }
}

.Last <- function(){

  red <- function(x) paste0('\033[31m', x,'\033[39m')
  yellowItalic <- function(x) paste0('\033[33m\033[3m', x,'\033[23m\033[39m')

  cat(paste0(
    red("\nGoodbye Julien, see you soon ! - "),
    yellowItalic(date()), "\n"
  ))

}
