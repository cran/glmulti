\name{aic}
\alias{aic}
\alias{aicc}
\alias{bic}
\alias{qaic}
\alias{qaicc}
\title{ Computing an IC from a fitted model object}
\description{
These functions are used by \code{glmulti} to compute Information Criteria from a fitted model object.
They are S4 generics, currently with methods for \code{glm}/\code{lm} objects.
You may define your own methods if needed, to support other fitting functions or to use other IC.
}
\usage{
aic(object, ...)
aicc(object, ...)
bic(object, ...)
qaic(object, ...)
qaicc(object, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{A fitted model object.}
  \item{...}{Further arguments that may be useful for future methods.}
}
\details{
 When using \code{qaic} or \code{qaicc}, you will need to provide an estimate of the inflation factor \emph{c}.
 This is done through the global variable \code{glmultiqaiccvalue}. Set this varaible equal to your estimated \emph{c} before running \code{glmulti}. 
 Otherwise it will stop with a warning.
}
\value{
 The IC value of the model.
}

\author{Vincent Calcagno, McGill University}

\seealso{ 

\code{\link{glmulti}}

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models }
\keyword{regression }


