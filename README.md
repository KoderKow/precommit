
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Useful git pre-commit hooks for R related projects

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/lorenzwalthert/pre-commit-hooks.svg?branch=master)](https://travis-ci.org/lorenzwalthert/precommit)
[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
<!-- badges: end -->

[Pre-commit hooks](https://pre-commit.com) are tests that run each time
you attempt to commit. If the tests pass, the commit will be made,
otherwise not. A very basic test is to check if the code is parsable,
making sure you have not forgotten a comma, brace or quote.

The goal of this package is to twofold:

  - Provide a set of hooks that are useful when your git repo contains R
    code. You can find them under `vignette("available-hooks")`.

  - Provide [usethis](https://github.com/r-lib/usethis)-like
    functionality for common tasks such as installation and set-up and
    config file modification.

## Installation

Please make sure you have conda installed. The rest can be handled from
R:

``` r
# once on your system
remotes::install_github("lorenzwalthert/precommit")
precommit::install_precommit()

# once in every git repo either
# * after cloning a repo that already uses pre-commit or
# * if you want introduce pre-commit to this repo
precommit::use_precommit()
```

This installs pre-commit and performs some other set-up tasks. If you
don’t want to use conda, see `vignette("manual-installation")` for
alternative installation methods.

## Usage

The next time you run `git commit`, the hooks listed in your
`.pre-commit-config.yaml` will get executed before the commit. The
helper function `precommit::open_config()` let’s you open the
`.pre-commit-config.yaml` conveniently from the RStudio console. When
any file is changed due to running a hook, the commit will fail. You can
inspect the changes introduced by the hook and if satisfied, you can
attempt to commit again. If all hooks pass, the commit is made. You can
also [temporarily disable
hooks](https://pre-commit.com/#temporarily-disabling-hooks). If you
succeed, it should look like this:

![](man/figures/screenshot.png)<!-- -->

See the hooks provided by this repo under `vignette("available-hooks")`.
You can also add other hooks from other repos, by extending the
`.pre-commit-config.yaml` file, e.g. like this:

``` yaml
-   repo: https://github.com/pre-commit/precommit
    rev: v1.2.3
    hooks: 
    -   id: check-added-large-files
```

To update the hook revisions, just run `pre-commit autoupdate` in your
terminal of `precommit::autoupdate()`.

## Caution

**Do not abort while hooks are running.** Non-staged changes are stashed
to a temp directory when the hooks are run and may not easily be
recovered afterwards.

## Documentation

The [online
documentation](https://lorenzwalthert.github.io/precommit/index.html) of
this package only covers the functionality added on top of pre-commit by
this package. Everything else is covered in the extensive [online
documentation](https://pre-commit.com) of the pre-commit framework
itself, including how to:

  - create pre-push hooks
  - create local hooks
  - and more
