\name{calculateDIC}
\alias{calculateDIC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Compute DIC for fitted mixture model}
\description{ Computes and returns the Deviance Information Critereon
  (DIC) as suggested by Celeaux et al
  (2006) as their  DIC$_4$ for Bayesian mixture models
}
\usage{
calculateDIC(mcmc.mixture, model, priors, seg.ratios, chain=1, print.DIC=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mcmc.mixture}{Object of type \code{\link{segratioMCMC}}
    produced by \code{coda} usually by using \code{\link{readJags}}}
  \item{model}{ object of class \code{modelSegratioMM} specifying model
    parameters, ploidy etc}
  \item{priors}{Object of class \code{priorsSegratioMM} }
  \item{seg.ratios}{Object of class \code{\link[polySegratio]{segRatio}}
    contains the segregation ratios for dominant markers and other
    information such as the number of dominant markers per individual}
  \item{chain}{Which chain to use when compute dosages (Default: 1)}
  \item{print.DIC}{Whether to print DIC}
}
\value{
  A scalar DIC is returned
}
\references{
  
  G Celeaux, G et. al. (2006) Deviance Information Criteria for
  Missing Data Models \emph{Bayesian Analysis} \bold{4} 23pp
  
  Spiegelhalter, D et. el. (2002) Bayesian measures of model
    complexity and fit \emph{JRSS B} \bold{64} 583--640

}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{ \code{\link{dosagesMCMC}}  \code{\link{readJags}}}
\examples{
## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)

## compute segregation ratios
sr <-  segregationRatios(a1$markers)

## set up model, priors, inits etc and write files for JAGS
x <- setModel(3,8)
x2 <- setPriors(x)

\dontrun{
## set up files needed for JAGs run
dumpData(sr, x)
inits <- setInits(x,x2)
dumpInits(inits)
writeJagsFile(x, x2, stem="test")

## run JAGS
small <- setControl(x, burn.in=200, sample=500)
writeControlFile(small)
rj <- runJags(small)  ## just run it
print(rj)

## read mcmc chains and print DIC
xj <- readJags(rj)
print(calculateDIC(xj, x, x2, sr))
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
\concept{segregation ratio}% __ONLY ONE__ keyword per line
\concept{dominant marker}
\concept{autopolyploid}
