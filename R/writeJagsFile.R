`writeJagsFile` <-
function(model, priors, stem="test") {

  if (!inherits(model, "modelSegratioMM"))
    stop("model must be of class 'modelSegratioMM'")

  if (!inherits(priors, "priorsSegratioMM"))
    stop("model must be of class 'priorsSegratioMM'")
  
  bc <- gsub("STEM",stem,model$bugs.code)
  bc[2] <- paste(bc[2],date())
  cat(file=paste(stem,".bug",sep=""),
      gsub("UNSPECIFIED", priors$type, bc), priors$bugs.code, sep="\n")
}

