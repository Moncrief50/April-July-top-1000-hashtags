#!/bin/bash 
#SBATCH --partition=snsm_itn19 
#SBATCH --qos=openaccess 
#SBATCH --job-name=July_Analysis
#SBATCH -t 0-48:00:00 
#SBATCH -o /work_bgfs/r/rmoncrief/July/July_Analysis%j.out 
#SBATCH -e /work_bgfs/r/rmoncrief/July/July_Analysis%j.err 
#SBATCH --mail-user=rmoncrief@usf.edu # email address 
#SBATCH --mem=110GB #memory_request
#SBATCH --mail-type=BEGIN 
#SBATCH --mail-type=END 
#SBATCH --mail-type=FAIL 
#SBATCH --ntasks=1 

module purge
module add apps/R/3.5.2
srun Rscript /work_bgfs/r/rmoncrief/July/hashtags_analysis.R /work_bgfs/r/rmoncrief/July/07-2020/07-2020

