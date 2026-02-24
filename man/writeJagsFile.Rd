\name{writeJagsFile}
\alias{writeJagsFile}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Writes BUGS file for processing by JAGS}
\description{
  Given the model and priors a file is written to disk for subsequent
  \code{JAGS} run. BUGS code contained in the model and priors objects
  is combined and alterered if necessary
}
\usage{
writeJagsFile(model, priors, stem = "test")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{ object of class \code{modelSegratioMM} specifying model
    parameters, ploidy etc}
  \item{priors}{Object of class \code{priorsSegratioMM} specifying priors}
  \item{stem}{File name stem for BUGS file (default \dQuote{test}) }
}
\value{
  None.
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{  \code{\link[polySegratio]{segRatio}}  \code{\link{dump}} }
\examples{
## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)

## compute segregation ratios
sr <-  segregationRatios(a1$markers)

## set up model for 3 components of autooctoploid
x <- setModel(3,8)
x2 <- setPriors(x)

\dontrun{  # run manually to inspect files
dumpData(sr, x)
inits <- setInits(x,x2)
dumpInits(inits)
##x.priors <- setPriors(x, "vague")
writeJagsFile(x, x2, stem="test")
}

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
\keyword{data}% __ONLY ONE__ keyword per line
