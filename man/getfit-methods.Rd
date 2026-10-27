\name{getfit-methods}
\docType{methods}
\alias{getfit-methods}
\alias{getfit,ANY-method}
\alias{getfit,coxph-method}
\alias{getfit,coxph.null-method}
\title{ Methods for Function getfit}
\description{
 Used by \code{coef.glmulti} to access the contents of fitted model objects of different classes.
}
\section{Methods}{
\describe{

\item{object = "ANY"}{ Default method, for e.g. \code{glm} objects. }

\item{object = "coxph"}{ Method for \code{coxph} objects. }

\item{object = "coxph.null"}{ Method for \code{coxph.null} objects.}

}}
\keyword{methods}
