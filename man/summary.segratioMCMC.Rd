\name{summary.segratioMCMC}
\alias{summary.segratioMCMC}
\alias{summarySegratioMCMC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Summary statistics for an segratioMCMC object}
\description{
  Wrapper for \code{summary.mcmc} processing only mixture model parameters
  although markers may also easily be summarised. The  mean, standard
  deviation, naive standard error of the mean (ignoring autocorrelation
  of the chain) and time-series standard error based on an estimate of
  the spectral density at 0. For details see \code{summary.mcmc}
}
\usage{
\method{summary}{segratioMCMC}(object, ..., row.index = c(1:10),
 var.index = NULL,
 marker.index = c(1:8))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{object of class \code{segratioMCMC}}
  \item{\dots}{extra options for \code{summary.mcmc}}
  \item{row.index}{which rows to print (Default: first 10)}
  \item{var.index}{which mixture model variable to summarise (Default:
    all)}
   \item{marker.index}{which markers to summarise (Default: 1:8)}
}
\value{
  An object of class \code{summarySegratioMCMC} is returned which
  contains summary statistics for parameters and some markers. For
  details see \code{\link[coda]{summary.mcmc}}
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{ \code{\link[coda]{summary.mcmc}} \code{\link[coda]{mcmc}}
  \code{\link{segratioMCMC}} \code{\link{readJags}}
  \code{\link{diagnosticsJagsMix}}
}
\examples{
## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)
##print(a1)
sr <-  segregationRatios(a1$markers)
x <- setModel(3,8)

\dontrun{
## fit simple model in one hit and summarise

x.run <- runSegratioMM(sr, x, burn.in=200, sample=500)
print(summary(x.run$mcmc.mixture))
print(summary(x.run$mcmc.mixture, var.index=c(1:3), marker.index=c(1:4)))
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
\concept{segregation ratio}% __ONLY ONE__ keyword per line
\concept{dominant marker}
\concept{autopolyploid}
