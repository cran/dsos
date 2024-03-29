% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pvalue-asymptotic.R
\name{at_oob}
\alias{at_oob}
\title{Asymptotic Test With Out-Of-Bag Scores}
\usage{
at_oob(x_train, x_test, scorer)
}
\arguments{
\item{x_train}{Training (reference/validation) sample.}

\item{x_test}{Test sample.}

\item{scorer}{Function which returns a named list with outlier scores from
the training and test sample. The first argument to \code{scorer} must be
\code{x_train}; the second, \code{x_test}. The returned named list contains
two elements: \emph{train} and \emph{test}, each of which is a vector of
(outlier) scores. See notes for more information.}
}
\value{
A named list of class \code{outlier.test} containing:
\itemize{
   \item \code{statistic}: observed WAUC statistic
   \item \code{seq_mct}: sequential Monte Carlo test, when applicable
   \item \code{p_value}: p-value
   \item \code{outlier_scores}: outlier scores from training and test set
}
}
\description{
Test for no adverse shift with outlier scores. Like goodness-of-fit testing,
this two-sample comparison takes the training set, \code{x_train} as the
as the reference. The method checks whether the test set, \code{x_test}, is
worse off relative to this reference set. The function \code{scorer} assigns
an outlier score to each instance/observation in both training and test set.
}
\details{
Li and Fine (2010) derives the asymptotic null distribution for the weighted
AUC (WAUC), the test statistic. This approach does not use permutations
and can, as a result, be much faster because it sidesteps the need to refit
the scoring function \code{scorer}. This works well for large samples. The
prefix \emph{at} stands for asymptotic test to tell it apart from the
prefix \emph{pt}, the permutation test.
}
\section{Notes}{

The scoring function, \code{scorer}, predicts out-of-bag scores to mimic
out-of-sample behaviour. The suffix \emph{oob} stands for out-of-bag to
highlight this point. This out-of-bag variant avoids refitting the
underlying algorithm from \code{scorer} at every permutation. It can, as a
result, be computationally appealing.
}

\examples{
\donttest{
library(dsos)
set.seed(12345)
data(iris)
setosa <- iris[1:50, 1:4] # Training sample: Species == 'setosa'
versicolor <- iris[51:100, 1:4] # Test sample: Species == 'versicolor'

# Using fake scoring function
scorer <- function(tr, te) list(train=runif(nrow(tr)), test=runif(nrow(te)))
oob_test <- at_oob(setosa, versicolor, scorer = scorer)
oob_test

}

}
\references{
Kamulete, V. M. (2022).
\emph{Test for non-negligible adverse shifts}.
In The 38th Conference on Uncertainty in Artificial Intelligence. PMLR.

Gandy, A. (2009).
\emph{Sequential implementation of Monte Carlo tests with uniformly bounded resampling risk}.
Journal of the American Statistical Association, 104(488), 1504-1511.
}
\seealso{
[pt_oob()] for (faster) p-value approximation via out-of-bag predictions.
[pt_refit()] for (slower) p-value approximation via refitting.

Other asymptotic-test: 
\code{\link{at_from_os}()}
}
\concept{asymptotic-test}
