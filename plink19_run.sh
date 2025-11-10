#!/bin/bash 

#running plink1.9 with mros and sof data
hostname
date

chrs=({1..22})
for chr in "${chrs[@]}"; do
  echo "****************************************"
  echo "*****Analyzing chromosome ${chr}********"
  echo "****************************************"
  plink --pheno ../data/mrospheno.txt \
        --all-pheno \
        --covar ../data/mroscov.txt \
        --allow-no-sex \
        --fam ~/gwas_data/MrOS/chr${chr}.plink.fam \
        --map ~/gwas_data/MrOS/chr${chr}.plink.map \
        --dosage ~/gwas_data/MrOS/chr${chr}.plink.dose.gz noheader format=1 \
	--out ~/results/chr${chr}

done

date
