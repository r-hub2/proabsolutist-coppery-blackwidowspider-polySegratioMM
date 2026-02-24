\name{runSegratioMM}
\alias{runSegratioMM}
\alias{runJagsWrapper}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Run a Bayesian mixture model for marker dosage with minimal effort}
\description{
  Given segregation ratios and a ploidy level, a mixture model is
  constructed with default priors and initial values and \code{JAGS} run
  to produce an MCMC sample for statistical inference. Returns an object
  of S3 class \code{runJagsWrapper}
}
\usage{
runSegratioMM(seg.ratios, model, priors = setPriors(model),
 inits = setInits(model, priors), jags.control =
 setControl(model, stem, burn.in = burn.in, sample = sample, thin = thin),
 burn.in = 2000, sample = 5000, thin = 1, stem = "test", fix.one = TRUE,
 print = TRUE, plots = TRUE, print.diagnostics = TRUE,
 plot.diagnostics = TRUE, run.diagnostics.later=FALSE )
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{seg.ratios}{Object of class \code{\link[polySegratio]{segRatio}}
    contains the
    segregation ratios for dominant markers and other information
    such as the number of dominant markers per individual}
  \item{model}{ object of class \code{modelSegratioMM} specifying model
    parameters, ploidy etc}
  \item{priors}{object of class \code{priorsSegratioMM} indicating
    priors that are \dQuote{vague}, \dQuote{strong} or \dQuote{specified}}
  \item{inits}{A list of initial values usually produced by \code{setInits}}
  \item{jags.control}{Object of class \code{jagsControl} containing MCMC
    burn in, sample and thinning as well as relavant files for BUGS
    commands, inits and data }
  \item{burn.in}{size of MCMC burn in (Default: 2000)}
  \item{sample}{ size of MCMC sample (default: 5000) }
  \item{thin}{thinning interval between consecutive observations
    (default: 1 or no thinning)}
  \item{stem}{text to be used as part of \code{JAGS} .cmd file name}
  \item{fix.one}{Logical to fix the dosage of the observation closest to
    the centre of each component on the logit scale. This can greatly
    assist with convergence (Default: \code{TRUE}) }
  \item{print}{logical for printing monitoring and summary information
    (default: TRUE)}
  \item{plots}{logical to plotting MCMC posterior distributions 
    (default: TRUE)}
  \item{print.diagnostics}{logical for printing disagnostic statistics
    (default: TRUE)}
  \item{plot.diagnostics}{logical for diagnostic plots
    (default: TRUE)}
  \item{run.diagnostics.later}{should diagnostics be run later which may
    help if there are convergence problems (Default: FALSE)}
}
\value{ Returns object of class \code{runJagsWrapper} with components
  \item{seg.ratios}{Object of class \code{\link[polySegratio]{segRatio}}
    contains the
    segregation ratios for dominant markers}
  \item{model}{ object of class \code{modelSegratioMM} specifying model
    parameters, ploidy etc}
  \item{priors}{Object of class \code{priorsSegratioMM} specifying prior
    distributions}
  \item{inits}{A list of initial values usually produced by \code{setInits}}
  \item{jags.control}{Object of class \code{jagsControl} containing MCMC
    burn in, sample and thinning as well as relavant files for BUGS
    commands, inits and data }
  \item{stem}{text to be used as part of \code{JAGS} .cmd file name and
    other files}
  \item{fix.one}{Logical to fix the dosage of the observation closest to
    the centre of each component on the logit scale. This can greatly
    assist with convergence (Default: \code{TRUE}) }
  \item{run.jags}{object of class \code{runJAGS} produced by running JAGS}
  \item{mcmc.mixture}{Object of type \code{\link{segratioMCMC}}
    produced by \code{coda} usually by using \code{\link{readJags}}}
  \item{diagnostics}{list containing various diagnostic summaries and
    statistics produced by \code{coda}}
  \item{summary}{summaries of posterior distributions of model parameters}
  \item{doses}{object of class \code{\link{dosagesMCMC}} containing
    posterior probabilities of dosages for each
    marker dosage and allocated dosages}
  \item{DIC}{Deviance Information Critereon}
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{ \code{\link{setPriors}} \code{\link{setInits}}
  \code{\link[polySegratio]{expected.segRatio}}
  \code{\link[polySegratio]{segRatio}}
  \code{\link{setControl}}
  \code{\link{dumpData}} \code{\link{dumpInits}} and 
  \code{\link{diagnosticsJagsMix}}
}
\examples{
## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)
##print(a1)
sr <-  segregationRatios(a1$markers)
x <- setModel(3,8)

\dontrun{
## fit simple model in one hit

x.run <- runSegratioMM(sr, x, burn.in=200, sample=500)
print(x.run)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
\concept{segregation ratio}% __ONLY ONE__ keyword per line
\concept{dominant marker}
\concept{autopolyploid}
