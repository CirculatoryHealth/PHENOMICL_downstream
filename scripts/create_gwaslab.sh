#!/bin/bash

echo ""
echo "*** Setting up a GWASlab environment ***"
echo ""
echo "Author: Sander W. van der Laan, UMC Utrecht."
echo "Date: 2021-10-17."
echo "Version: 1.0.0."
echo ""
echo "Description: This script will create a new mamba environment for GWASlab and install the necessary Python libraries and bioinformatics tools."
echo ""
echo ">>> Following on screen instructions is required to complete the installation. <<<"
echo ""
# Install llvm with Homebrew to resolve missing libunwind.1.dylib dependency
echo "> Installing llvm with Homebrew..."
brew install llvm

# Checking existing llvm
echo "> Checking existing llvm information..."
brew info llvm

# Deactivate existing gwaslab environment
echo "> Deactivating gwaslab environment"
mamba deactivate

# Remove existing gwaslab environment (if any)
echo "> Removing existing gwaslab environment..."
mamba env remove --name gwaslab

# Create a new environment for gwaslab
echo "> Creating new mamba environment for gwaslab..."
mamba create --name gwaslab python=3.9

# Activate the gwaslab environment
echo "> Activating gwaslab environment..."
mamba activate gwaslab

# Install necessary Python libraries using pip
echo "> Installing Python packages using pip..."
pip install numpy pandas requests tqdm rich peppy refgenconf myvariant mygene pybiomart rpy2 openpyxl pyliftover polars-lts-cpu ipykernel pyarrow cmcrameri

# Install essential bioinformatics tools
echo "> Installing bioinformatics tools (bcftools, samtools, vcftools, htslib)..."
mamba install bioconda::bcftools bioconda::samtools bioconda::vcftools bioconda::htslib

# Finally, install the specific version of gwaslab
echo "> Installing gwaslab version 3.4.46..."
pip install gwaslab==3.4.46

# Confirm installation
echo "Installation complete!"
