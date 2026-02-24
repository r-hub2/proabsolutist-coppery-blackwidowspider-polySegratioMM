\name{dumpData}
\alias{dumpData}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Dumps segregation ratio data to file for subsequent JAGS run}
\description{
  Given segregation ratio data provided as an object of class
  \code{segRatio}, data are dumped in \R format for use by \code{JAGS} 
}
\usage{
dumpData(seg.ratio, model, stem = "test", fix.one = TRUE,
 data.file = paste(stem, "-data.R", sep = ""))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{seg.ratio}{Object of class \code{\link[polySegratio]{segRatio}} contains the
    segregation ratios for dominant markers and other information
    such as the number of dominant markers per individual}
  \item{model}{Object of class \code{\link{modelSegratioMM}} containing
     mixture model information}
  \item{stem}{File name stem for data file (default \dQuote{test}) }
  \item{fix.one}{Logical to fix the dosage of the observation closest to
    the centre of each component on the logit scale. This can greatly
    assist with convergence (Default: \code{TRUE}) }
  \item{data.file}{Data file name which is automatically generated from
  \code{stem} if not specified}
}
\value{
  None.
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{  \code{\link[polySegratio]{segRatio}}  \code{\link{dump}} }
\examples{
## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)

## compute segregation ratios
sr <-  segregationRatios(a1$markers)

## set up model for 3 components of autooctoploid
x <- setModel(3,8)

\dontrun{
dumpData(sr, x)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
\keyword{data}% __ONLY ONE__ keyword per line
