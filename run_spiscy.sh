#!/bin/bash

# =================================
# SPiSCy launcher
# =================================

# Go to workflow directory
cd /path to spiscy folder

# Load apptainer and python modules
module load apptainer/1.4.5
module load python/3.11

# Activate Snakemake environment with slurm plugin
source ~/envs/snakemake/bin/activate

# Change default maximum mount time (seconds)
export APPTAINER_MOUNT_TIMEOUT=20

# Define how many jobs to run in parallel
JOBS=50

# Optional: enable latency wait (helpful on networked filesystems)
LATENCY_WAIT=60

# Run the pipeline with the SLURM executor plugin
snakemake \
  --executor slurm \
  --profile workflow/profiles/slurm \
  --rerun-incomplete \
  --jobs $JOBS \
  --latency-wait $LATENCY_WAIT \
  --sdm apptainer \
  --apptainer-args="-B /path to spiscy folder:/same path to spiscy folder"