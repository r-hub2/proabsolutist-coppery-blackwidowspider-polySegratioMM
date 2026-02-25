## ----include=FALSE------------------------------------------------------------
library(knitr)
opts_chunk$set(
fig.path='tmp/tmp'
)

## ----setup, include=FALSE, cache=FALSE----------------------------------------
render_sweave()

## -----------------------------------------------------------------------------
library(polySegratioMM)

## ----echo=FALSE-----------------------------------------------------
##library(cacheSweave)  #  comment this out after development phase
## to use:    Sweave("polySegratioMM-overview.Rnw", driver=cacheSweaveDriver)
## or without cache: Sweave("polySegratioMM-overview.Rnw")
op <- options()
options(width=70, digits=4)

## ----echo=FALSE-----------------------------------------------------
data(hexmarkers)

## -------------------------------------------------------------------
##<<simData, cache=true>>=
## simulate small autohexaploid data set of 500 markers for 200 individuals
## with %70 Single, %20 Double and %10 Triple Dose markers
## created with 
## hexmarkers <- sim.autoMarkers(6,c(0.7,0.2,0.1),n.markers=500,n.individuals=200)
## save(hexmarkers, file="../../data/hexmarkers.RData")
print(hexmarkers)

## -------------------------------------------------------------------
sr <-  segregationRatios(hexmarkers$markers)

## ----echo=FALSE-----------------------------------------------------
print(plotTheoretical(ploidy.level=6, seg.ratios=sr, main="",
  	    expected.segratio=NULL, proportions=c(0.7,0.2,0.1),
  	    n.individuals=200))

## ----echo=FALSE-----------------------------------------------------
##<<simDataOver, cache=true>>=
## simulate small autohexaploid data set of 500 markers for 200 individuals
## with %70 Single, %20 Double and %10 Triple Dose markers 
## hexmarkers.overdisp <- sim.autoMarkers(6,c(0.7,0.2,0.1),overdispersion=TRUE, shape1=30,n.markers=500,n.individuals=200)
## save(hexmarkers.overdisp, file="../../data/hexmarkers.overdisp.RData")
data(hexmarkers.overdisp)
##print(hexmarkers.overdisp)

## -------------------------------------------------------------------
sr.overdisp <-  segregationRatios(hexmarkers.overdisp$markers)

## ----echo=FALSE-----------------------------------------------------
print(plotTheoretical(ploidy.level=6, seg.ratios=sr.overdisp, main="",
  expected.segratio=NULL, proportions=c(0.7,0.2,0.1),
  n.individuals=200))

## -------------------------------------------------------------------
x.mod1 <- setModel(3,6)  # autohexaploid model with 3 components

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

## ----echo=FALSE-----------------------------------------------------
print(plot(mcmcHexRun$mcmc.mixture$mcmc.list[[1]][,c("P[1]","mu[1]","sigma","T[140]")]))

## ----echo=FALSE-----------------------------------------------------
print(plot(mcmcHexRun, theoretical=TRUE, main=""))

## -------------------------------------------------------------------
cat("Employing maximum posterior probability\n")
table(Dose=mcmcHexRun$doses$max.post.dosage, exclude=NULL)
cat("Employing posterior probability > 0.8\n")
table(Dose=mcmcHexRun$doses$dosage[,"0.8"], exclude=NULL)

## -------------------------------------------------------------------
cat("Employing theChi squared test\n")
dose.chi <- test.segRatio(sr.overdisp, ploidy.level = 6)
table(Chi2Dose=dose.chi$dosage, True=hexmarkers.overdisp$true.doses$dosage, exclude=NULL)
cat("Employing maximum posterior probability\n")
table(MixtureDose=mcmcHexRun$doses$max.post.dosage, True=hexmarkers.overdisp$true.doses$dosage,
exclude=NULL)
cat("Employing posterior probability > 0.8\n")
table(MixtureDose=mcmcHexRun$doses$dosage[,"0.8"], True=hexmarkers.overdisp$true.doses$dosage,
exclude=NULL)

