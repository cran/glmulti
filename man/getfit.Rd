\name{getfit}
\alias{getfit}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Accessing coefficients of a fitted model object}
\description{
Generic S4 function used to access the coefficients (and their standard error) from a fitted model.
It is used by \code{coef.glmulti}. 
}
\usage{
getfit(object, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{A fitted model object, of class \code{glm}, \code{lm} or \code{glm.nb}}
  
  \item{\dots}{ Further arguments that may be required by some methods of this generic.}
}
\details{
 Define your own method for this generic when using \code{glmulti} with some custom fitting function.
}
\value{
  A data.frame, with as rows the coefficients that are fitted in the model,
  and three columns: the first with the estimated coefficients, the second with the associated standard errors, and the third with degrees of freedom.
 
}
\references{Calcagno & de Mazancourt 2010 J. Stat. Soft. v34 i12. See http://www.jstatsoft.org/v34/i12}

\author{ Vincent Calcagno, McGill University}

\seealso{ \code{\link{glmulti}}}
