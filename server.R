require(shiny)

shinyServer(function(input, output) {

    listofdata <- reactive({
        switch(input$echelle,
               "Region" = list(mapdata = data, bardata = tmp,
               tables = election_reg, names = region_names, map = mali_mapdf, angle = 0, size = 9.5),
               "Cercle" = list(mapdata = data2, bardata = tmp2,
               tables = election, names =  cercle_names, map = mali_mapdf2, angle = 90, size = 8))
    })


    output$map <- renderPlot({
        within(listofdata(), {
             p1 <<- ggplot(mapdata, aes(map_id = Id)) +
             geom_map(aes(fill = leader), map = map,
                      colour = "black", size = 0.2) +
             geom_text(data = names, aes(long, lat, label = id,
                       angle = angle, map_id =NULL), size = 2.25) +
             expand_limits(x = map$long, y = map$lat) +
             theme_few() +
             coord_equal() +
             theme(legend.position = "top",
                   legend.direction = "horizontal",
                   axis.ticks = element_blank(),
                   axis.title = element_blank(),
                   axis.text =  element_blank()) +
             scale_fill_brewer("", type = "qual", palette = 2) +
             guides(fill = guide_legend(ncol = 1))
             p2 <<- ggplot(bardata, aes(x = Id, y = percw, fill = candidats)) +
             geom_bar(stat = "identity", colour = "black", size = 0.25) +
             ylab("%") +
             theme_few() +
                 theme(legend.position = "top",
                       legend.direction = "horizontal",
                       axis.ticks = element_blank(),
                       axis.title.x = element_blank(),
                       axis.text =  element_text(size = size, angle = angle)) +
             scale_fill_brewer("", type = "qual", palette = 2) +
             guides(fill = guide_legend(ncol = 1))})

        legend <- g_legend(p1)
        ## grid.newpage()
        ## pushViewport(viewport(layout = grid.layout(2, 3)))
        ## print(p2 + theme(legend.position="none"), vp = vplayout(2, 3))
        ## print(p1 + theme(legend.position="none"), vp = vplayout(2, 1:2))
        ## print(arrangeGrob(legend), vp = vplayout(1, 1:3))
        grid.arrange(p2 + theme(legend.position = "none"), ncol = 3,
                     p1 + theme(legend.position = "none"),
                     arrangeGrob(legend),
                     widths = c(6.5, 7.5, 2.25))
    })


  output$tables <- renderGvis({
    df <- with(listofdata(), tables)
    oldnames <- names(df)
    df <- cbind(df[,1], numcolwise(round)(df, 2))
    names(df) <- oldnames
    table <- gvisTable(df, options = list(width = 800, height = 500))
    return(table)
  })
    ## output$data <- renderTable({
    ##     with(listofdata(), tables)
    ## })

})

