\name{print.runJags}
\alias{print.runJags}
\alias{print.runJagsWrapper}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Running JAGS}
\description{
 Print details and timing of \code{JAGS} run and summaries of results 
}
\usage{
\method{print}{runJags}(x, ...)
\method{print}{runJagsWrapper}(x, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{Objects of class \code{runJags} or \code{runJagsWrapper}  }
  \item{\dots}{extra printing options}
}
\details{
  \code{print.runJags} can be employed when \code{runJags} is called
  directly and reports timimgs and dates while
  \code{print.runJagsWrapper} provides summary statistics when
  \code{runSegratioMM} is used. 
}
\value{ None.
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{ \code{\link{runJags}} \code{\link{runSegratioMM}}
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
