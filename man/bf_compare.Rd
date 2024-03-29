% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bayes-factor.R
\name{bf_compare}
\alias{bf_compare}
\title{Bayesian and Frequentist Test from Outlier Scores}
\usage{
bf_compare(os_train, os_test, threshold = 1/12, n_pt = 4000)
}
\arguments{
\item{os_train}{Outlier scores in training (reference) set.}

\item{os_test}{Outlier scores in test set.}

\item{threshold}{Threshold for adverse shift. Defaults to 1 / 12,
the asymptotic value of the test statistic when the two samples are drawn
from the same distribution.}

\item{n_pt}{The number of permutations.}
}
\value{
A list of factors (BF) for 3 different test specifications:
\itemize{
   \item \code{frequentist}: Frequentist BF.
   \item \code{bayes_noperm}: Bayestion BF test with asymptotic threshold.
   \item \code{bayes_perm}: Bayestion BF with exchangeable threshold.
}
}
\description{
Test for no adverse shift with outlier scores. Like goodness-of-fit testing,
this two-sample comparison takes the training (outlier) scores,
\code{os_train}, as the reference. The method checks whether the test
scores, \code{os_test}, are worse off relative to the training set.
}
\details{
This compares the Bayesian to the frequentist approach for convenience.
The Bayesian test mimics `bf_from_os()` and the frequentist one,
`pt_from_os()`. The Bayesian test computes Bayes factors based on the
asymptotic (defaults to 1/12) and the exchangeable threshold. The latter
calculates the threshold as the median weighted AUC (WAUC) after \code{n_pt}
permutations assuming outlier scores are exchangeable. This is recommended
for small samples. The frequentist test converts the one-sided (one-tailed)
p-value to the Bayes factor - see \code{as_bf} function.
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
bayes_test <- bf_compare(os_train, os_test)
bayes_test
# To run in parallel on local cluster, uncomment the next two lines.
# library(future)
# future::plan(future::multisession)
parallel_test <- bf_compare(os_train, os_test)
parallel_test
}

}
\seealso{
[bf_from_os()] for bayes factor, the Bayesian test.
[pt_from_os()] for p-value, the frequentist test.

Other bayesian-test: 
\code{\link{as_bf}()},
\code{\link{as_pvalue}()},
\code{\link{bf_from_os}()}
}
\concept{bayesian-test}
