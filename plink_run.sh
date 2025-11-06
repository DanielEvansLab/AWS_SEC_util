#!/bin/bash

hostname
date

chrs=({1..22})

for chr in "${chrs[@]}"; do
	echo "this is chromosome ${chr}"
done 
