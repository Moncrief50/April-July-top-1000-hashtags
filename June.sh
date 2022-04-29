#!/bin/bash 
#SBATCH --partition=snsm_itn19 
#SBATCH --qos=openaccess 
#SBATCH --job-name=June_Analysis
#SBATCH -t 0-48:00:00 
#SBATCH -o /work_bgfs/m/matiascasas/Twitter_CSVs/June_Analysis%j.out 
#SBATCH -e /work_bgfs/m/matiascasas/Twitter_CSVs/June_Analysis%j.err 
#SBATCH --mail-user=matiascasas@usf.edu # email address 
#SBATCH --mem=95GB #memory request
#SBATCH --mail-type=BEGIN 
#SBATCH --mail-type=END 
#SBATCH --mail-type=FAIL 
#SBATCH --ntasks=1 

module purge
module add apps/R/3.5.2
srun Rscript /work_bgfs/m/matiascasas/Twitter_CSVs/hashtags_analysis.R /work_bgfs/m/matiascasas/Twitter_CSVs/06-2020
