\name{consensus}
\alias{consensus}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Takes a consensus of several glmulti objects}
\description{
The function takes a list of \code{glmulti} objects and returns a new \code{glmulti} object.
This object contains the best models found in all passed objects, with duplicates removed.
Useful to bring back together the different parts of a parallelized exhaustive screen, or to make the consensus
of several replicate genetic algorithms.
}
\usage{
consensus(xs, confsetsize = NA, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{xs}{ A list containing \code{glmulti} objects, or filenames from which \code{glmulti} objects can be read on the disk
  (typically \code{glmulti} objects that have been saved using \code{write} with \code{file="filename|object"}).  }
  \item{confsetsize}{The number of best models to be included in the consensus object. If \code{NA}, all available models are included.}
  \item{\dots}{ Further arguments, allowing to write custom S4 methods for this generic.}
}
\details{
 The name of the returned object is the name of the first object passed, with "consensus-" prepended.
 The \code{params} slot of the returned object is taken from the first object too.
 Note that if not all \code{glmulti} objects in xs do contain fitted model objects, then no model object will be included in the returned \code{glmulti} object.
}
\value{
 A standard object of class \code{glmulti}
}
\references{Calcagno & de Mazancourt 2010 J. Stat. Soft. v34 i12. See http://www.jstatsoft.org/v34/i12}

\author{Vincent Calcagno, McGill University}

\seealso{ 

\code{\link{glmulti}}

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models }
\keyword{regression }

