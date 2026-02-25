## ----echo = FALSE-------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#:",
  fig.path = "man/figures/"
)
## output: BiocStyle::html_document
##version <- as.vector(read.dcf('DESCRIPTION')[, 'Version'])
##version <- gsub('-', '.', version)
version <- "0.6-5"

## -----------------------------------------------------------------------------
library(polySegratioMM)

## ----echo=FALSE-----------------------------------------------------
##library(cacheSweave)  #  comment this out after development phase
## to use:    Sweave("polySegratioMM-overview.Rnw", driver=cacheSweaveDriver)
## or without cache: Sweave("polySegratioMM-overview.Rnw")
op <- options()
options(width=70, digits=4)

## ----echo=FALSE-----------------------------------------------------
##<<simData, cache=true}
## simulate small autohexaploid data set of 500 markers for 200 individuals
## with %70 Single, %20 Double and %10 Triple Dose markers
## created with 
## hexmarkers <- sim.autoMarkers(6,c(0.7,0.2,0.1),n.markers=500,n.individuals=200)
## save(hexmarkers, file="../../data/hexmarkers.RData")
data(hexmarkers)

## ----eval=FALSE-----------------------------------------------------
#   hexmarkers <- sim.autoMarkers(6,c(0.7,0.2,0.1),n.markers=500,n.individuals=200)

## -------------------------------------------------------------------
print(hexmarkers)

## -------------------------------------------------------------------
sr <-  segregationRatios(hexmarkers$markers)

## ----sim1, echo=FALSE, fig.cap='Segregation ratios of 500 simulated markers from 200 autohexaploid individuals. Percentages of single, double, and triple dosemarkers are 70%, 20% and 10%, respectively. Data were generated assuming no overdispersion', out.width='50%'----
plotTheoretical(ploidy.level=6, seg.ratios=sr,
  expected.segratio=NULL, proportions=c(0.7,0.2,0.1),
  n.individuals=200)

## ----eval=FALSE-----------------------------------------------------
# plotTheoretical(ploidy.level=6, seg.ratios=sr,
#   expected.segratio=NULL, proportions=c(0.7,0.2,0.1),
#   n.individuals=200)

## ----eval=FALSE-----------------------------------------------------
# hexmarkers.overdisp <- sim.autoMarkers(6, c(0.7,0.2,0.1),
#                                        n.markers=500,n.individuals=200,
#                                        overdispersion=TRUE, shape1=30)

## -------------------------------------------------------------------
sr.overdisp <- segregationRatios(hexmarkers.overdisp$markers)

## ----sim2, echo=FALSE, fig.cap='Segregation ratios of 500 simulated markers from 200 autohexaploid individuals.  Percentages of single double and triple dose markers are 70%, 20% and 10%, respectively. Data were generated from the Beta-Binomial distribution assuming a shape parameter `shape1` of 30.', out.width='50%'----
print(plotTheoretical(ploidy.level=6, seg.ratios=sr.overdisp, main="",
  expected.segratio=NULL, proportions=c(0.7,0.2,0.1),
  n.individuals=200))

## -------------------------------------------------------------------
x.mod1 <- setModel(3,6)  # autohexaploid model with 3 components

## ----eval=FALSE-----------------------------------------------------
# mcmcHexRun <- runSegratioMM(sr.overdisp, x.mod1)

## ----echo=FALSE-----------------------------------------------------
## produced using the following but loaded as data to avoid the run time on slow machines
##mcmcHexRun <- runSegratioMM(sr.overdisp, x.mod1, burn.in=200, sample=500, plots=FALSE)
##mcmcHexRun <- runSegratioMM(sr.overdisp, x.mod1, plots=FALSE)
## save(mcmcHexRun, file="../../data/mcmcHexRun.RData")
data(mcmcHexRun)

## -------------------------------------------------------------------
print(mcmcHexRun$run.jags)

## -------------------------------------------------------------------
print(mcmcHexRun$summary)

## -------------------------------------------------------------------
print(mcmcHexRun$diagnostics)

## -------------------------------------------------------------------
print(mcmcHexRun$doses)

## ----trace1, fig.cap='Trace and posterior density plots for the parameters parameters $p_1$, $\\mu_1$, $\\sigma_1$ and for the 140^th^ marker for the overdispersed data', fig.height=12, out.width='100%'----
plot(mcmcHexRun$mcmc.mixture$mcmc.list[[1]][,c("P[1]","mu[1]","sigma","T[140]")])

## ----eval=FALSE-----------------------------------------------------
# plot(mcmcHexRun$mcmc.mixture$mcmc.list[[1]][,c("P[1]","mu[1]","sigma","T[140]")])

## ----fitted1, echo=FALSE, fig.cap='Fitted (blue) and theoretical (red) distributions for simulated segregation ratios with overdispersion for 500 markers from 200 individuals.', out.width='50%'----
plot(mcmcHexRun, theoretical=TRUE, main="")

## ----eval=FALSE-----------------------------------------------------
# plot(mcmcHexRun, theoretical=TRUE)

## -------------------------------------------------------------------
cat("Employing maximum posterior probability\n")
table(Dose=mcmcHexRun$doses$max.post.dosage, exclude=NULL)
cat("Employing posterior probability > 0.8\n")
table(Dose=mcmcHexRun$doses$dosage[,"0.8"], exclude=NULL)

## -------------------------------------------------------------------
cat("Employing theChi squared test\n")
dose.chi <- test.segRatio(sr.overdisp, ploidy.level = 6)
table(Chi2Dose=dose.chi$dosage,
  True=hexmarkers.overdisp$true.doses$dosage, exclude=NULL)
cat("Employing maximum posterior probability\n")
table(MixtureDose=mcmcHexRun$doses$max.post.dosage,
  True=hexmarkers.overdisp$true.doses$dosage, exclude=NULL)
cat("Employing posterior probability > 0.8\n")
table(MixtureDose=mcmcHexRun$doses$dosage[, "0.8"],
  True=hexmarkers.overdisp$true.doses$dosage, exclude=NULL) 

