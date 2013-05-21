library (lattice)
library (knitr)
library (plyr)

gCoef <- readRDS("gCoef.rds")
str(gCoef)

hDat <- droplevels(subset(gCoef,continent %in% c("Asia", "Americas")))
str(hDat)


pdf ("slopes_AsiaVsAmericas.pdf")
t.test(slope ~ continent, hDat)
dotplot (slope ~ continent, hDat)
dev.off()


#old school way of outputting - i.e. knitr free
sink("slopes_AsiaVsAmericas.txt")
t.test(slope ~continent, hDat)
sink()