\name{coef.glmulti}
\alias{predict.glmulti}
\alias{coef.glmulti}

\title{Model averaging and multimodel inference with glmulti}
\description{
These functions, applied on a \code{glmulti} object, produce model-averaged estimates, unconditional confidence intervals, and predictions
from the models in the confidence set (or a subset of them). They are equivalents of the standard \code{coef} and \code{predict} for single models.
}
\usage{
# S3 coef method for class 'glmulti'
\method{coef}{glmulti}(object, select="all", varweighting="Buckland", icmethod="Lukacs", alphaIC=0.05,  ...)

# S3 predict method for class 'glmulti'
\method{predict}{glmulti}(object, select="all", newdata=NA, se.fit=FALSE, 
	varweighting="Buckland", icmethod="Lukacs", alphaIC=0.05,  ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
	\item{object}{an object of class \code{glmulti}}
	
	\item{select}{A specification of which models should be used for inference. By default all models are used, see below. }
	
	\item{varweighting}{The method to be used to compute the unconditional 
	variance. "Buckland" (the default) (implements the approach presented in Buckland et al. 1997. "Johnson" implements a slightly different approach recommended in Johnson & Omland 2004 and proposed at page 235 in 
	 Burnham & Anderson 2002. The latter results in slightly bigger estimates of the unconditional variance of model coefficients. }
	
	\item{icmethod}{Method to construct confidence intervals. One of 
	"Standard", "Burnham" or "Lukacs". The three methods differ in their 
	use (or not) of degrees of freedom. }
	
	\item{newdata}{New data.frame of data for which to predict values}
	
	\item{se.fit}{Whether to return unconditional variances and confidence intervals associated with predicted values}
	
	\item{alphaIC}{The alpha risk when building the confidence intervals}
	
    \item{\dots}{ Further arguments to single-model \code{coef} or \code{predict}}
}
\details{

\emph{select} can be used to specify which models should be used for inference. By default all are used. If specifying an integer value \emph{x}, only the \emph{x} best models are used.
If a numeric value is provided, if it less than one, models that sum up to \emph{x}\% of evidence weight are used.
If it more than one, models within \emph{x} IC units from the best model are used.

}
\value{


\code{coef} returns a data.frame with model-averaged estimates of the different parameters in the models, as well as their unconditional variance, importance, and confidence interval according to one of three methods: "Standard" simply assumes a Normal distribution of the estimator (Buckland 1997), "Lukacs" assumes a Student distribution with degrees of freedom taken to be averaged across models (see Lukacs et al. 2010), and "Burnham" is a more sophisticated Student-based method proposed by Burnham & Anderson 2002. 
 

\code{predict} returns a list of three elements: the multi-model predictions, their variability (unconditional variance and confidence interval, if \code{se.fit=T}), and the number of NA predicted values that were treated as zeros when averaging models.


}
\references{ 
Buckland et al. 1997. Model selection: an integral part of inference. Biometrics.
Burnham & Anderson. 2002. Model Selection and Multimodel Inference. An Information Theoretic Practical Approach.
Johnson & Omland. 2004. Model selection in ecology and evolution. TREE.
Lukacs et al. 2010..Model selection bias and Freedman's paradox. Annals of the Institute of Statistical Mathematics.   
}
\author{Vincent Calcagno, McGill University}

\seealso{ 

\code{\link{glmulti}}

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models }
\keyword{regression }

