source("renv/activate.R")

options(
  # repos = c(CRAN = "https://packagemanager.rstudio.com/all/latest"),
  install.packages.compile.from.source = "never"
)
renv::install("jsonlite")
renv_deps <- names(jsonlite::read_json("renv.lock")$Packages)
renv::load()
renv::restore(prompt = FALSE)
can_be_updated <- renv::update(setdiff(renv_deps, "renv"), prompt = FALSE, check = FALSE)
renv::snapshot(packages = renv_deps, prompt = FALSE)
