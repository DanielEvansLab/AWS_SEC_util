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

#copy files within a dir
aws s3 cp s3://alliston-evans-181-4-c-us-west-2.sec.ucsf.edu/OAI_GWAS_results/results_aws/ $HOME/data --recursive --exclude "*" --include "bs_fem*"

aws s3 cp s3://alliston-evans-181-4-c-us-west-2.sec.ucsf.edu/OAI_GWAS_results/ $HOME/bin --recursive --exclude "results_aws/*"

#copy EC2 dir contents to S3
#this command will copy the contents of results/ to S3. It does NOT create a results subfolder in S3 - only the files are copied. 
aws s3 cp results/ s3://alliston-evans-181-4-c-us-west-2.sec.ucsf.edu/OAI_GWAS_results/results_magma/ --recursive

#copy S3 to local using aws cli
#first need to authenticate on local. From login page, click "access keys." This opens a pop-up window. Choose option 1, which sets 3 environment variables that gives temporary access. This works great in most cases. Then, I already have aws cli installed on local. So, I can run aws s3 commands that interact with S3.
#can be useful to use aws s3 sync if some results were previously copied. sync from to. aws s3 sync s3URI local

#copy notebook data to S3 bucket. Need to specify key
# key is the managed-s3-key that you select when creating a folder in S3
aws s3 cp --sse aws:kms --sse-kms-key-id de3a4459-602b-4989-ac6b-ef7d950f8651 README.md s3://managed-sagemaker-canvas-300741468439

#copy directory, use recursive flag
aws s3 cp --sse aws:kms --sse-kms-key-id de3a4459-602b-4989-ac6b-ef7d950f8651 ~/results/ s3://managed-sagemaker-canvas-300741468439 --recursive

#delete files from S3. Loginto EC2, run this to remove all gz files. Try dryrun first.
aws s3 rm s3://managed-sagemaker-canvas-300741468439/gwas_results --recursive --exclude "*" --include "*.gz" --dryrun
#this command will also delete the gwas_results folder itself, not just the files under it.
