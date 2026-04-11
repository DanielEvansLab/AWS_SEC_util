#!/bin/bash

~/bin/magma --annotate window=50 --snp-loc ../data/snp_loc.txt \
	--gene-loc ~/bin/magma_aux/NCBI38/NCBI38.gene.loc \
	--out ../results/OAI

cd ~/work/OAI/gwas_results_formatted/
file_names=($(ls *.txt))
cd ~/work/OAI/magma/scripts/

for file_name in "${file_names[@]}"; do
	echo $file_name
	trait=${file_name/.txt/}
	echo ${trait}
	file_name2=${trait}.genes.raw
	echo ${file_name2}

	~/bin/magma --bfile ~/bin/magma_aux/g1000_eur/g1000_eur \
		--pval ~/work/OAI/gwas_results_formatted/${file_name} ncol=OBS_CT \
		--gene-annot ../results/OAI.genes.annot \
		--out ../results/${trait}

	~/bin/magma --gene-results ../results/${file_name2} \
		--set-annot ../data/genesets.txt gene-col=3 set-col=1 \
		--out ../results/${trait}

done

