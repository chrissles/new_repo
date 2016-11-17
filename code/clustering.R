library(foreign)
library(flexclust)
nafam <- kccaFamily(name="kmeans-na", dist=distEuclideanNA, cent=centMeanNA)
load("../data/SyndicateHealthData.Rdata")
var <- load("../data/variables.Rdata")
var

args <- "encouragingMaintain" #commandArgs(TRUE)
for(vars in args){
  #for(vars in c("views", "benefits", "ratingCurrent", "chances","interests", "encouragingMaintain")){
  
  varNames <- get(vars)
  
  all.nas <- apply(data[,varNames], 1, function(x) sum(is.na(x)))
  which.keep <- (all.nas==0)
  
  block_bases <- na.omit(data[,varNames])
  coding <- get(paste0("coding.",vars))
  block_bases <- lapply(block_bases, function(x) {levels(x) <-
    coding; x})
  block_bases <- lapply(block_bases, function(x)
    as.numeric(as.character(x)))
  
  block_bases <- do.call(cbind, block_bases)
  
  nas <- apply(block_bases,1,function(x) sum(is.na(x)))
  block_bases <- block_bases[nas<dim(block_bases)[2],]
  
  colnames(block_bases) <- varNames
  nrep  <- 20
  nboot <- 100
  K <- 8
  
  block_kmeans_boot <- bootFlexclust(block_bases, k=2:K, family=nafam,
                                     nboot=nboot, nrep=nrep, 
                                     multicore=TRUE, verbose=TRUE)
  
  block_kmeans_mods <- stepFlexclust(block_bases, k=2:K, family=nafam,
                                     multicore=TRUE, nrep=10)
  
  
  save(block_kmeans_boot, block_kmeans_mods, file=paste0("../results/",vars,".rda"))
}


for(vars in c("views", "benefits", "ratingCurrent", "chances","interests", "encouragingMaintain")){
  
  varNames <- get(vars)
  all.nas <- apply(data[,varNames],1,function(x) sum(is.na(x)))
  which.keep <- (all.nas==0)
  block_bases <- na.omit(data[,varNames])
  save(which.keep,
       file=paste0("../results/which.keep.",vars,".rda"))
  
}
