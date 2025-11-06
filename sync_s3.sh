#!/bin/bash

if [ -d "$HOME/data" ]; then
  echo "$HOME/data exists"
else
  mkdir $HOME/data
fi

aws s3 sync s3://alliston-evans-181-4-c-us-west-2.sec.ucsf.edu/OAI_pheno/ $HOME/data

if [ -d "$HOME/gwas_data" ]; then
  echo "$HOME/gwas_data exists"
else
  mkdir $HOME/gwas_data
fi

aws s3 sync s3://alliston-evans-181-4-c-us-west-2.sec.ucsf.edu/OAI_topmed_data/ $HOME/gwas_data


