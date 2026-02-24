\name{writeControlFile}
\alias{writeControlFile}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Write JAGS .cmd file for running JAGS}
\description{
  Write JAGS .cmd file to disk
}
\usage{
writeControlFile(jags.control,
     file = paste(jags.control$stem, ".cmd", sep = ""))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{jags.control}{Object of class \code{jagsControl} containing MCMC
  burn in, sample and thinning as well as relavant files for BUGS
  commands, inits and data }
  \item{file}{JAGS .cmd file name }
}
\value{
  None.
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{ \code{\link{setControl}}  \code{\link{runJags}} }
\examples{
## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)
sr <-  segregationRatios(a1$markers)

## set up model with 3 components
x <- setModel(3,8)
x2 <- setPriors(x)

\dontrun{

dumpData(sr, x)
inits <- setInits(x,x2)
dumpInits(inits)
##x.priors <- setPriors(x, "vague")
writeJagsFile(x, x2, stem="test")

small <- setControl(x, burn.in=20, sample=50)
writeControlFile(small)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
\concept{segregation ratio}% __ONLY ONE__ keyword per line
\concept{dominant marker}
\concept{autopolyploid}
