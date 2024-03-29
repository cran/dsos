% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dsos-s3.R
\name{plot.outlier.bayes}
\alias{plot.outlier.bayes}
\title{Plot Bayesian test for no adverse shift.}
\usage{
\method{plot}{outlier.bayes}(x, ...)
}
\arguments{
\item{x}{A \code{outlier.bayes} result from test of no adverse shift.}

\item{...}{Placeholder to be compatible with S3 method \code{plot}.}
}
\value{
A \pkg{ggplot2} plot with outlier scores and p-value.
}
\description{
Plot Bayesian test for no adverse shift.
}
\examples{
\donttest{
set.seed(12345)
os_train <- rnorm(n = 3e2)
os_test <- rnorm(n = 3e2)
test_to_plot <- bf_from_os(os_train, os_test)
plot(test_to_plot)
}

}
\seealso{
Other s3-method: 
\code{\link{plot.outlier.test}()},
\code{\link{print.outlier.bayes}()},
\code{\link{print.outlier.test}()}
}
\concept{s3-method}
