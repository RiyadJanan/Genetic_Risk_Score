# Gene Risk Score Analysis for Type 1 Diabetes and Monogenic Diabetes

## Overview

This repository contains the code for **Assessment 2**, which focuses on the calculation and analysis of **Genetic Risk Scores (GRS)** to distinguish between **Type 1 Diabetes (T1D)** and **Monogenic Diabetes**. The core of this analysis lies in comparing the **Genetic Risk Score (GRS)** of patient P3 against case and control groups to determine their likelihood of developing T1D or Monogenic Diabetes.

## Context

In this study, we calculate the **Genetic Risk Score** for various individuals using weighted alleles and haplotypes. The results indicate that **P3's GRS** is significantly higher, suggesting a stronger **polygenic** component typically associated with **Type 1 Diabetes** rather than a monogenic form of diabetes. The findings point towards a polygenic etiology, further supporting the diagnosis of **Type 1 Diabetes** for patient P3.

The results and conclusions are based on the following key metrics:

- **P3's standardized GRS**: 377.2837
- **Control group mean GRS**: 0.229063
- **Control group standard deviation (SD) GRS**: 0.03443281
- **Case group mean GRS**: 0.2787784
- **Case group standard deviation (SD) GRS**: 0.02556913

### Findings

- **P3's GRS** is significantly higher than both the control and case group averages, pointing to a substantial polygenic effect.
- Incorporating additional **SNPs** and **haplotypes** could provide a more comprehensive genetic profile and improve the discriminatory power between Type 1 Diabetes and Monogenic Diabetes.
- Further precision in diagnosis can be achieved by integrating clinical data such as **family history**, **BMI**, **age of onset**, and **biochemical markers** (e.g., **C-peptide levels**).

## Key Recommendations for Improving Discriminatory Power

To enhance the ability to differentiate between Type 1 and Monogenic Diabetes, the following strategies are suggested:

1. **Expand Genetic Variant Coverage**: Include more **SNPs** and **haplotypes** associated with Type 1 and Monogenic Diabetes.
2. **Integrate Clinical Data**: Incorporate clinical features such as **age of onset**, **BMI**, **family history**, and **C-peptide levels** along with genetic data.
3. **Advanced Analytical Methods**: Use **machine learning models** to integrate and analyze both genetic and clinical data for more accurate predictions.
4. **Consider Epigenetic and Environmental Factors**: Include research on **epigenetic modifications** and **environmental influences** to enhance diagnostic precision.

## Files in this Repository

- **`P3_snps.txt`**: SNP data for patient P3.
- **`t1d_cases.txt`**: GRS data for the case group (patients with Type 1 Diabetes).
- **`t1d_controls.txt`**: GRS data for the control group.
- **`t1d_weights_alleles.txt`**: Allele weight information used for GRS calculation.
- **`t1d_weights_haplotypes.txt`**: Haplotype weight information used for GRS calculation.
- **`individuals.vcf`**: Genotypic data in VCF format for the individuals under study.
