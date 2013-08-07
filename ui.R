require(shiny)

### Define UI for my applications
shinyUI(pageWithSidebar(

### Application title
    headerPanel("Mali 2013 : Premier tour"),

### using Side bar
    sidebarPanel(
        selectInput("echelle", "Echelle : ",
                choices = c("Region", "Cercle")),
        helpText("Simple visualisation des résultats provisoires du premier tour",
                 "des  élections présidentielle du 28 juillet au Mali.",
                  HTML("<br></br>"),
                 "Ces résultats sont disponibles par région et par cercle.",
                 HTML("<br></br> Source : <a href = \"http://www.matcl.gov.ml/\">Ministère de l’administration territoriale, de la décentralisation de l'aménagement du territoire</a>"),

                 HTML('<br></br><a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.en_US"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Mali 2013 : premier tour</span> by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Ahmadou H. Dicko</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.en_US">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.'),
                  HTML('<br></br><img src="jokkolabs_logo.png" alt="File Type">'),
                 HTML("<br></br>Code source disponible sur <a href = \"https://github.com/dickoa/MaliPremierTour\">Github</a>")
                 )
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


