library(testthat)
install.packages("shinytest")
shinytest::installDependencies()

library(shinytest)
recordTest("test/shinyrmdessai.Rmd")
