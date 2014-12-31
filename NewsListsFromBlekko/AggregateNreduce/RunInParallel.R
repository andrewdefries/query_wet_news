library(parallel)

RunThis<-function(x){
system("./CycleThroughFilterShuf.sh", intern=F)
}
x<-1:8
mclapply(x, RunThis, mc.cores=16)



