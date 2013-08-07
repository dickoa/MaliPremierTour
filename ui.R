require(shiny)

### Define UI for my applications
shinyUI(pageWithSidebar(

### Application title
    headerPanel("Mali 2013 : Premier tour"),

### using Side bar
    sidebarPanel(
        selectInput("echelle", "Echelle : ",
                choices = c("Region", "Cercle")),
        helpText("\nSimple visualisation des résultats provisoires du premier tour",
                 "des  élections présidentielle du 28 juillet au Mali.\n",
                 "Ces résultats sont disponibles par région et par cercle.",
                 HTML("<br></br> Source : <a href = \"http://www.matcl.gov.ml/\">Ministère de l’administration territoriale, de la décentralisation de l'aménagement du territoire</a>"),
                 HTML("<br></br>Code source disponible sur <a href = \"https://github.com/dickoa/OpenDataApp\">Github</a>"))
        ),
    mainPanel(
      tabsetPanel(
          tabPanel("Graphs", plotOutput("map")),
          tabPanel("Données", h4("Résultats (en %)"), htmlOutput("tables"))
         ## tabPanel("Données", tableOutput("data"))
          )
        )
    )
        )


