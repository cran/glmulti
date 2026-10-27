\name{glmulti-methods}
\docType{methods}
\alias{glmulti-methods}
\alias{glmulti,ANY,ANY,ANY,ANY-method}
\alias{glmulti,character,character,ANY,ANY-method}
\alias{glmulti,character,missing,ANY,missing-method}
\alias{glmulti,formula,missing,ANY,missing-method}
\alias{glmulti,glm,missing,ANY,missing-method}
\alias{glmulti,lm,missing,ANY,missing-method}
\alias{glmulti,missing,ANY,ANY,ANY-method}
\alias{glmulti,list,ANY,ANY,ANY-method}
\title{ Methods for Function glmulti: different ways to call glmulti}
\description{
\code{glmulti} finds what are the \code{n} best models (the confidence set of models) among all possible models (the candidate set, as specified by the user).
Models are fitted with the specified fitting function (default is \code{glm}) and are ranked with the specified Information Criterion (default is \code{aic}).
The best models are found either through exhaustive screening of the candidates or using a genetic algorithm, which allows very large candidate sets to be adressed.
The output can be used for model selection, variable selection, and multimodel inference.
}
\section{Methods}{
\describe{

\item{y = "ANY", xr = "ANY", data = "ANY", exclude = "ANY"}{ This will stop with a warning that an improper call has been attempted. }

\item{y = "character", xr = "character", data = "ANY", exclude = "ANY"}{ Calling \code{glmulti} by providing the names of the response variable and of the predictors as
character strings. This is the original interface used in versions earlier than 0.6-1. }

\item{y = "character", xr = "missing", data = "ANY", exclude = "missing"}{
 Calling \code{glmulti} with a model formula represented as a character string. E.g. \code{"u~c+x"}}

\item{y = "formula", xr = "missing", data = "ANY", exclude = "missing"}{ 
Calling \code{glmulti} with a model formula containing all the terms to be included in candidate models.
 E.g. \code{u~c+x}}
 
\item{y = "list", xr = "ANY", data = "ANY", exclude = "ANY"}{
Calling \code{glmulti} on a list of (fitted) model objects. Models will not be refitted, but the information criteria will be computed and a regular \code{glmulti} object is returned.}

\item{y = "glm", xr = "missing", data = "ANY", exclude = "missing"}{ 
Calling \code{glmulti} with a \code{glm} object from which the formula and other parameters will eb extracted. }

\item{y = "lm", xr = "missing", data = "ANY", exclude = "missing"}{ 
Calling \code{glmulti} with a \code{lm} model from which the formula and other parameters will eb extracted.. }

\item{y = "missing", xr = "ANY", data = "ANY", exclude = "ANY"}{
If \code{y} is missing the \code{glmulti} version currently used is printed.}

}
}
\keyword{methods}

