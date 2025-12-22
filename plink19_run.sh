#!/bin/bash 

#running plink1.9 with mros and sof data
hostname
date

chrs=({1..22})
phenos=(hip_fem_l hip_fem_r)

for pheno in "${phenos[@]}"; do
for chr in "${chrs[@]}"; do
  echo "***********************************************************"
  echo "*****Analyzing phenotype ${pheno} chromosome ${chr}********"
  echo "***********************************************************"
  plink --pheno $HOME/data/mrospheno.txt \
  --pheno-name ${pheno} \
  --covar $HOME/data/mroscov.txt \
  --allow-no-sex \
  --fam $HOME/gwas_data/MrOS/chr${chr}.plink.fam \
  --map $HOME/gwas_data/MrOS/chr${chr}.plink.map \
  --dosage $HOME/gwas_data/MrOS/chr${chr}.plink.dose.gz noheader format=1 Zout\
  --out $HOME/results/${pheno}_chr${chr}

done
done

date
