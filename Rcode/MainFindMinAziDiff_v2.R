t1 = Sys.time()
library(data.table)
library(dplyr)
source("E:\\Sam\\Knowledge_sets\\PersonalStudy\\SectorAzimuthCheck\\FindMinAziDiff.R")
sv <- fread("E:\\Sam\\Knowledge_sets\\PersonalStudy\\SectorAzimuthCheck\\Filtered.csv")
sv <- sv[HBW < 360,]

tresult <- lapply(1:nrow(sv), 
                  function(x) FindMinAziDiff(x, sv)) %>% rbindlist()

result <- cbind(sv, tresult)

fwrite(result, "E:\\Sam\\Knowledge_sets\\PersonalStudy\\SectorAzimuthCheck\\result2.csv", row.names = F)

Sys.time() - t1

