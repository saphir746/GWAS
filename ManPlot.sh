#!/bin/sh

#PBS -N vep_annot
#PBS -k oe
#PBS -l select=1:ncpus=20:mem=16gb
#PBS -l walltime=8:00:00
###PBS -q med-bio

module load R/3.3.2
module load gcc
Rscript ${PBS_O_WORKDIR}/ManPlotCX1.R /groupvol/med-bio/epiUKB//UKB_assoc_500k/results/CardiacGWAS/output/noMI/BOLT_output.csv noMI 5e-7

Rscript ${PBS_O_WORKDIR}/ManPlotCX1.R /groupvol/med-bio/epiUKB//UKB_assoc_500k/results/CardiacGWAS/output/noMI_hBP/BOLT_output.csv noMI_hBP 5e-7

Rscript ${PBS_O_WORKDIR}/ManPlotCX1.R /groupvol/med-bio/epiUKB//UKB_assoc_500k/results/CardiacGWAS/output/noMI_hBP_diab_RA/BOLT_output.csv noMI_hBP_diab_RA 5e-7

