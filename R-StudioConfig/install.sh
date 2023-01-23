



# keybidings
rm ~/.config/rstudio/keybindings
ln -s "$(pwd)"/keybindings/ ~/.config/rstudio/keybindings

# snippets
rm ~/.config/rstudio/snippets
ln -s "$(pwd)"/snippets/ ~/.config/rstudio/snippets

# themes
rm ~/.config/rstudio/themes
ln -s "$(pwd)"/themes/ ~/.config/rstudio/themes

# rstudio-prefs.json
rm ~/.config/rstudio/rstudio-prefs.json
ln -s "$(pwd)"/rstudio-prefs.json ~/.config/rstudio/rstudio-prefs.json
