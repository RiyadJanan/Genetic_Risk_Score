#!/bin/bash

# Input VCF file and output files
VCF_FILE="individuals.vcf"
VCF_DATA_FILE="vcf_data.txt"

# Remove header lines starting with ##
grep -v "##" $VCF_FILE | cut -f3,5,10- > $VCF_DATA_FILE

# Convert genotype formats to numerical values

sed -i "s/0\/0/0/g" $VCF_DATA_FILE
sed -i "s/0\/1/1/g" $VCF_DATA_FILE
sed -i "s/1\/1/2/g" $VCF_DATA_FILE