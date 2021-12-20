#!/bin/bash

#SBATCH --time=24:00:00
#SBATCH --job-name=20211207_stringtie_isar
#SBATCH --output=20211207_stringtie_isar.txt
#SBATCH --mail-user=hasna.khan@mail.utoronto.ca
#SBATCH --mail-type=ALL

module load gcc
module load r/4.1.2

cd $SLURM_SUBMIT_DIR

Rscript stringtie_ISAR_niagara.R