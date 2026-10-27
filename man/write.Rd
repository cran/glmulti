\name{write}
\alias{write}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Writing glmulti objects}
\description{
 The S4 method provided for \code{glmulti} objects 
  writes a \code{glmulti} object as a data.frame, or alternatively as a raw R object.
}
\usage{
write(x, file = "data",
	ncolumns = if (is.character(x)) 1 else 5,
	append = FALSE,
	sep = " "
	)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{An object of class glmulti }
  \item{file}{The name of the file to write into. If missing, the name is taken to be the name of the \emph{glmulti} object.*
	If "\\object" is at the end of the filename, then the object is written as a raw R object using \emph{.saveRDS}.
  }
  \item{ncolumns}{Not used with \emph{glmulti} objects }
  \item{append}{ Whether to append the output to the file, if existing. }
  \item{sep}{ The character to be used to separate columns.}
}
\details{
    When using "\\object", the file written can be read directly from R using \emph{.readRDS}, or with \emph{consensus}.
}
\value{
 A data.frame.  Rows correspond to all models, sorted from best to worse.. The first columns
  indicate whether the different terms are found in the formula of each model (0/1). The next columns contain model complexity (K), model IC, and model formula (as a character string).

}

\author{Vincent Calcagno, McGill University }

\seealso{  \code{\link{glmulti}}, \code{\link{consensus}} }

\keyword{IO}


