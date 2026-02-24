\name{setInits}
\alias{setInits}
\alias{dumpInits}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Set up and dump initial values given the model and prior}
\description{
  Given a model of class \code{modelSegratioMM} and priors of class
  \code{priorsSegratioMM}, initial values are computed using approximate
  expected values by \code{setInits} and then written to file by
  \code{dumpInits}
}
\usage{
setInits(model, priors, seed = 1)

dumpInits(inits, stem = "test", inits.file = paste(stem, "-inits.R",
  sep = ""))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{ Object of class \code{modelSegratioMM} providing model
    attributes like the number of components and ploidy level}
  \item{priors}{Object of class \code{priorsSegratioMM} }
  \item{seed}{ Seed to be used for \code{JAGS} runs. If a number of
    chains are to be run a vector of starting values may be
    specified. However, see note below. }
  \item{inits}{A list of initial values usually produced by \code{setInits}}
  \item{stem}{File name stem for inits file (default \dQuote{test})}
  \item{inits.file}{Inits file name which is automatically generated from
    \code{stem} if not specified}
}
\value{
  Returns a list with the following initial values:
  \item{mu}{Mean of dosage classes on logit scale: usually c(0,NA,NA,\ldots,NA)}
  \item{P}{Initial value for proportion in each dosage class}
  \item{tau}{Precision of means which depends on whether priors are
    strong or weak}
  \item{theta}{Differences in means (for parameterisation employed for
    better convergence)}
  \item{seed}{Sets seed for each MCMC chain (Default:1) }
  \item{taub}{If the model contains a random effect then sets 
    initial value of precision of random effect \emph{b} which is normally
    distributed with mean 0 and precision \code{taub}}
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\note{\emph{Warning}: If a number of chains are to be produced then
  several seeds may be specified. Currently, this is largely untested
  and so it is highly unlikely that this will actually
  work for all functions in this package.
}
\seealso{ \code{\link{setModel}} \code{\link{setPriors}}
  \code{\link{setControl}} \code{\link{dumpInits}}  }
\examples{
## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)

## set up model, priors, inits etc and write files for JAGS
x <- setModel(3,8)
x2 <- setPriors(x)
inits <- setInits(x,x2)

\dontrun{
dumpInits(inits)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
\concept{segregation ratio}% __ONLY ONE__ keyword per line
\concept{dominant marker}
\concept{autopolyploid}

