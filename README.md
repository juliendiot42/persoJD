# PersoJD

This repository contains the files I use for work or personal usage.
I provide these files without any warranty, it's a backup that I can access anywhere, but it could be useful for other people.

## [R_installation](R_installation)

contain `installPackages.R` script for downloading some useful `R` packages.

## [myTemplates](myTemplates)

Personal R package containing my R-Markdown, R-project, Shiny application templates.

## [R-StudioConfig](R-StudioConfig)

Contain the R-Studio configuration files:

- Settings
- Snippets
- Personal dictionary

To retrieve my configuration:

```sh
rm -r ~/.config/rstudio
ln -s path/to/persoJD/R-StudioConfig/ ~/.config/rstudio
```

```sh
rm -r ~/rprofile
ln -s path/to/persoJD/.Rprofile ~/.Rprofile
```

## [`.Rprofile`](.Rprofile)

My `.Rprofile` file.

## AutoSyncDirectories

Small code to mirror directories in Windows using `Rsync`. (Does not work very well)
