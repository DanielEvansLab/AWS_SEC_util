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

#copy notebook data to S3 bucket. Need to specify key
# key is the managed-s3-key that you select when creating a folder in S3
aws s3 cp --sse aws:kms --sse-kms-key-id de3a4459-602b-4989-ac6b-ef7d950f8651 README.md s3://managed-sagemaker-canvas-300741468439

#copy directory, use recursive flag
aws s3 cp --sse aws:kms --sse-kms-key-id de3a4459-602b-4989-ac6b-ef7d950f8651 ~/results/ s3://managed-sagemaker-canvas-300741468439 --recursive

