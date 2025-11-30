#!/bin/bash 

#running plink1.9 with mros and sof data
hostname
date

chrs=({1..22})
for chr in "${chrs[@]}"; do
  echo "****************************************"
  echo "*****Analyzing chromosome ${chr}********"
  echo "****************************************"
  plink --pheno $HOME/data/mrospheno.txt \
  --all-pheno \
  --covar $HOME/data/mroscov.txt \
  --allow-no-sex \
  --fam $HOME/gwas_data/MrOS/chr${chr}.plink.fam \
  --map $HOME/gwas_data/MrOS/chr${chr}.plink.map \
  --dosage $HOME/gwas_data/MrOS/chr${chr}.plink.dose.gz noheader format=1 \
  --out $HOME/results/chr${chr}

done

date
