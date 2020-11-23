#########
# DNAme #
#########

run_app <- function(options = list()) {
  shinyApp(ui = app_ui,
           server = app_server,
           options = options) 
  
}