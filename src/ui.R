############################
### DNAme USER INTERFACE ###
############################


ui <- dashboardPage(header = dashboardHeader(title = "DNAme"), 
                    skin = "blue", 
                    title = "DNAme", 
                    sidebar = dashboardSidebar(
                      sidebarMenu(
                        br(),
                        menuItem(text = "About", tabName = "About", icon = icon("home", lib = "font-awesome")),
                        #menuItem(text = "Theory", tabName = "Theory", icon = icon("book", lib = "font-awesome")),
                        menuItem(text = "DNAme", tabName = "DNAme", icon = icon("dna", lib = "font-awesome")),
                        hr(),
                        menuItem(text = "Code", href = "https://github.com/amitjavilaventura/DNAme", newtab = T, icon = icon("code", lib = "font-awesome"), badgeColor = "light-blue")
                      )
                    ),
                    
                    body = dashboardBody(
                      tabItems(
                        tabItem("About", 
                                tabsetPanel(id = "info",
                                            tabPanel("Welcome",
                                                     br(),
                                                     HTML('<center><p style="font-size:60px;font-family:Helvetica;color:black;"><u>Welcome to DNAme!</u></p></center>'),
                                                     HTML('<center><img src="DNAme_logo.png" width="600px"></center>')),
                                            tabPanel("General information",
                                                     img(src="DNAme_logo.png", width="400px", align="right"),
                                                     h3("What is DNAme?"),
                                                     p("DNAme is a shiny applicatiosn that converts a name to a DNA sequence."),
                                                     p("DNAme considers a name as a protein and each of the letters as an aminoacid in one-letter code.
                                         Then, it takes each aminoacid and searches for the codons that codify for it, either in the mRNA or the DNA."),
                                                     
                                                     br(),
                                                     
                                                     h3("What does DNAme mean?"),
                                                     p("The word 'DNAme' is just a contraction of 'DNA' and 'name', 
                                          but you could also thing of 'DNA' as a verb that converts 'me' to DNA."),
                                                     p("You can pronounce it in several ways:"),
                                                     tags$ul(tags$li("'D-N-name'"),
                                                             tags$li("'D-N-A-me'"),
                                                             tags$li("(in Spanish) 'deneame'.")),
                                                     
                                                     br(),
                                                     
                                                     h3("How does DNAme work?"),
                                                     p("DNAme considers the query name as a protein."),
                                                     p("Proteins are made of aminoacid and each aminoacid has a name, a three-letter code and a one-letter code."),
                                                     p("Aminoacids are coded in the DNA by triplets of bases named codons."),
                                                     p("DNAme uses the most frequent codon for each aminoacid in the selected organism to convert your name to DNA or mRNA."),
                                                     
                                                     br(),
                                                     
                                                     h3("Contributor"),
                                                     tags$p("DNAme is a funny app deveolped by:",
                                                            tags$ul(tags$li(tags$a(href = "https://amitjavilaventura.github.io","Adrià Mitjavila Ventura", target="_blank")),
                                                                    tags$li(tags$a(href = "https://biobit.netlify.app", "BioBit", target="_blank"))))),
                                            
                                            tabPanel("Instructions",
                                                     img(src="DNAme_logo.png", width="400px", align="right"),
                                                     h3("How to use DNAme?"),
                                                     h4("Know the theory"),
                                                     p("To use DNAme, it is important to know the biological theory behind it because:"),
                                                     tags$ul(tags$li("It does not have sense to have your name in DNA/mRNA sequence format
                                                        without knowing how it has been converted"),
                                                             tags$li("There are some DNAme features for which you need to know the theory or you
                                                        won't know how to use them."),
                                                             tags$li("The main goal of DNAme is learning in a funny way.")),
                                                     p("If you want to read some theory, you can go to Wikipedia and read about:"),
                                                     tags$ul(tags$li(tags$a(href = "https://en.wikipedia.org/wiki/DNA", "DNA", target="_blank")),
                                                             tags$li(tags$a(href = "https://en.wikipedia.org/wiki/Central_dogma_of_molecular_biology","Central dogma of Biology", target="_blank")),
                                                             tags$li(tags$a(href = "https://en.wikipedia.org/wiki/Genetic_code", "Codons and genetic code", target="_blank")),
                                                             tags$li(tags$a(href = "https://en.wikipedia.org/wiki/Codon_usage_bias", "Codon usage", target="_blank")),
                                                             tags$li(tags$a(href = "https://en.wikipedia.org/wiki/Proteinogenic_amino_acid", "Aminoacids", target="_blank"))),
                                                     br(),
                                                     h4("DNA your name"),
                                                     p("To run the DNAme you have to go through the following steps:"),
                                                     tags$ol(tags$li("Go to the 'DNAme' tab in the left panel."),
                                                             tags$li("Select the parameters:",
                                                                     tags$ul(tags$li("Nucleic acid: the nucleic acid to write the coding sequence/DNA name (DNA or mRNA)."),
                                                                             tags$li("Organism: use the most frequent codons of the selected organism to write the DNA name (Human, Mouse, C. elegans, A. thaliana)."),
                                                                             #tags$li("Extra letters: use extra letters (i.e. X), allowing the usage of these letters which will result in strange codons (i.e. NNN)."),
                                                                             tags$li("Separator: character used to separate the codons corresponding to each letter of the query name (i.e. dash, blankspace, nothing),")),
                                                                     tags$li("Write your name without special characters."),
                                                                     tags$li("Click to 'DNAme'."))),
                                                     br(),
                                                     h4("Look at the source code (optional)"),
                                                     p("The source files of DNAme can be visualized going to the 'Code' tab in the left-side panel."),
                                                     br(),
                                                     h4("Other organisms (optional)"),
                                                     p("Look at the codon usage of several organisms using", 
                                                       tags$a(href = "https://www.genscript.com/tools/codon-frequency-table","this tool.", target="_blank")),
                                                     p("For each aminoacid, take the most frequent codon within the desired organism, 
                                                       modify the user interface ('src/ui.R'), the server function ('src/server.R') 
                                                       and the codon usage tables ('src/tables.R') to enable DNAme to use the most frequent codons of the desired organism.")))),
                        
                        
                        tabItem("DNAme",
                                h3("DNA your name!"),
                                splitLayout(cellWidths = c("70%", "30%"),
                                            box(title = "Parameters", id = "pars", width = 12, height = "200px",
                                                splitLayout(
                                                  tags$head(tags$style(HTML(".shiny-split-layout > div {overflow: visible;}"))),
                                                  cellWidths = c("0%","33%", "33%", "33%"),
                                                  selectInput(inputId = "nucleicacid", label = "Select the nucleic acid:", choices = c("DNA", "mRNA"), selected = "DNA", selectize = T),
                                                  selectInput(inputId = "codon_usage", label = "Select an organism:", selected = "Human", choices = list("Human" = "Human", "Mouse" = "Mouse","C. elegans" = "Celegans", "A. thaliana" = "Athaliana")),
                                                  textInput(inputId = "separator", label = "Write a separator:", value = "-")
                                                  #selectInput(inputId = "extra_letters", label = "Allow extra letters? (not yet)", choices = c("X"), multiple = T))
                                                ),
                                                splitLayout( cellArgs = list(style='white-space: normal;'),
                                                             p("This is the nucleic acid that will be used to convert the entered name. The only difference is that where DNA has a T, mRNA has a U.", style = "font-size:12px; color:gray"),
                                                             p("The organism selected will be used to retrieve the most frequent codon for each aminoacid in that organism.", style = "font-size:12px; color:gray"),
                                                             p("The character used to separate the codons. Default is a dash ('-'), but it can be a blank space or even nothing.", style = "font-size:12px; color:gray")
                                                )),
                                            
                                            box(title = "DNA your name", width = 12,  height = "200px", background = "light-blue",
                                                textInput(inputId = "name", label = "Write your name", value = "DNAme"),
                                                actionButton(inputId = "submit", label = "DNAme"))),
                                
                                img(src="DNAme_logo.png", width="200px", align="right"),
                                conditionalPanel( condition = "input.submit > 0",
                                                  h4("This is your DNA name!"),
                                                  tags$div(HTML(paste(tags$span(style="color:blue", textOutput(outputId = "name"))))), 
                                                  tags$div(HTML(paste(tags$span(style="color:red; font-face:bold; font-size:30px", textOutput("text_output"))))),
                                                  br(),br(),br(),br(),
                                                  h4("Information"),
                                                  helpText("This is all the information in the letters of your name."),
                                                  tableOutput(outputId = "table_output"))
                                
                        ))))