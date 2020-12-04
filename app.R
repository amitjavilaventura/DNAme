##############
# DNAme lite #
##############

### Load required packages, functions... ----------------------------------------------

# load packages
library(shiny)
#library(shinythemes)
library(shinydashboard)

# custom functions
source("src/functions.R")
#source("src/ui_functions.R")

# codon usage tables
source("src/tables.R")

# load ui and server files
source("src/ui.R")
source("src/server.R")

# Run the application -------------------------
shinyApp(ui = ui, server = server)