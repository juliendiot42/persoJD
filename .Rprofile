# Sample Rprofile.site file

# Things you might want to change
# options(papersize="a4")
# options(editor="C:\\Users\\julie\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe")
# options(pager="internal")

# R interactive prompt
# options(prompt = "> ")
# options(continue = "+ ")
options(continue = "... ")

# to prefer Compiled HTML
# help options(chmhelp = TRUE)
# to prefer HTML help
# options(htmlhelp = TRUE)

# General options
# options(tab.width = 4)
# options(width = 130)
# options(graphics.record = TRUE)
# options(stringsAsFactors = FALSE)

# CRAN repository:
options(repos = c(CRAN = "https://cran.ism.ac.jp/"))



# increase number of CPU for package installation:
options(Ncpus = max(as.numeric(system("nproc", intern = TRUE)) - 2, 1))

if (interactive()) { # ! important

  # quit without asking to save workspace image
  utils::assignInNamespace(
    "q",
    function(save = "no", ...) {
      quit(save = save, ...)
    }
    , "base")

  .First <- function(){

    red <- function(x) paste0('\033[31m', x,'\033[39m')
    green <- function(x) paste0('\033[32m', x,'\033[39m')
    yellowItalic <- function(x) paste0('\033[33m\033[3m', x,'\033[23m\033[39m')
    blue <- function(x) paste0('\033[34m', x,'\033[39m')

    cat(paste0(
      green(paste("\nWelcome", system("whoami", intern = T), "!!! - ")),
      yellowItalic(format(Sys.time(), "%a %B %d %Y, %H:%M:%S")), "\n",
      "  - CRAN repository:\n",
      "\t",options("repos"),"\n",
      "  - Packages library path:\n",paste0("\t",.libPaths(), collapse = "\n"),"\n\n",
      "  - 'stringsAsFactors' is \"", options("stringsAsFactors"),"\".\n",
      "  - 'Ncpus' is \"", options("Ncpus"),"\" for packages instalations.\n",
      "  - 'q()' will not save the workspace image.\n",
      "  - Working directory: ", getwd(), "\n",
      "\n"))

    remove(red, green , yellowItalic , blue)

  }

  .Last <- function(){

    red <- function(x) paste0('\033[31m', x,'\033[39m')
    yellowItalic <- function(x) paste0('\033[33m\033[3m', x,'\033[23m\033[39m')

    cat(paste0(
      red(paste0("\nGoodbye ", system("whoami", intern = T),
                 ", see you soon ! - ")),
      yellowItalic(date()), "\n"
    ))
  }
}

}
