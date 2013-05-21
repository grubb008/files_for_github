library (lattice)
library (knitr)
library (plyr)

gCoef <- readRDS("gCoef.rds")
str(gCoef)

hDat <- droplevels(subset(gCoef,continent %in% c("Asia", "Americas")))
str(hDat)


##pdf ("slopes_AsiaVsAmericas.pdf")
# t.test(slope ~ continent, hDat)
# dotplot (slope ~ continent, hDat)
# dev.off()

# this is the way the script should be for compiling to the notebook
#old school way of outputting - i.e. knitr free
#sink("slopes_AsiaVsAmericas.txt")
dotplot (slope ~ continent, hDat)
t.test(slope ~continent, hDat)
#sink()