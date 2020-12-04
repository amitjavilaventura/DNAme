#############################
### DNAme SERVER FUNCTION ###
#############################

# SERVER FUNCTION ----------------------------------------------------------------
server <- function(input, output) {
  observeEvent(input$submit, {
    output$name <- 
      renderText({
        paste(isolate({input$name}), ", this is your DNA name (from 5' to 3'):", sep = "")
      })
    
    output$text_output <-
      renderText({
        if(isolate({input$nucleicacid}) == "DNA"){ table = dna_codon_aa }
        else if(isolate({input$nucleicacid}) == "mRNA"){ table = rna_codon_aa }
        
        DNAme <- name2dna(input = isolate({input$name}), table = table, codon_usage = isolate({input$codon_usage}), sep = isolate({input$separator}))
        if(is.list(DNAme)){ paste(DNAme$name) }
        else{ paste(DNAme) }
      })
    
    output$table_output <- 
      renderTable({
        if(isolate({input$nucleicacid}) == "DNA"){ table = dna_codon_aa }
        else if(isolate({input$nucleicacid}) == "mRNA"){ table = rna_codon_aa }
        
        DNAme <- name2dna(input = isolate({input$name}), table = table, codon_usage = isolate({input$codon_usage}), sep = isolate({input$separator}))
        if(is.list(DNAme)){ DNAme$df }
        else{ paste(DNAme) }
      })
  })
}