\name{diagnosticsJagsMix}
\alias{diagnosticsJagsMix}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{MCMC diagnostics for polyploid segregation ratio mixture models}
\description{
  Produce and/or plot various diagnostic measures from \code{coda}
  package for Bayesian mixture models for assessing marker dosage in
  autopolyploids
}
\usage{
diagnosticsJagsMix(mcmc.mixture, diagnostics = TRUE, plots = FALSE,
 index = -c( grep("T\\\\[",varnames(mcmc.mixture$mcmc.list)),
             grep("b\\\\[",varnames(mcmc.mixture$mcmc.list)) ),
 trace.plots = FALSE, auto.corrs = FALSE, density.plots = FALSE,
 xy.plots = FALSE, hpd.intervals = FALSE, hdp.prob = 0.95,
 return.results = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mcmc.mixture}{Object of class \code{\link{segratioMCMC}} or
      \code{\link{runJagsWrapper}} after \code{JAGS} run
    produced by \code{coda} }
  \item{diagnostics}{if TRUE then print several \code{coda} dignostic tests}
  \item{plots}{if TRUE then produce several \code{coda} dignostic plots}
  \item{index}{index of parameters for disgnostic tests/plots (Default:
    mixture model (and random effects) parameters)}
  \item{trace.plots}{if TRUE plot mcmc traces (default: FALSE)}
  \item{auto.corrs}{if TRUE produce autocorrelations of mcmc's (default: FALSE)}
  \item{density.plots}{if TRUE plot parameter densities  (default: FALSE)}
  \item{xy.plots}{if TRUE plot traces using 'lattice' (default: FALSE)}
  \item{hpd.intervals}{if TRUE print and return highest posterior density
    intervals for parameters specified by \code{index}}
  \item{hdp.prob}{probability for \code{hpd.intervals}}
  \item{return.results}{if TRUE return results as list}
}
\value{
  If \code{return.results} is TRUE then a list is returned with
  components depending on various settings of arguments
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{ \code{\link[coda]{mcmc}} \code{\link[coda]{autocorr.diag}}
    \code{\link[coda]{raftery.diag}}  \code{\link[coda]{geweke.diag}}
    \code{\link[coda]{gelman.diag}} \code{\link[coda]{trellisplots}}
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
diagnosticsJagsMix(x.run)
diagnosticsJagsMix(x.run, plot=TRUE)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
\concept{segregation ratio}% __ONLY ONE__ keyword per line
\concept{dominant marker}
\concept{autopolyploid}
