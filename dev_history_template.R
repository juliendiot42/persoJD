library(devtools)
library(testthat)

#### Only one time ####

# use_git()

# use_r("calculations")
# use_r("date")

# use_build_ignore("dev_history.R")

# use_gpl3_license("Antoine Bichat")

# use_github()
# use_github_links()

# use_testthat()
# use_test("calculations")
# use_test("date")

# use_spell_check()

# use_readme_rmd()

# use_logo("../hex_sotr.png")

# use_lifecycle_badge("experimental")
# badger::badge_last_commit()
# badgecreatr::badge_license()

# use_news_md()

# use_vignette("example")

# use_github_action_check_release()

# use_pkgdown()

# use_github_action("pkgdown")

# use_package_doc()

# use_rcpp()

# use_pipe()

# use_rmarkdown_template("goodtemplate")

# use_r("joke")

# use_addin("joke")

# use_data_raw("irishead")
# use_r("data")

## Add a shiny app
## https://www.mango-solutions.com/packaging-shiny-applications-a-deep-dive/
## http://golemverse.org

# use_dev_package("dadjoke")


#### Used regularly ####

load_all()

document()

use_tidy_description()
attachment::att_to_description()


test()
spell_check()
# spelling::update_wordlist()


check()

goodpractice::goodpractice()
covr::package_coverage()
covr::report()

install()
# build()

# use_github_release()
# usethis::use_version()

#### pkgdown ####

pkgdown::build_site()
# pkgdown::template_navbar()
# pkgdown::template_reference()
pkgdown::clean_site()

