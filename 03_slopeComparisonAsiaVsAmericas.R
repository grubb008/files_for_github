library (lattice)
library (knitr)
library (plyr)

gCoef <- readRDS("gCoef.rds")
str(gCoef)

hDat <- droplevels(subset(gCoef,continent %in% c("Asia", "Americas")))
str(hDat)

dotplot (slope ~ continent, hDat)
t.test(slope ~continent, hDat)