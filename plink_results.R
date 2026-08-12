library(tidyverse)
library(writexl)
library(qqman)

dir_in <- "~/work/gwasRequests/test/results_unformatted/"
dir_out <- "~/work/gwasRequests/test/results_formatted/"
phenonames <- c("trait1", "trait2")

sig_df <- data.frame(pheno = phenonames, num_SNP_tested = NA_integer_, num_SNP_GWS = NA_integer_,
                     stringsAsFactors = F)


for(i in seq_along(phenonames)) {
  myfiles <- list.files(path = dir_in, pattern = paste0(phenonames[i], ".glm.linear"), full.names = TRUE)
  file_list <- map(myfiles, read_delim, delim = "\t", show_col_types = FALSE, progress = FALSE)
  dat <- bind_rows(file_list)
  dat <- dat %>%
    filter(!is.na(P)) %>%
    filter(A1_FREQ >= 0.01 & A1_FREQ <= 0.99)
  names(dat)[1] <- "CHROM"
  names(dat)[names(dat) == "ID"] <- "SNP"
  
  write_delim(dat, file = paste0(dir_out, phenonames[i], ".txt"), delim = "\t")
  
  png(filename = paste0(dir_out, phenonames[i], "_qq.png"))
  qq(dat$P)
  dev.off()
  
  png(filename = paste0(dir_out, phenonames[i], "_manhattan.png"))
  manhattan(dat, chr = "CHROM", bp = "POS", snp = "SNP")
  dev.off()
  
  sig_df[i,"pheno"] <- phenonames[i]
  sig_df[i,"num_SNP_tested"]<- length(dat$P)
  sig_df[i,"num_SNP_GWS"] <- sum(dat$P<= 5e-8)
}

write_xlsx(sig_df, path = paste0(dir_out, "GWS_results.xlsx"))

#Create SNPLOC file for MAGMA
dir_out <- "~/work/OAI/gwas_results_formatted/"
dat <- read_delim(paste0(dir_out, "bs_fem_pc1.txt"), delim = "\t")
dat %>%
  dplyr::select(SNP, CHROM, POS) %>%
  write_delim("~/work/OAI/magma/data/snp_loc.txt", delim = "\t")


dir_in <- "~/work/OAI/magma/results/"
dat <- read_table(paste0(dir_in, "bs_pat_pc1.genes.out"))
dat %>%
  filter(GENE == "6662") 

