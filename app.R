#########
# DNAme #
#########

library(shiny)

# Define UI for application that draws a histogram
ui <- navbarPage(title = "DNAme",
         tabPanel(title = "Info",
                  titlePanel("What is DNAme?"),
                  navlistPanel(id = "info",
                               tabPanel("Why 'DNAme'?",
                                        h3("What does DNAme mean?"),
                                        p("The word 'DNAme' is just a contraction of 'DNA' and 'name', 
                                          but you could also thing of 'DNA' as a verb that converts 'me' to DNA."),
                                        p("You can pronounce it in several ways:"),
                                        tags$ul(tags$li("'D-N-name'"),
                                                tags$li("'D-N-A-me'"),
                                                tags$li("'D-name', although this one may be confusing, thus I don't recommend it."))),
                               tabPanel("Function",
                                        h3("What does DNAme do?"),
                                        p("DNAme is a shiny application to convert a name to a DNA sequence."),
                                        p("It is based on the one-letter code for the amino acids and, considereing
                                          each letter of the name as an aminoacid and
                                          doing the reverse process explained by the central dogma of biology,
                                          DNAme converts each letter to its coding, either in DNA or mRNA format,
                                          going from protein to RNA or DNA.")),
                               tabPanel("Goal",
                                        h3("Which is the goal of DNAme?"),
                                        p("DNAme goal can be different for each person that uses it:"),
                                        tags$ul(tags$li("Having fun changing one's name to DNA sequence."),
                                                tags$li("Using it to teach and learn about the central dogma of biology,
                                                        the genetic code and the codon usage in a funny and simple way.")),
                                        p("In order to fulfill these objectives, there is a theory section explaining things
                                          like the central dogma, the genetic codes, etc.
                                          Please have in mine that the teory shown in this section has the purpose of
                                          understand the process behind DNAme, don't use it for teaching purposes.")),
                               tabPanel("How to use DNAme?",
                                        h3("How to use DNAme?"),
                                        h4("Read the theory"),
                                        p("To use DNAme, it is important to read the biological theory behind it because:"),
                                        tags$ul(tags$li("It does not have sense to have your name in DNA/mRNA sequence format
                                                        without knowing how it has been converted"),
                                                tags$li("There are some DNAme features for which you need to know the theory or you
                                                        won't know how to use them.")),
                                        p("Go to the 'Theory' tab in the navigator bar to look at the theory."),
                                        br(),
                                        h4("DNA your name"),
                                        tags$ol(tags$li("To run the DNAme you have to go through the following steps:"),
                                                tags$li("Go to the 'DNA your name' tab in the navigator tab to run the app."),
                                                tags$li("Select the parameters:",
                                                        tags$ul(tags$li("Format: Selects the format in which the nucleotide sequence is written (DNA, the default, or mRNA.)"),
                                                                tags$li("Codon usage: Selects the codon usage of a determined species, such as Homo sapiens (default).")),
                                                tags$li("Write your name in CAPITAL LETTERS and without special characters."),
                                                tags$li("Click to 'Submit'."),
                                                tags$li("Wait.")))))),
         tabPanel(title = "Theory",
                  titlePanel("How to DNA your name?"),
                  navlistPanel(id = "theory",
                               tabPanel(title = "Central dogma",
                                        h3("The central dogma of biology"),
                                        p("The central dogma of biology is a statment that says how genetic information transforms into biological functions by going from DNA to RNA to proteins.
                                          The DNA (DesoxyriboNucleic Acid) contains the genes that have the information that determines (along with environmental -epigenetic- factors) who you are and how your body works, from how your organs were developed to the color of your eyes.
                                          This DNA serves as a template to be transcribed (process: TRANSCRIPTION) to mRNA (Messenger RiboNucleic Acid) by an enzyme called RNA polymerase which, in turn, will go to a cellular complexes called ribosomes where it is translated (process: TRANSLATION) to protein with the help of tRNA (Transference RNA), 
                                          another RNA that transports the aminoacids -the 'bricks' of a protein.-"),
                                        img(src="central-dogma.png", align = "c", width = "500px"),
                                        helpText("Central dogma of biology. In red, the 'normal' processes: DNA replication (DNA to DNA), transcription (DNA to RNA) and translation (RNA to protein).
                                                 In blue, the special cases: retrotranscription (RNA to DNA) and RNA replication (RNA to RNA).",
                                                 style="font-size:12px"),
                                        br(),
                                        h4("Exceptions in the central dogma of biology"),
                                        p("The central dogma of biology usually have one direction (DNA to RNA to proteins). However, there are some exceptions, 
                                          because RNA sometimes can be retrotranscribed to DNA using an enzimecalled retrotranscriptase or reverse transcriptase as, 
                                          for example, in retrovirus like HIV or in the germinal cells, which contain the telomerase.
                                          Furthermore, some RNA viruses do not have DNA phase and can directly replicate RNA.")),

                               tabPanel(title = "Codons and the genetic code",
                                        h3("What are codons?"),
                                        p("Codons are 'triplets' of nucleotides (the bricks of RNA and DNA) that are the components of a gene -and the mRNA transcribed from it-.
                                          Each codon encodes for a different aminoacid and is complementary to another 'triplet' found in the tRNA that carries the correct aminoacid: the anticodon.
                                          This means that, when the mRNA goes to the ribosome, the ribosome 'reads' the mRNA codon by codon and, for each codon, a tRNA with a complementary
                                          anticodon will bind to the complex ribosome-mRNA and the aminoacid carried by the tRNA will be added to the aminoacid chain that will be the protein."),
                                        br(),
                                        h3("The genetic code"),
                                        p("The genetic code is the 'dictionary' that tells which aminoacid is obtained from each codon -either in RNA or DNA format-."),
                                        p("The genetic code is:"),
                                        tags$ul(tags$li("(almost) universal: this means that the genetic code is the same for (almost) all the organisms."),
                                                tags$li("Unambiguous: each codon codes for just one aminoacid, the start signal (which is also a methionine) or the stop signal."),
                                                tags$li("Degenerated: several codons are redundant, implying that different codons may code for the same aminoacid, like lysine, 
                                                        coded by AAA and AAG. This is the reason why, despite having 64 differnt codons, 
                                                        only 22 different protein-making aminoacids are encoded by these codons.")),
                                        img(src="genetic_code_wheel_yourgenome.png", align="center", width="500px"),
                                        helpText("Genetic code in DNA format, to write the codons in mRNA format, change the U for a T.
                                                 Inside out: the first base of the codon, the second base of the codon, the third base of the codon, 
                                                 the one-letter code for the aminoacid. Source: yourgenome.org.", 
                                                 style="font-size:12px")),
                               
                               tabPanel(title = "Codon usage",
                                        h3("What is the codon usage"),
                                        p("As we stated in 'The genetic code' section, the genetic code is degenerated/redundant, implying that although there are 64 possible codons,
                                          several of them encode for the same aminoacid and not all codons encoding for one aminoacid are found in the same proportion.
                                          Instead, some codons are found to be more frequent than others and the frequencies vary from one organism to another."),
                                        img(src="human_codon_usage.png", width="500px"),
                                        helpText("This table shows the codon usage (codon frequency) of Homo sapiens (human). Source: https://www.genscript.com/tools/codon-frequency-table.",
                                                 style="font-size:12px")),
                               
                               tabPanel(title = "How to DNA your name?",
                                        h3("How to DNA your name"),
                                        h4("Aminoacid abbreviations"),
                                        p("As we have seen, each aminoacid is coded by one or different codons. We use that codons to write the DNA/mRNA sequence that encodes for a protein,
                                          but to the sequence of a protein we use the aminoacids."),
                                        p("Nevertheless, writing all the aminoacids of a protein by their full name would be extremely
                                          confusing and ineficient. For this reason, aminoacids have two types of abbreviations: the three-letter code and the one-letter code."),
                                        tags$ul(tags$li("The three-letter code is a unique code of three letters for each aminoacid,
                                                        where the first letter is always a capital case and the following two are always lower case.
                                                        For example, lysisin is Lys or alanine is Ala."),
                                                tags$li("The one-letter code denotes a capital letter for each aminoacid. This code is the one we are interested in because, 
                                                        by considering each letter of our name as one aminoacid, we will be able to do the inverse process and go from protein to DNA.")),
                                        p("However, there is a problem. Since there are only 22 protein-making aminoacids, 
                                          there are only 20 different one-letter codes and thus, not all names can be transformed to DNA. I propose two solutions:"),
                                        tags$ul(tags$li("Playing with phonetics. For example, if your name includes an X, you can change it by a K (lysisne) and an S (serine)"),
                                                tags$li("Instead of writing your name, you can use your surname, a nickname or your initials."))))),
         tabPanel(title = "DNA your name",
                  titlePanel(title = "DNA your name"),
                  sidebarLayout(
                      sidebarPanel(
                          selectInput(inputId = "format",
                                      label = "Select the sequence format:", 
                                      choices = c("DNA", "mRNA"),
                                      selected = "DNA"),
                          br(),
                          selectInput(inputId = "codon_usage",
                                      label = "Select an organism",
                                      choices = c("Homo sapiens (Human)"),
                                      selected = "Homo sapiens (Human)"),
                          
                          br(),
                          textInput(inputId = "name2dna",
                                    label = "Write your name in UPPER case:", 
                                    value = "DNAME")
                      ),
                      
                      mainPanel()
                  ))
)

# Define server logic required to draw a histogram
server <- function(input, output) {}

# Run the application 
shinyApp(ui = ui, server = server)
