\name{polySegratioMM-package}
\alias{polySegratioMM-package}
\alias{polySegratioMM}
\docType{package}
\title{
Bayesian Mixture Models for Marker Dosage in Autopolyploids
}
\description{
  These functions provide tools for estimating marker dosage for
  dominant markers in regular autopolyploids via Bayesian mixture
  model. Wrappers are provided for generating MCMC samples
  using the \code{JAGS} software. Convergence diagnostics and posterior
  distribution densities are provided by the \code{coda}
  package. %\code{polySegratioMM} may be
  %used in conjunction with package \code{polySegratio} for simulation
  %studies and comparison with standard methods
}

\details{
  \tabular{ll}{
Package: \tab polySegratioMM\cr
Type: \tab Package\cr
Version: \tab 0.6-4\cr
Date: \tab 2018-03-22\cr
License: \tab  GPL-3
}

The simplest way to fit a model is to use \code{\link{runSegratioMM}}.
Given segregation ratios and a ploidy level, a mixture model is
constructed with default priors and initial values and \code{JAGS} run
to produce an MCMC sample for statistical inference.

A standard model may be set up with \code{\link{setModel}} where two
parameters are set, namely \code{ploidy.level} or the number of
homologous chromosomes set either as a numeric or as a character
string and also \code{n.components} or the number of components for
mixture model (less than or equal to maximum number of possible
dosages).

Vague or strong priors may be constructed automatically using
\code{\link{setPriors}}. Plots of standard conjugate distributions may
be obtained using \code{\link{DistributionPlotBinomial}}
\code{\link{DistributionPlotGamma}} and
\code{\link{DistributionPlotNorm}}.

If necessary, other operations like setting up initial values or the
control files for \code{JAGS} may be set using \code{\link{setInits}}
\code{\link{setControl}} \code{\link{dumpData}} \code{\link{dumpInits}}
\code{\link{writeControlFile}} \code{\link{writeJagsFile}}. Once the
\code{BUGS} files and \code{JAGS} control files are set up then
\code{JAGS} may be run using \code{\link{runJags}} and results read
using \code{\link{readJags}}.

Convergence diagnostics may be carried out using \code{coda} or the
convenience wrapper \code{\link{diagnosticsJagsMix}}.

Dose allocation can be carried out using \code{\link{dosagesJagsMix}}.

Plots may be produced and objects printed and summarised using standard
\code{\link{print}} and \code{\link{plot}} methods. Plots of theoretical
binomial distributions with different ploidy levels and sample sizes may
be obtained with \code{\link{plotFitted}}. In addition,
\code{\link{plotFitted}} produces a lattice plot of the observed
segregation ratios and fitted mixture model on the logit scale.

}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\references{

    Baker, P. and Jackson, P. and Aitken, K. (2010) Bayesian estimation
      of marker dosage in sugarcane and other autopolyploids.
      \emph{TAG Theoretical and Applied Genetics} \bold{120} (8): 1653--1672

    Haldane, J. B. S. (1930) Theoretical genetics of
      autopolyploids. \emph{Journal of genetics} \bold{22} 359--372

    Ripol, M. I. et al (1999) Statistical aspects of genetic mapping in
      autopolyploids. \emph{Gene} \bold{235} 31--41

    JAGS: \url{https://mcmc-jags.sourceforge.io/}

}
\examples{
## simulate small autooctaploid data set of 100 markers for 50 individuals
## with \%70 Single, \%20 Double and \%10 Triple Dose markers 
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=400,n.individuals=275)
##print(a1)
sr <-  segregationRatios(a1$markers)
x <- setModel(3,8)  # autooctapolid mode with 3 components

\dontrun{
## fit simple model in one hit with default priors, inits etc
## warning: this is too small an MCMC sample so should give inaccurate
## answers but it could still take quite a while
x.run <- runSegratioMM(sr, x, burn.in=2000, sample=5000)
print(x.run)

## plot observed segregation ratios, fitted model and expected distribution
plot(x.run, theoretical=TRUE)
}
}
\keyword{ package }
\keyword{manip}
\concept{segregation ratio}% __ONLY ONE__ keyword per line
\concept{dominant marker}
\concept{autopolyploid}
\concept{polyploid}
