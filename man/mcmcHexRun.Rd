\name{mcmcHexRun}
\docType{data}
\alias{mcmcHexRun}
\title{Results of MCMC estimation for simulated overdispersed markers}
\description{ MCMC was performed using the wrapper function
  \code{runSegratioMM} to
 run JAGS for a Bayesian mixture model on the segregation ratios
 obtained using the simulated data \code{hexmarkers.overdisp}. These
 data were simulated as 500 markers for 200 \dQuote{auto--hexaploid
 individuals} exhibiting overdispersion with shape1=25. The underlying
 percentages of single double and triple dose markers are 70\%, 20\% and
 10\%, respectively. 

}
\usage{mcmcHexRun}
\format{An object of S3 class \code{runJagsWrapper} with various
  components including summaries and diagnostics.}
\references{
  Baker P, Jackson P, and Aitken K. 2010. Bayesian estimation of marker
  dosage in sugarcane and other autopolyploids. \emph{TAG Theoretical and
    Applied Genetics} 120 (8): 1653-1672.
}
\keyword{datasets}
