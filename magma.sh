#!/bin/bash

$HOME/bin/magma --annotate window=50 --snp-loc $HOME/bin/snp_loc.txt \
	--gene-loc $HOME/bin/NCBI38.gene.loc \
	--out $HOME/results/OAI

cd $HOME/data/
file_names=($(ls *.txt))
cd $HOME/AWS_SEC_util/

for file_name in "${file_names[@]}"; do
	echo $file_name
	trait=${file_name/.txt/}
	echo ${trait}
	file_name2=${trait}.genes.raw
	echo ${file_name2}

	$HOME/bin/magma --bfile $HOME/bin/g1000_eur \
		--pval $HOME/data/${file_name} ncol=OBS_CT \
		--gene-annot $HOME/results/OAI.genes.annot \
		--gene-model snp-wise=top \
		--out $HOME/results/${trait}

	$HOME/bin/magma --gene-results $HOME/results/${file_name2} \
		--set-annot $HOME/bin/genesets.txt gene-col=3 set-col=1 \
		--out $HOME/results/${trait}

done

