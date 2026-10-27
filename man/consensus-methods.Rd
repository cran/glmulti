\name{consensus-methods}
\docType{methods}
\alias{consensus-methods}
\alias{consensus,list-method}
\title{ Consensus method for glmulti objects.}
\description{
 Concatenates several \code{glmulti} objects and makes a consensus of them. 
}
\section{Methods}{
\describe{

\item{xs = "list"}{ a list of \code{glmulti} objects to make a consensus of. Can include actual objects or filenames pointing to objects written on the disk
  (typically \code{glmulti} objects that have been saved using \code{write} with \code{file="filename|object"}).}
}}
\keyword{methods}

