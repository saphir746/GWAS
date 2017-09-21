#!/bin/sh

#PBS -N vep_annot
#PBS -k oe
#PBS -l select=1:ncpus=20:mem=16gb
#PBS -l walltime=8:00:00
###PBS -q med-bio

module load R/3.3.2
module load gcc
Rscript ${PBS_O_WORKDIR}/ManPlotCX1.R <file>.csv noMI 5e-7

cp *.png ${PBS_O_WORKDIR}

