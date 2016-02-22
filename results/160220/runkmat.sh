# run on thalassa with R version=3.2.2

# -- our name ---
#$ -N singlecellkernel 
#$ -S /bin/sh
# Make sure that the .e and .o file arrive in the
# working directory
#$ -cwd
# Merge the standard out and standard error to one file
#$ -o logs
#$ -e logs

# Make sure of sufficient memory for allocating kernel matrices
#$ -l mem_free=32G

# set up distributed jobs for nclust range
#$ -t 1

source $HOME/.bashrc
Rscript /cbio/donnees/yjiao/singlecellkernel/results/160220/runkmat.R 
