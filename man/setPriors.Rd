\name{setPriors}
\alias{setPriors}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Set prior distributions for parameters of Bayesian mixture model for dosages}
\description{

  May be used to automatically set up vague or strong priors or
  explicitly set them for Bayesian finite mixture model specified as an
  object of class \code{modelSegratioMM} using
  \code{setModel}

}
\usage{
setPriors(model, type.prior = c("strong",
              "vague", "strong.tau","strong.s", "specified"),
mean.vague = 0.1, prec.vague = 0.1, A.vague = 0.1, B.vague = 0.1,
prec.strong=400, n.individuals=200, reffect.A = 44, reffect.B = 0.8,
M.sd = 0.025, STRONG.PREC=c(0.025, 0.975), UPPER = 0.995,  PREC.INT=0.2,
params = NULL, segRatio = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{ object of class \code{modelSegratioMM} specifying model
    parameters, ploidy etc}
  \item{type.prior}{The type of prior required being one of
    \dQuote{strong}, \dQuote{vague}, \dQuote{strong.tau}
    \dQuote{strong.s} or \dQuote{specified}. The first
    four prior types will automatically set prior distributions whereas
    for the last, namely \dQuote{specified}, the prior distribution
    parameters must be set explicitly. Note that strong priors get
    progressively stronger from \dQuote{strong} to \dQuote{strong.s} }
  \item{mean.vague}{The mean of Normal priors for a \dQuote{vague} prior}
  \item{prec.vague}{The precision of Normal priors for a \dQuote{vague} prior}
  \item{A.vague}{The shape parameter of the Gamma prior for the
    precision parameters for a \dQuote{vague} prior }
  \item{B.vague}{ The rate (scale) parameter of the Gamma prior for the
    precision parameters for a \dQuote{vague} prior }
  \item{prec.strong}{Precision for Normal mean parameters when
    \code{type.prior} is \dQuote{strong}. Note that on logit scale
    default is equivalent to having a 95\%CI as +/- 0.1}
  \item{n.individuals}{Used for Binomial calculations to set prior
    precision parameters when \code{type.prior} is \dQuote{strong}.}
  \item{reffect.A}{ The shape parameter of the Gamma prior for the
    precision parameter of the random.effect for a \dQuote{vague} prior }
  \item{reffect.B}{The rate (scale) parameter of the Gamma prior for the
    precision parameter of the random.effect for a \dQuote{vague} prior}
  \item{M.sd}{Approximate standard deviation for the mean segregation
    ratios on raw probability scale - this is set to 0.025 which would
    give an approximate 95\% interval of 0.1 for the segregation ratio}
  \item{UPPER}{Cutoff for guessing parameters on logit scale noting that
    logit(1) is undefined}
  \item{STRONG.PREC}{Interval on raw probabilty scale used to set strong
    priors on the the precision distribution parameters of the
    segregation ratios by using a 95\% interval on the theoretical
    distribution and equating this on the logit scale (Default: c(0.025,
    0.975))}
  \item{PREC.INT}{Multiplier or setting prior for precision on logit
    scale corresponding to approx confidence region being precision*(1 -
    PREC.INT, 1 + PREC.INT) Default:0.2} 
  \item{params}{if \code{type.prior} is \dQuote{specified} then a list
    of priors parameters must be set containing components M for means,
    A and B for gamma prior parameters and if the model contains a
    random.effect then reffect.A, and reffect.B for the gamma prior for
    the precision of random effect \code{taub}. Note that the lengths of
    M, prec, A and B should be equal to the number of components}
  \item{segRatio}{If specified, this value overides the automatically
    generated value which is set as the expected segregation ratio given
    the ploidy level}
}
\value{
  Returns an object of class \code{priorsSegratioMM} which is a list
  with components
  \item{type}{Type of prior: one of \dQuote{vague}, \dQuote{strong}
    or \dQuote{specified}}
  \item{bugs.code}{Text containing prior statements for \code{BUGS} file}
  \item{random.effect}{Logical indicating whether model contains random
    effect (Default: \code{FALSE})}
  \item{equal.variances}{Logical indicating equal or separate variances
    for each component}
  \item{params}{List containing Normal means on logit scale
    \code{logit.means}, precision on logit scale \code{logit.prec}, and
    Gamma parameters \code{A} and \code{B} and finally \code{reffect.A} and
    \code{reffect.B} if the model contains a random effect}
  \item{call}{function call}
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{ \code{\link{setModel}} \code{\link{setInits}}
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
x2 <- setPriors(x)
print(x2)

x2b <- setPriors(x, "strong")
print(x2b)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
\concept{segregation ratio}% __ONLY ONE__ keyword per line
\concept{dominant marker}
\concept{autopolyploid}
