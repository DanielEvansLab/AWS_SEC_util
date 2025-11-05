#!/bin/bash

mkdir $HOME/data

aws s3 sync s3://alliston-evans-181-4-c-us-west-2.sec.ucsf.edu/OAI_pheno/ $HOME/data

mkdir $HOME/gwas_data

aws s3 sync s3://alliston-evans-181-4-c-us-west-2.sec.ucsf.edu/OAI_topmed_data/ $HOME/gwas_data


