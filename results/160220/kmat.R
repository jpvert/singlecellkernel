# this script makes kernel matrices for glioblastoma data (Patel et al., Science, 2014)
# 1 - (soft) kendall kernel with NAs replaced by 0
# 2 - top-k kendall kernel
# 3 - partial kendall kernel
# 4 - baseline kernel (Cap/Cup of non-zero presence)

setwd("/cbio/donnees/yjiao/singlecellkernel/results/160220/")

library(kernrank) # library(devtools); install_github("YunlongJiao/kernrank")
library(kernlab)

# read data

dat <- t(read.table("../../data/glioblastoma/glioblastoma.txt", header = TRUE))

# kernel and process functions

# 1 - total
kf_total <- get("kendall_total", mode = "function")
procf_total <- function(x) {x}

# 2 - top
kf_top <- get("kendall_top", mode = "function")
procf_top <- function(x) {x[x == 0] <- NA; x}

# 3 - partial
kf_partial <- get("kendall_partial", mode = "function")
procf_partial <- function(x) {x[x == 0] <- NA; x}

# 4 - baseline
kf_baseline <- function(x, y) {
  stopifnot((n <- length(x)) == length(y))
  stopifnot(!any(x<0) && !any(y<0))
  sum((x>0)*(y>0))/(n - sum((x==0)*(y==0)))
}
procf_baseline <- function(x) {x}

# compute kernel matrices
# run for c("total", "top", "partial", "baseline") corresp to above-defined kf and procf
for (key in c("total", "baseline")) {
  cat(key, "kernel running ... ")
  kf <- get(paste0("kf_", key), mode = "function"); class(kf) <- "kernel"
  procf <- get(paste0("procf_", key), mode = "function")
  
  x <- procf(dat)
  kmat <- kernelMatrix(kernel = kf, x = x)
  dimnames(kmat) <- list(rownames(x), rownames(x))
  cat("done!\n")
  write.table(kmat, file = paste0("../../data/glioblastoma/kmat_", key, ".txt"))
}
