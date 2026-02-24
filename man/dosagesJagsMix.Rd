\name{dosagesJagsMix}
\alias{dosagesJagsMix}
\alias{dosagesMCMC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Compute dosages under specified Bayesian mixture model}
\description{ Computes and returns estimated dosages under specified
  model using posterior probabilities derived from mcmc chains by
  the proportion of samples in each dosage class.
}
\usage{
dosagesJagsMix(mcmc.mixture, jags.control, seg.ratio, chain = 1,
max.post.prob = TRUE, thresholds = c(0.5, 0.6, 0.7, 0.8, 0.9, 0.95,
0.99), print = FALSE, print.warning = TRUE, index.sample = 20)

}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mcmc.mixture}{Object of type \code{\link{segratioMCMC}}
    produced by \code{coda} usually by using \code{\link{readJags}}}
  \item{jags.control}{Object of class \code{jagsControl} for setting up
    \code{JAGS} command file }
  \item{seg.ratio}{Object of class \code{\link[polySegratio]{segRatio}} contains the
    segregation ratios for dominant markers and other information
    such as the number of dominant markers per individual}
  \item{chain}{Which chain to use when compute dosages (Default: 1)}
  \item{max.post.prob}{Logical for producing dose allocations based on the
    maximum posterior probability (Default: \code{TRUE})}
  \item{thresholds}{Numeric vector of thresholds for  allocating
    dosages when the posterior probabilty to a particular dosage class
    is above the threshold }
  \item{print}{Logical indicating whether or not to print intermediate
    results (Default: \code{FALSE}) }
  \item{print.warning}{Logical to print warnings if there is more than
    one marker with the maximum posterior probability  }
  \item{index.sample}{Numeric vector indicating which markers to print
    if \code{print} is \code{TRUE}. If \code{index.sample} is of length
    1 then a random sample of size \code{index.sample} is selected }
}
\value{
  An object of class \code{\link{dosagesMCMC}} is returned with components:
  \item{p.dosage }{Matrix of posterior probabilities of dosages for each
  marker dosage}
  \item{dosage}{Matrix of allocated dosages based on posterior probabilities.
    The columns correspond to different 'thresholds' and if requested,
    the last column is allocated on basis of \code{max.post}}
  \item{thresholds}{vector of cutoff probabilities for dosage class}
  \item{chain}{Chain used to compute dosages}
  \item{max.post}{maximum dosage posterior probabilties for each marker}
  \item{index.sample}{Numeric vector indicating which markers to print
    if \code{print} is \code{TRUE}. If \code{index.sample} is of length
    1 then a random sample of size \code{index.sample} is selected }
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{ \code{\link{dosagesMCMC}}  \code{\link{readJags}}}
\examples{
## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)

## compute segregation ratios
sr <-  segregationRatios(a1$markers)

## set up model, priors, inits etc and write files for JAGS
x <- setModel(3,8)
x2 <- setPriors(x)

\dontrun{
## write control files for JAGs run
dumpData(sr, x)
inits <- setInits(x,x2)
dumpInits(inits)
writeJagsFile(x, x2, stem="test")

## run JAGS
small <- setControl(x, burn.in=200, sample=500)
writeControlFile(small)
rj <- runJags(small)  ## just run it
print(rj)

## read mcmc chains and produce dosage allocations
xj <- readJags(rj)
dd <- dosagesJagsMix(xj, small, sr)
print(dd)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
\concept{segregation ratio}% __ONLY ONE__ keyword per line
\concept{dominant marker}
\concept{autopolyploid}
