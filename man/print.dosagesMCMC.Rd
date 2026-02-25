\name{print.dosagesMCMC}
\alias{print.dosagesMCMC}
\alias{print.segratioMCMC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Doses from Bayesian mixture model}
\description{
  Prints objects of S3 class \code{dosagesMCMC} or \code{segratioMCMC}
}
\usage{
\method{print}{dosagesMCMC}(x, \dots, index.sample = 20)

\method{print}{segratioMCMC}(x, \dots, row.index = c(1:10), var.index = c(1:6), marker.index
 = c(1:8), chain = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{object of class \code{dosagesMCMC} or \code{segratioMCMC}}
  \item{\dots}{extra options for printing}
  \item{index.sample}{which markers to print (Default: 20 markers at random)}
  \item{row.index}{which rows to print (Default: first 10)}
  \item{var.index}{which mixture model variable to summarise (Default:
    all)}
  \item{marker.index}{which markers to summarise (Default: 1:8)}
  \item{chain}{which chain to print (Default: 1)}
}
\value{
  None.
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{ \code{\link{dosagesMCMC}}  \code{\link{readJags}}}
\examples{
## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)
##print(a1)
sr <-  segregationRatios(a1$markers)
x <- setModel(3,8)

## fit simple model in one hit

\dontrun{
x.run <- runSegratioMM(sr, x, burn.in=200, sample=500)

print(x.run$doses)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
\concept{segregation ratio}% __ONLY ONE__ keyword per line
\concept{dominant marker}
\concept{autopolyploid}
