#!/bin/bash

hostname
date

chrs=({1..22})

for chr in "${chrs[@]}"; do
  echo "Analyzing chromosome ${chr}"
  plink2 --pfile $HOME/gwas_data/chr${chr} \
  --pheno iid-only $HOME/data/pheno.txt \
  --no-psam-pheno \
  --covar iid-only $HOME/data/covar.txt \
  --no-input-missing-phenotype \
  --covar-variance-standardize \
  --glm hide-covar \
  --out $HOME/results/chr${chr}
done 

date
