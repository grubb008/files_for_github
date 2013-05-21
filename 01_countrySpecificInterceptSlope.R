gDat <- read.delim("gapminderDataFiveYear.txt")

str(gDat)

(minYear <- min(gDat$year))

jFun <- function(df) {
  jCoef <- coef(lm(lifeExp ~ I(year - minYear), df))
  
  names(jCoef) <- c("intercept", "slope")
  jCoef
}

gCoef <- ddply(gDat, .(country, continent), jFun)

head (gCoef)

gCoef  <- 
  droplevels(subset(gCoef,
                    continent != "Oceania"))


levels(gCoef$continent)

write.table (gCoef,
             "gCoef.txt", row.names=FALSE, quote=FALSE, sep="\t")

saveRDS(gCoef, "gCoef.rds")