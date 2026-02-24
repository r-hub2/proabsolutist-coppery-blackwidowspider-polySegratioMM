\name{DistributionPlotBinomial}
\alias{DistributionPlotBinomial}
\alias{DistributionPlotGamma}
\alias{DistributionPlotNorm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Distribution Plot}
\description{
  Plots probability density function given the parameters. May be useful when
  investigating parameter choice for prior distributions.
}
\usage{
DistributionPlotBinomial(size = 200, prob = 0.5,
xlab = "Number of Successes", ylab = "Probability Mass", signif.digits = 3,
main = paste("Binomial Distribution: n =", size, "p =",
signif(prob, digits = signif.digits)))

DistributionPlotGamma(shape = 1, rate = 1, length = 100, xlab = "x",
ylab = "Density", main = bquote(paste("Gamma Distribution: ", alpha,
"=", .(signif(shape, digits = signif.digits)), ",", beta, "=",
.(signif(rate, digits = signif.digits)))), signif.digits = 3)

DistributionPlotNorm(mean = 0, sd = 1, length = 100, xlab = "x", ylab =
"Density", main = bquote(paste("Normal Distribution: ", mu, "=",
.(signif(mean, digits = signif.digits)), ",", sigma, "=", .(signif(sd,
digits = signif.digits)))), signif.digits = 3)

}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{size}{number of trials (Binomial)}
  \item{prob}{probability of success (Binomial)}
  \item{shape}{shape parameter. Must be strictly positive. (Gamma)}
  \item{rate}{an alternative way to specify the scale (Gamma)}
  \item{mean}{mean (Normal)}
  \item{sd}{standard deviation (Normal)}
  \item{xlab}{x-axis label}
  \item{ylab}{y-axis label}
  \item{signif.digits}{number of significant digits for default
    \code{main} title}
  \item{main}{title for plot}
  \item{length}{Number of points to use for obtaining a smooth curve}
}
\details{
  Based on functions in package \code{Rcmdr}
}
\value{
  None.
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{ \code{\link[Rcmdr]{Rcmdr}} \code{\link{Binomial}}
  \code{\link{Normal}} \code{\link{GammaDist}} }
\examples{
## Binomial distribution
DistributionPlotBinomial()
DistributionPlotBinomial(size=20, prob=0.2)

## Gamma distribution
DistributionPlotGamma()

## Normal distribution
DistributionPlotNorm()
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{distribution }
\keyword{hplot}% __ONLY ONE__ keyword per line
