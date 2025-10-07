#!/bin/bash -l

#SBATCH -A allusers
#SBATCH -p dev-e
#SBATCH --time=01:00:00
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=4
#SBATCH --mem-per-cpu=2G
#SBATCH --job-name=quantum_espresso
#SBATCH --output=qe_test.%j

module load quantum-espresso/7.4-openmpi/gcc-12.3.0

env | grep SLURM &> slurm_envs.${SLURM_JOBID}

mpirun -n ${SLURM_NPROCS} pw.x -i au.scf.in
