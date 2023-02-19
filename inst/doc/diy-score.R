## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE
)

library("dsos")

## ----iris-od------------------------------------------------------------------
set.seed(12345)
data(iris)
x_train <- iris[1:50, 1:4] # Training sample: Species == 'setosa'
x_test <- iris[51:100, 1:4] # Test sample: Species == 'versicolor'
scorer <- function(tr, te) list(train = runif(nrow(tr)), test = runif(nrow(te)))
iris_test <- pt_refit(x_train, x_test, score = scorer)
plot(iris_test)

