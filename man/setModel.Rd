\name{setModel}
\alias{setModel}
\alias{modelSegratioMM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Set characteristics of the Bayesian mixture model for dosages}
\description{
  Used to automatically set up Bayesian finite mixture models
  for dosage allocation of dominant markers in autopolyploids given the
  number of components and ploidy level
}
\usage{
setModel(n.components, ploidy.level, random.effect = FALSE, seg.ratios =NULL,
 ploidy.name = NULL, equal.variances=TRUE, 
 type.parents = c("heterogeneous", "homozygous"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n.components}{number of components for mixture model (less than
    or equal to maximum number of possible dosages)}
  \item{ploidy.level}{the number of homologous chromosomes, either as
    numeric or as a character string}
  \item{random.effect}{Logical indicating whether model contains random
    effect (Default: \code{FALSE})}
  \item{seg.ratios}{segregation proportions for each marker provided as
    S3 class \code{segRatio}}
  \item{ploidy.name}{Can overide ploidy name here or allow it to be
    determined from  \code{ploidy.level} }
  \item{equal.variances}{Logical indicating whether model contains
    separate or common variances for each component (Default: \code{TRUE})}
  \item{type.parents}{ "heterogeneous" if parental markers are 0,1 or
    "homogeneous" if parental markers are both 1}
}
\value{
  Returns object of class \code{modelSegratioMM} with components
  \item{bugs.code}{text to be used by \code{JAGS} in the .bug file but
    without statements pertaining to priors}
  \item{n.components}{number of components for mixture model}
  \item{monitor.var}{names of variables to be monitored in \code{JAGS} run}
  \item{ploidy.level}{ploidy level}
  \item{random.effect}{Logical indicating whether model contains random
    effect (Default: \code{FALSE})}
  \item{equal.variances}{Logical indicating equal or separate variances
    for each component}
  \item{E.segRatio}{Expected segregation ratios}
  \item{type.parents}{ "heterogeneous" if parental markers are 0,1 or
    "homogeneous" if parental markers are both 1}
  \item{call}{function call}
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{ \code{\link{setPriors}} \code{\link{setInits}}
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
print(x)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
\concept{segregation ratio}% __ONLY ONE__ keyword per line
\concept{dominant marker}
\concept{autopolyploid}
