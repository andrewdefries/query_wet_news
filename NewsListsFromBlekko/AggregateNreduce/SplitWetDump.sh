splitval=(`cat 2014_WetDump | wc -l`)
#2eval=`expr $splitval/nproc*4`
ncores=(`nproc`)
#let 2eval= "$splitval / $ncores" 
echo "$2eval lines per split"
#split -l $2eval 2014_WetDump DoWork_
split -l 3475 2014_WetDump DoWork_
