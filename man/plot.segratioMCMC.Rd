\name{plot.segratioMCMC}
\alias{plot.segratioMCMC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ MCMC plots for segregation ratio mixture models }
\description{
  Standard MCMC trace and density plots for specified mixure model
  parameters and posterior probability distributions for specified markers
}
\usage{
\method{plot}{segratioMCMC}(x, \dots, row.index = c(1:10), var.index = c(1:6),
marker.index = c(1:8))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{object of class \code{segratioMCMC}}
  \item{\dots}{extra options for printing}
%%  \item{index.sample}{which markers to print (Default: 20 markers at random)}
  \item{row.index}{which rows to print (Default: first 10)}
  \item{var.index}{which mixture model variable to summarise (Default:
    all)}
  \item{marker.index}{which markers to summarise (Default: 1:8)}
}
\value{ None.
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{ \code{\link{dosagesMCMC}}  \code{\link{readJags}}}
\examples{
## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)
##print(a1)
sr <-  segregationRatios(a1$markers)
x <- setModel(3,8)

\dontrun{
## fit simple model in one hit and summarise

x.run <- runSegratioMM(sr, x, burn.in=200, sample=500)
plot(x.run$mcmc.mixture)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
\concept{segregation ratio}% __ONLY ONE__ keyword per line
\concept{dominant marker}
\concept{autopolyploid}
