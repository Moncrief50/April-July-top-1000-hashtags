#!/bin/bash 
#SBATCH --partition=snsm_itn19 
#SBATCH --qos=openaccess 
#SBATCH --job-name=April_Analysis
#SBATCH -t 0-48:00:00 
#SBATCH -o /work_bgfs/r/rmoncrief/_Users_robertmoncrief_Desktop_Twitter_Data_2020_04-2020/April_Analysis%j.out 
#SBATCH -e /work_bgfs/r/rmoncrief/_Users_robertmoncrief_Desktop_Twitter_Data_2020_04-2020/April_Analysis%j.err 
#SBATCH --mail-user=rmoncrief@usf.edu # email address 
#SBATCH --mem=80GB #memory request
#SBATCH --mail-type=BEGIN 
#SBATCH --mail-type=END 
#SBATCH --mail-type=FAIL 
#SBATCH --ntasks=1 

module purge
module add apps/R/3.5.2
srun Rscript /work_bgfs/r/rmoncrief/_Users_robertmoncrief_Desktop_Twitter_Data_2020_04-2020/hashtags_analysis.R /works_bgs/r/rmoncrief/_Users_robertmoncrief_Desktop_Twitter_Data_2020_04-2020/April 
