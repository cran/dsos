## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE
)

library("dsos")

## ----score-isolated-points, message=FALSE, warning=FALSE----------------------
dsos::score_od

## ----dsos-permutation, message=FALSE, warning=FALSE---------------------------
dsos::pt_refit

## ----iris-od------------------------------------------------------------------
set.seed(12345)
data(iris)
x_train <- iris[1:50,1:4] # Training sample: Species == 'setosa'
x_test <- iris[51:100,1:4] # Test sample: Species == 'versicolor'
iris_test <- pt_refit(x_train, x_test, score = dsos::score_od)
plot(iris_test)

