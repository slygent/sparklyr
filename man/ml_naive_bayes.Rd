% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ml_naive_bayes.R
\name{ml_naive_bayes}
\alias{ml_naive_bayes}
\title{Spark ML -- Naive-Bayes}
\usage{
ml_naive_bayes(x, response, features, lambda = 0, ml.options = ml_options(),
  ...)
}
\arguments{
\item{x}{An object coercable to a Spark DataFrame (typically, a
\code{tbl_spark}).}

\item{response}{The name of the response vector (as a length-one character
vector), or a formula, giving a symbolic description of the model to be
fitted. When \code{response} is a formula, it is used in preference to other
parameters to set the \code{response}, \code{features}, and \code{intercept}
parameters (if available). Currently, only simple linear combinations of
existing parameters is supposed; e.g. \code{response ~ feature1 + feature2 + ...}.
The intercept term can be omitted by using \code{- 1} in the model fit.}

\item{features}{The name of features (terms) to use for the model fit.}

\item{lambda}{The (Laplace) smoothing parameter. Defaults to zero.}

\item{ml.options}{Optional arguments, used to affect the model generated. See
\code{\link{ml_options}} for more details.}

\item{...}{Optional arguments; currently unused.}
}
\description{
Perform regression or classification using naive bayes.
}
\seealso{
Other Spark ML routines: \code{\link{ml_als_factorization}},
  \code{\link{ml_decision_tree}},
  \code{\link{ml_generalized_linear_regression}},
  \code{\link{ml_gradient_boosted_trees}},
  \code{\link{ml_kmeans}}, \code{\link{ml_lda}},
  \code{\link{ml_linear_regression}},
  \code{\link{ml_logistic_regression}},
  \code{\link{ml_multilayer_perceptron}},
  \code{\link{ml_one_vs_rest}}, \code{\link{ml_pca}},
  \code{\link{ml_random_forest}},
  \code{\link{ml_survival_regression}}
}

