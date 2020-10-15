# Sample Rprofile.site file

# Things you might want to change
# options(papersize="a4")
# options(editor="C:\\Users\\julie\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe")
# options(pager="internal")

# R interactive prompt
# options(prompt = "> ")
# options(continue = "+ ")
options(continue = "... ")
options(max.print = 500)

# No scientific notation.
options(scipen = 10)

# CRAN repository:
# options(repos = c(CRAN = "https://cran.ism.ac.jp/"))



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

    if (Sys.getenv("TERM") %in% c("xterm-256color", "screen-256color")) {
      # library("colorout") # from git hub: devtools::install_github("jalvesaq/colorout")
      colorout::setOutputColors(normal = 255,number = 33,zero = 33,negnum = 33,infinite = c(3, 0, 33),const = 243,
        index = 243,false = 203,true = 40,date = 184,string = 2,zero.limit = NA,stderror = 255,
        warn = c(1, NA, 202), error = c(160, 231), verbose = FALSE)
    }

    red <- function(x) paste0('\033[31m', x,'\033[39m')
    green <- function(x) paste0('\033[32m', x,'\033[39m')
    yellowItalic <- function(x) paste0('\033[33m\033[3m', x,'\033[23m\033[39m')
    blue <- function(x) paste0('\033[34m', x,'\033[39m')

    cat(paste0(
      green(paste("\nWelcome", Sys.info()["user"], "!!! - ")),
      yellowItalic(format(Sys.time(), "%a %B %d %Y, %H:%M:%S")), "\n",
      "  - ", version$version.string, "\n",
      "  - CRAN repository:\n",
      "\t",options("repos"),"\n",
      "  - Packages library path:\n",paste0("\t",.libPaths(), collapse = "\n"),"\n\n",
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

if ("languageserversetup" %in% rownames(utils::installed.packages())) {
  # LanguageServer Setup Start (do not change this chunk)
  # to remove this, run languageserversetup::remove_from_rprofile
  options(langserver_library = '/home/julien/languageserver-library')
  languageserversetup::languageserver_startup()
  unloadNamespace('languageserversetup')
  # LanguageServer Setup End
}

