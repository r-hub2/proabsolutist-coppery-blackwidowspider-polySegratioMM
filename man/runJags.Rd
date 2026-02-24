\name{runJags}
\alias{runJags}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Run JAGS to create MCMC sample for segregation ratio mixture model}
\description{
  Runs external program \code{JAGS} and returns MCMC list for processing
  by \code{coda}.
}
\usage{
runJags(jags.control, jags = "jags", quiet = FALSE,
 cmd.file = paste(jags.control$stem, ".cmd", sep = ""), timing = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{jags.control}{Object of class \code{jagsControl} containing MCMC
  burn in, sample and thinning as well as relavant files for BUGS
  commands, inits and data }
  \item{jags}{Name of \code{JAGS} program assumed to be in
    PATH. However, jags may explicitly set here to include the full path
    name}
  \item{quiet}{Locial to return program output (Default: FALSE)}
  \item{cmd.file}{\code{JAGS} .cmd commad file (Default: deduced from
    \code{jags.control})}
  \item{timing}{Logical to return timing information such as date
    started and ended and elapsed user and system time }
}
\value{ Returns object of class \code{runJAGS} with components
  \item{jags.control}{Object of class \code{jagsControl} }
  \item{exit}{integer indicating return error (0 if no errors)}
  \item{cmd.file}{\code{JAGS} command file}
  \item{start.time}{time JAGS run started}
  \item{end.time}{time JAGS run finished}
  \item{elapsed.time}{elapsed user and system time}
  \item{call}{function call}
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{ \code{\link{setPriors}} \code{\link{setInits}}
  \code{\link[polySegratio]{expected.segRatio}}
  \code{\link[polySegratio]{segRatio}}
  \code{\link{setControl}}
  \code{\link{dumpData}} \code{\link{dumpInits}} or for an easier way to
  run a  segregation ratio mixture model  see
  \code{\link{runSegratioMM}}
}
\examples{
## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)
sr <-  segregationRatios(a1$markers)

## set up model with 3 components
x <- setModel(3,8)
x2 <- setPriors(x)

\dontrun{

## write control files for JAGs run
dumpData(sr, x)
inits <- setInits(x,x2)
dumpInits(inits)
##x.priors <- setPriors(x, "vague")
writeJagsFile(x, x2, stem="test")

small <- setControl(x, burn.in=20, sample=50)
writeControlFile(small)
rj <- runJags(small)  ## just run it
print(rj)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
\concept{segregation ratio}% __ONLY ONE__ keyword per line
\concept{dominant marker}
\concept{autopolyploid}
