\name{glmulti}

\alias{glmulti}

\title{ Automated model selection and multimodel inference with (G)LMs}
\description{
\code{glmulti} finds what are the \code{n} best models (the confidence set of models) among all possible models (the candidate set, as specified by the user).
Models are fitted with the specified fitting function (default is \code{glm}) and are ranked with the specified Information Criterion (default is \code{aicc}).
The best models are found either through exhaustive screening of the candidates, or using a genetic algorithm, which allows very large candidate sets to be adressed.
The output can be used for model selection, variable selection, and multimodel inference.
}

\usage{
#  glmulti S4 generic 
glmulti(y, xr, data,
	exclude = c(),
	name = "glmulti.analysis",
	intercept = TRUE,
	 marginality = FALSE,
	 bunch=30,
	 chunk = 1,
	 chunks = 1,
	 level = 2, 
	 minsize = 0,
	 maxsize = -1,
	 minK = 0,
	 maxK = -1,
	 method = "h",
	 crit = "aic",
	 confsetsize = 100,
	 popsize = 100,
	 mutrate = 10^-3,
	 sexrate = 0.1,
	 imm = 0.3,
	 plotty = TRUE,
	 report = TRUE,
	 deltaM = 0.05,
	 deltaB = 0.05,
	 conseq = 5,
	 fitfunction = "glm",
	 resumefile = "id",
	 includeobjects=TRUE,
	 ...)

}

\arguments{
  \item{y}{ A formula, character string, or fitted model (of class lm or glm)
	specifying the response variable and the terms (main effects and/or interactions) to be used in the candidate models (e.g. height~age*sex+mass).
	Alternatively, a character string naming the variable to be used as response (e.g. "height")
	(in which case the names of the predictors must be passed through the xr argument)
	Alternatively, a custom list of (fitted) model objects can also be passed (can be convenient for small candidate sets).
	
  }
  \item{xr}{An optional character array specifying the variables (categorical or quantitative) to be used as predictors, e.g. c("age", "height" , "mass")}
  \item{exclude}{Optional character vector naming terms (main effects or interactions) to be excluded from the candidate models, e.g. c("mass:height")}
  \item{intercept}{ Whether to include an intercept in the candidate models or not. }
  \item{level}{ If 1, only main effects (terms of order 1) are used to build the candidate set. 
		If 2, pairwise interactions are also used (higher order interactions are currently ignored)}
  
  \item{data}{A data.frame containing the data. If not specified, \code{glmulti} will try to find the data in the environment of the formula, 
	from the fitted model passed as y argument, or from the global environment.}
   
  \item{name}{ The name of this \code{glmulti} analysis. Optional.}
  
  \item{marginality}{ Whether to apply the marginality rule or not. If TRUE, only marginal models will be considered.}
  \item{minsize}{This sets a constraint on candidate models. Minimal number of TERMS (main effects or interactions) to be included in candidate models (negative = no constraint)}
  \item{maxsize}{This sets a constraint on candidate models. Maximal number of TERMS to be included in candidate models (negative = no constraint)}
  \item{minK}{ This sets a constraint on candidate models. Minimal complexity of candidate models (negative = no constraint)}
  \item{maxK}{ This sets a constraint on candidate models. Maximal complexity of candidate models (negative = no constraint)}
    
  \item{method}{ The method to be used to explore the candidate set of models. If "h" an exhaustive screening is undertaken. If "g" the genetic algorithm is employed (recommended for large candidate sets).
			If "l", a very fast exhaustive branch-and-bound algorithm is used. Package leaps must then be loaded, and this can only be applied to linear models with covariates and no interactions.  If "d", a simple summary of the candidate set is printed, including the number of candidate models.}
  \item{crit}{The Information Criterion to be used. This should be a function that accepts a fitted model as first argument. Default is the original Akaike IC (aic).
	Other provided functions are the Bayes IC (\code{bic}), the small-sample corrected AIC (\code{aicc}) and QAIC/QAICc (\code{qaic} and \code{qaicc}).}
  \item{fitfunction}{ The fitting function to be used. Any function similar to \code{glm} can be used. See Examples}
  \item{confsetsize}{ The number of models to be looked for, i.e. the size of the returned confidence set. }
	
  \item{plotty}{ Whether to plot the progress of the IC profile when running.}
  \item{report}{ Whether to report about the progress at run time.} 
 \item{bunch}{The number of model formulas to be returned (to be fitted) at each call to the enumerator. Exhaustive screening only.}
  \item{chunk}{When using an exhaustive screening approach, it can be splitted in several parts to take advantage of multiple CPUs. 
	chunk is an integer specifying which part the current call should perform.}
  \item{chunks}{When splitting an exhaustive screening, the total number of parts the task should be divided into.
		For example, with a quad-core processor, 4 may be useful. Use consensus to bring back the pieces into a single object.}

  \item{popsize}{The population size for the genetic algorithm }
  \item{mutrate}{ The per locus (i.e. per term) mutation rate for genetic algorithm, between 0 and 1}
  \item{sexrate}{ The rate of sexual reproduction for the genetic algorithm, between 0 and 1}
  \item{imm}{ The rate of immigration for the genetic algorithm, between 0 and 1}
  \item{deltaM}{The target change in mean IC (defines the stop rules for the genetic algorithm)}
  \item{deltaB}{ The target change in best IC (defines the stop rules for the genetic algorithm) }
  \item{conseq}{ The target successive number of times with no improvement (i.e. target changes have been attained) (defines the stop rule for the GA). The greater it is, the more stringent the stop rule. }
  \item{resumefile}{ When resuming an analysis (method="r"), the name of the files from which to resume. Default uses the same as name}
  \item{includeobjects}{Whether or not to include fiited models as objects. This makes \code{coef} and \code{predict} faster and is very convenient, but can be turned off in case fitted models are very large or are not to be used after.}
  \item{\dots}{ Further arguments to be passed to the fitting function.  E.g. maxit=50 or family=binomial }


}
\details{
  \code{glmulti} is defined as a S4 function. It acts as a frontend that calls background compiled functions (contained if archive glmulti.jar).
  Running the function therefore requires a Java Running Environment, and package \code{rJava}.
  A thorough description of this function and package can be found in the article by Calcagno and de Mazancourt (see References).
  \code{print.glmulti} and \code{summary.glmulti} are S3 methods which provide a synthesis of \code{glmulti} analyses.
  
  NOTE: When calling \code{glmulti} with a model object as y, only the formula will be extracted from the object. This means that optional arguments to the fitting function (e.g. family or maxit) will NOT be extracted. These arguments should be passed to \code{glmulti} through the \dots.
}
\value{
 An object of class \code{glmulti} is returned. It is a S4 object with several slots containing relevant data for model selection and beyond.
 
Several standard S3 functions are provided to help access the content of this object.
 
Several \code{glmulti} objects can be shrunk to one using the function consensus. This is useful to get the best of several replicates (of the genetic algorithm) or to bring together the different parts of a splitted exhaustive screening.
When running a genetic algorithm, two tiny \code{java} files (serialized objects) are also written to the disk at regular intervals. They can be used to resume the calculation (method="r") if it was interrupted for any reason. This can also be used to continue a GA with modified parameters (e.g. mutation rate).


}
\references{ 
Buckland (1997) Model Selection: an Integral Part of Inference. Biometrics 10:41
Burnham & Anderson (2002) Model Selection and Multimodel Inference: an Information Theoretic Approach
Calcagno & de Mazancourt 2010 J. Stat. Soft. v34 i12. See http://www.jstatsoft.org/v34/i12

}
\author{Vincent Calcagno, McGill University, Canada }


