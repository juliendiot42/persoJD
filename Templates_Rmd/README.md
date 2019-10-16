# `Rmarkdown` templates

This repository contains my `Rmarkdown` templates

## Installation

The content of this repo must be copied in the `Rmarkdown` package folder. For example:
```
C:/Program Files/R/R-3.6.1/library/rmarkdown/rmarkdown/templates
```

You can use the `.libPaths()` R function to get the library trees within which packages are looked for.


## Tips & Tricks

A simple copy will not update the template when working on this GitHub repository. A solution is to create a symbolic link. For example with windows `cmd`:
```
mklink /j C:/Program Files/R/R-3.6.1/library/rmarkdown/rmarkdown/templates\JD_simpleReport  ~~\GitRepos\persoJD\Templates_Rmd\JD_simpleReport
```