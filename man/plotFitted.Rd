\name{plotFitted}
\alias{plotFitted}
\alias{plotTheoretical}
\alias{plot.runJagsWrapper}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot observed segregation ratios and fitted and theoretical models}
\description{
  Plots  histogram of observed segregation ratios on
  logit scale along with scaled density of fitted
  components corresponding to dosage classes. Plots of expected
  theoretical distributions can be plotted with or without segregation
  ratio data.
}
\usage{

\method{plot}{runJagsWrapper}(x, theoretical=FALSE, ...)

plotFitted(seg.ratios, summary.mixture, add.random.effect=TRUE,
  theoretical=FALSE, model=NULL, theory.col="red",
  xaxis=c("logit","raw"), ylim=NULL, NCLASS=NULL, n.seq=100,
  xlab="logit(Segregation Ratio)", ylab="Density", density.plot=FALSE,
  fitted.lwd=2, fitted.col="blue", bar.col="lightgreen", cex=1,
  warnings = FALSE, main=NULL, ...)

plotTheoretical(ploidy.level=8, seg.ratios=NULL, n.components=NULL,
  expected.segratio=NULL, proportions=c(0.65,0.2,0.1,0.03,0.01,0.01, 0, 0),
  n.individuals=200, xaxis=c("raw","logit"),
  type.parents=c("heterogeneous","homozygous"), xlim=c(0,1),
  NCLASS=NULL, xlab="Segregation Ratio", ylab="Density",
  density.plot=FALSE, fitted.lwd=2, fitted.col="blue", cex=1,
  warnings = TRUE, main=NULL, ...)

}
%- maybe also 'usage' for other objects documented here.

\arguments{
  \item{x}{object of class \code{runJagsWrapper} produced by using
    \code{runSegratioMM} to set up and fit mixture model}
  \item{seg.ratios}{segregation ratios as class \code{segRatio} }
  \item{summary.mixture}{mcmc summary data produce by
    \code{summary.segratioMCMC}}
  \item{add.random.effect}{ add random variance component to fitted
    distribution plot if model includes a random effect (default: TRUE)}
  \item{theoretical}{whether to plot the expected theoretical
    distribution under the fitted model (default: FALSE)}
  \item{model}{object of class \code{modelSegratioMM} specifying model
    if plotting expected theoretical distribution}
  \item{theory.col}{colour for expected theoretical distribution
    (default: "red")}
  \item{ploidy.level}{the number of homologous chromosomes}
  \item{n.components}{number of components for mixture model}
  \item{expected.segratio}{may be specified or automatically calculated
    from ploidy level etc}
  \item{xaxis}{whether to plot on "logit" or "raw" scale. Defaults to
    "logit" if plotting segregation ratios or "raw" for theoretical
    distributions}
  \item{proportions}{for no. of markers in each component of theoretical
    distribution plot}
  \item{n.individuals}{for theoretical distribution plot - taken from
    segregation ratios if supplied}
  \item{type.parents}{ "heterogeneous" if parental markers are 0,1 or
    "homogeneous" if parental markers are both 1}
  \item{ylim}{ c(lower,upper) yaxis limits for histogram of segregation ratios}
  \item{xlim}{ c(lower,upper) xaxis limits for segregation ratios}
  \item{NCLASS}{number of classes for histogram (Default: 100)}
  \item{n.seq}{number of points to use for plotting fitted mixture}
  \item{xlab}{x-axis label}
  \item{ylab}{y-axis label}
  \item{density.plot}{whether to plot a smoothed density as well as
  segregation data and fitted and/or theoretical distributions (default:
  FALSE)}
  \item{main}{title for plot}
  \item{fitted.lwd}{width for fitted line}
  \item{fitted.col}{colour for fitted line}
  \item{bar.col}{colour for histogram}
  \item{cex}{character expansion for text (see \code{\link{par}})}
  \item{warnings}{print warnings like number of components etc (Default: FALSE)}
  \item{\dots}{extra options for \code{plot}}
}
\details{

   \code{plotFitted} plot histogram of observed segregation ratios on
   logit scale along with scaled density of fitted
   components corresponding to dosage classes using trellis

   \code{plotTheoretical} plot expected distribution of
   autopolyploid dominant markers on probability (0,1)
   scale. Segregation ratios may also be plotted

   \code{plot.runJagsWrapper} plots the fitted values of object of class
    \code{runJagsWrapper} which has been produced by using
    \code{runSegratioMM} to set up and fit mixture model
   
   Note that since trellis graphics are employed, plots may need to be
   printed in order to see them
   
}
\value{ None.
}
\author{Peter Baker \email{drpetebaker@gmail.com}}
\seealso{ \code{\link[coda]{summary.mcmc}} \code{\link[coda]{mcmc}}
  \code{\link{segratioMCMC}} \code{\link{readJags}}
  \code{\link{diagnosticsJagsMix}} \code{\link{runSegratioMM}} 
}
\examples{
## simulate small autooctaploid data set
plotTheoretical(8, proportion=c(0.7,0.2,0.1),n.individuals=50)
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)
##print(a1)
sr <-  segregationRatios(a1$markers)
x <- setModel(3,8)

## fit simple model in one hit and summarise
\dontrun{
x.run <- runSegratioMM(sr, x, burn.in=200, sample=500)
print(x.run)

## plot fitted model using 'plotFitted'
plotFitted(sr, x.run$summary)
a.plot <- plotFitted(sr, x.run$summary, density.plot=TRUE)
print(a.plot)
## or the easier way
plot(x.run, theoretical=TRUE)
}
}
%Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{manip}
\concept{segregation ratio}% __ONLY ONE__ keyword per line
\concept{dominant marker}
\concept{autopolyploid}
