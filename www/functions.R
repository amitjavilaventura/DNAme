#######################
### DNAme functions ###
#######################

# ----- Convert Name to DNA ----- #
name2dna <- function(input="DNAme", table = dna_codon_aa, codon_usage = "Human", sep = "-"){
  
  library(stringr)
  library(dplyr)
  library(magrittr)
  
  name <- str_to_upper(input) %>% str_split(pattern = "") %>% unlist()

  dna_name <- c()
  for(i in name){
    dna_name <- rbind(dna_name, table[which(table$one_letter %in% i),])
  }
  
  DNAme <- list()
  DNAme$df <- dna_name %>% 
    set_colnames(c("Aminoacid (1-letter code)", "Aminoacid (3-letter code)", "Amino acid", "Most frequent codon (Human)", "Most frequent codon (Mouse)"))
  
  DNAme$name <- paste((dna_name %>% select(codon_usage))[1:length(name),1], collapse = sep)
  
  return(DNAme)
}

