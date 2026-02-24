\name{readJags}
\alias{readJags}
\alias{segratioMCMC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Read MCMC sample(s) from a JAGS run}
\description{ wrapper to \code{read.openbugs}  which
  returns object of class \code{mcmc.list} and so can be used to
  specify the start and end iterations for the MCMC sample(s) and also
  specify thinning
}
\usage{
readJags(run.jags, quiet = TRUE, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{run.jags}{object of class \code{runJAGS} produced by running JAGS}
  \item{quiet}{logical to return program output (Default: TRUE)}
  \item{\dots}{other options for \code{read.openbugs}}
}
\value{ Returns object of class \code{segratioMCMC} with components
  \item{run.jags}{object of class \code{runJAGS} produced by running JAGS}
  \item{mcmc.list}{object of class \code{mcmc.list} containing the MCMC
    sample(s)}
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{  \code{\link[coda]{mcmc.list}} \code{\link{setPriors}}
      \code{\link{setInits}}
      \code{\link[polySegratio]{expected.segRatio}}
      \code{\link[polySegratio]{segRatio}}
  \code{\link{setControl}}
  \code{\link{dumpData}} \code{\link{dumpInits}} or for an easier way to
  run a  segregation ratio mixture model  see
  \code{\link{runSegratioMM}}
}
\examples{

library(polySegratio)

## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)
##print(a1)
sr <-  segregationRatios(a1$markers)
x <- setModel(3,8)
x2 <- setPriors(x)
cat(x$bugs.code,x2$bugs.code,sep="\n")


x3 <- setModel(3,8, random.effect = TRUE)
x4 <- setPriors(x3, type="strong")

\dontrun{
## write control files for JAGs run
dumpData(sr, x3)
inits <- setInits(x,x2)
dumpInits(inits)
##x.priors <- setPriors(x, "vague")
writeJagsFile(x, x2, stem="test")

small <- setControl(x, burn.in=20, sample=50)
writeControlFile(small)

rj <- runJags(small)  ## just run it

xj <- readJags(rj)
print(xj)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
\concept{segregation ratio}% __ONLY ONE__ keyword per line
\concept{dominant marker}
\concept{autopolyploid}
