\name{summary.glmulti}
\alias{summary.glmulti}
\alias{print.glmulti}
\alias{plot.glmulti}

\title{Handling glmulti objects}
\description{
These standard S3 functions can be applied on \code{glmulti} to print a short report, obtain a more detailed summary,
or produce different types of graphics.
}
\usage{
# S3 summary method for class 'glmulti'
\method{summary}{glmulti}(object, ...)

# S3 print method for class 'glmulti'
\method{print}{glmulti}(x, ...)


# S3 plot method for class 'glmulti'
\method{plot}{glmulti}(x, type="p", ...)


}
%- maybe also 'usage' for other objects documented here.
\arguments{
	\item{object}{ A \code{glmulti} object}
	\item{x}{An object of class \code{glmulti}}
	
  	\item{type}{The type of graph to be produced. One of "p", "r", "s" or "w" (see below).}
		
	\item{\dots}{ Further arguments.}
}
\details{
 The name of the returned object is the name of the first object passed, with "consensus-" prepended.
 The \code{params} slot of the returned object is taken from the first object too.
}

\value{

	\code{plot} can be used to have a graphical representation of the results. Two types are proposed: 

\code{type="p"} plots the IC profile (the IC values form the best to the worst model). A horizontal line delineates
models that are less than 2 IC units away from the best model.

\code{type="r"} shows diagnostics of the fit (residuals versus predicted values, and QQ plot of residuals) for the five best models. It calls the \code{plot} functions on the fitted model objects, which should be defined (e.g. \code{plot.lm}, \code{plot.glm}). This type of plot can only be used if model objects are included in the \code{glmulti} object (i.e. if \code{includeobjects} was set to true).

\code{type="s"} plots the relative importance of model terms, i.e. the overall support for each variable across all models.
A vertical line is drawn at 80%, which is a useful landmark.

\code{type="w"} plots the normalized evidence weights of the models. A vertical line delineates models that sum um to 95% of the total weight of evidence.



 \code{print} prints a brief synthesis of the analysis (e.g. the best model found, its IC value and evidence weight...)
 
 \code{summary} returns a list with more detailed elements:
 
  \item{name }{the name of the analysis}
  \item{method }{The method used}
  \item{fitting }{The fitting function used}
  \item{crit }{The IC used}
  \item{level }{Whether interactions between predictors were considered or not}
  \item{marginality }{Whether the marginality rule was applied}
  \item{confsetsize }{The requested size of the confidence set}
  \item{bestic }{The lowest IC found}
  \item{icvalues }{The IC values of the models in the confidence set, from lower to greater}
  \item{bestmodel }{A list containing the formula of the best model found, or of the best models found if several had the same IC value}
  \item{generations }{The number of generations it took to converge. For genetic algorithm only.}
  \item{elapsed }{The actual (system) time it took.  For genetic algorithm only.}
  \item{includeobjects}{A boolean indicating whether fitted model objects are contained in the object.}
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