\seealso{ \code{\link{consensus}}, \code{\link{aic}}, \code{\link{weightable}}, \code{\link{summary.glmulti}}, \code{\link{coef.glmulti}}, \code{\link{step}}}

\examples{
# See the document "glmulti.pdf" included in the package.
# It explains the general approach 
# and shows how to use glmulti with mixed models from the lme4 package.
# Other examples:
# A. This shows how to do the same for zero-inflated poisson models
# we load the required package
library(pscl)
# a random vector of count data
round(runif(100, 0,20)*round(runif(100)))-> vy2
# dummy predictors
va = runif(100)
vb = runif(100)
# 1. The wrapper function
zeroinfl.glmulti=function(formula, data, inflate = "|1",...)  {
    zeroinfl(as.formula(paste(deparse(formula), inflate)),data=data,...)
} 
# The default getfit and aicc method will work for zeroinfl objects, so no need to redefine them
# we can proceed directly
glmulti(vy2~va*vb,fitfunc=zeroinfl.glmulti,inflate="|1")->bab


# B. This shows how to include some terms in ALL the models
# As above, we just prepare a wrapper of the fitting function
glm.redefined = function(formula, data, always="", ...) {
glm(as.formula(paste(deparse(formula), always)), data=data, ...)
}
# we then use this fitting function in glmulti
glmulti(vy2~va,level=1,fitfunc=glm.redefined,always="+vb")-> bab
# va will be shuffled but vb is always included in the models

# this procedure allows support of arbitrarily any fitting function,
# or the use of sophisticated constraints on the model structure

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models }
\keyword{regression }

