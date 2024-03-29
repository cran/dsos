% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pvalue-asymptotic.R
\name{at_from_os}
\alias{at_from_os}
\title{Asymptotic Test from Outlier Scores}
\usage{
at_from_os(os_train, os_test)
}
\arguments{
\item{os_train}{Outlier scores in training (reference) set.}

\item{os_test}{Outlier scores in test set.}
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

The outlier scores should all mimic out-of-sample behaviour. Mind that the
training scores are not in-sample and thus, biased (overfitted) while the
test scores are out-of-sample. The mismatch -- in-sample versus out-of-sample
scores -- voids the test validity. A simple fix for this is to get the
training scores from an indepedent (fresh) validation set; this follows
the train/validation/test sample splitting convention and the validation set
is effectively the reference set or distribution in this case.
}

\examples{
\donttest{
library(dsos)
set.seed(12345)
os_train <- rnorm(n = 100)
os_test <- rnorm(n = 100)
test_result <- at_from_os(os_train, os_test)
test_result
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
[at_oob()] for variant requiring a scoring function.
[pt_from_os()] for permutation test with the outlier scores.

Other asymptotic-test: 
\code{\link{at_oob}()}
}
\concept{asymptotic-test}
