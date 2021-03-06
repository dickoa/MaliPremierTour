require(shiny)
require(gridExtra)
require(ggplot2)
require(ggthemes)
require(googleVis)
require(plyr)

load("mali_elec.RData")
vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)

g_legend<-function(a.gplot){
tmp <- ggplot_gtable(ggplot_build(a.gplot))
leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
legend <- tmp$grobs[[leg]]
return(legend)}
