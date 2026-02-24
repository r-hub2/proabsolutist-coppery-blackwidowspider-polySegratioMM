\name{setControl}
\alias{setControl}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Set up controls for a JAGS segregation ratio model run }
\description{
  Sets up directives for running \code{JAGS} which are subsequently put
  into a .cmd file. MCMC attributes such as the size of burn in,
  length of MCMC and thinning may be specified
}
\usage{
setControl(model, stem = "test", burn.in = 2000, sample = 5000, thin = 1,
 bugs.file = paste(stem, ".bug", sep = ""),
 data.file = paste(stem, "-data.R", sep = ""),
 inits.file = paste(stem, "-inits.R", sep = ""),
 monitor.var = model$monitor.var, seed=1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{ object of class \code{modelSegratioMM} specifying model
    parameters, ploidy etc}
  \item{stem}{text to be used as part of \code{JAGS} .cmd file name}
  \item{burn.in}{size of MCMC burn in (Default: 2000)}
  \item{sample}{ size of MCMC sample (default: 5000) }
  \item{thin}{thinning interval between consecutive
    observations. Thinning may be a scalar or specified for each
    variable set by specifying a vector (default: 1 or no thinning)}
  \item{bugs.file}{name of .bug file}
  \item{data.file}{name of \R data file }
  \item{inits.file}{name of \R inits file }
  \item{monitor.var}{which variables to be monitored (Default: as per
    model)}
  \item{seed}{seed for JAGS run for Windows only (for unix set seed in
    \code{setInits})}
}
\value{
  Returns an object of class \code{jagsControl} which is a list
  with components
  \item{jags.code}{Text containing control statements for \code{JAGS}
    .cmd file}
  \item{model}{ object of class \code{modelSegratioMM} specifying model
    parameters, ploidy etc}
  \item{stem}{text to be used as part of \code{JAGS} .cmd file name}
  \item{burn.in}{size of MCMC burn in (Default: 2000)}
  \item{sample}{ size of MCMC sample (default: 5000) }
  \item{thin}{thinning interval between consecutive observations}
  \item{bugs.file}{name of .bug file}
  \item{data.file}{name of \R data file }
  \item{inits.file}{name of \R inits file }
  \item{monitor.var}{which variables to be monitored}
  \item{call}{function call}
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{ \code{\link{setModel}} \code{\link{setInits}}
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

## set up model with 3 components
x <- setModel(3,8)
x2 <- setPriors(x)

jc <- setControl(x)
print(jc)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
\concept{segregation ratio}% __ONLY ONE__ keyword per line
\concept{dominant marker}
\concept{autopolyploid}
