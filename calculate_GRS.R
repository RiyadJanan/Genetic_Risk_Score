# Load necessary libraries
library(data.table)
library(ggplot2)

# Load data
snp_data <- fread("vcf_data.txt", header = TRUE)
allele_weights <- fread("t1d_weights_alleles.txt")
haplotype_weights <- fread("t1d_weights_haplotypes.txt")

# Merge data frames on the SNP ID
effect_alleles_and_genos <- merge(allele_weights, snp_data, by.x = "rsnumber", by.y = "ID")

# Get the list of individuals (P1, P2, P3, P4)
individuals <- colnames(effect_alleles_and_genos)[which(colnames(effect_alleles_and_genos) != "rsnumber" & colnames(effect_alleles_and_genos) != "weighted_allele" & colnames(effect_alleles_and_genos) != "weight" & colnames(effect_alleles_and_genos) != "ALT")]

# Check for NA values and remove if necessary
effect_alleles_and_genos <- na.omit(effect_alleles_and_genos)

# Flip alleles where ALT != weighted_allele
for (snpIndex in 1:nrow(effect_alleles_and_genos)) {
  if (!is.na(effect_alleles_and_genos$ALT[snpIndex]) & !is.na(effect_alleles_and_genos$weighted_allele[snpIndex])) {
    if (effect_alleles_and_genos$ALT[snpIndex] != effect_alleles_and_genos$weighted_allele[snpIndex]) {
      for (ind in individuals) {
        effect_alleles_and_genos[[ind]][snpIndex] <- 2 - effect_alleles_and_genos[[ind]][snpIndex]
      }
    }
  }
}

# Calculate weighted genotypes
weighted_g <- effect_alleles_and_genos
weighted_g[, (individuals) := lapply(.SD, function(x) x * weighted_g$weight), .SDcols = individuals]

# Sum weighted genotypes for each individual to get WAS
was <- numeric(length(individuals))
for (i in 1:length(individuals)) {
  individual <- individuals[i]
  was[i] <- sum(weighted_g[[individual]], na.rm = TRUE)
}

# Create a data frame for GRS
grs_df <- data.frame(individuals, was)

# Standardize the GRS
controls <- fread("t1d_controls.txt")
cases <- fread("t1d_cases.txt")
control_mean <- mean(controls$t1d_grs, na.rm = TRUE)
control_sd <- sd(controls$t1d_grs, na.rm = TRUE)
grs_df$standardized_grs <- (grs_df$was - control_mean) / control_sd

# Combine data for visualization
control_data <- data.frame(GRS = controls$t1d_grs, Group = "Control")
case_data <- data.frame(GRS = cases$t1d_grs, Group = "Case")
p3_data <- data.frame(GRS = grs_df[grs_df$individuals == "P3", "standardized_grs"], Group = "P3")

# Combine all data
all_data <- rbind(control_data, case_data, p3_data)

# Plot the data
ggplot(all_data, aes(x = Group, y = GRS, color = Group)) +
  geom_jitter(width = 0.2, size = 1.5, alpha = 0.6) +
  geom_point(data = p3_data, aes(x = Group, y = GRS), color = "red", size = 4) +
  labs(title = "Comparison of GRS Between Control, Case, and P3", x = "Group", y = "Genetic Risk Score (Standardized)") +
  theme_minimal() +
  theme(legend.position = "none")
