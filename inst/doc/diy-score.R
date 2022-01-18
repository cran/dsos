## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE
)

library("dsos")

## ----score-isolated-points, message=FALSE, warning=FALSE----------------------
dsos:::outliers_no_split

## ----dsos-permutation, message=FALSE, warning=FALSE---------------------------
dsos::od_pt

## ----iris-od------------------------------------------------------------------
set.seed(12345)
data(iris)
x_train <- iris[1:50,1:4] # Training sample: Species == 'setosa'
x_test <- iris[51:100,1:4] # Test sample: Species == 'versicolor'
iris_test <- od_pt(x_train, x_test)
plot(iris_test)

