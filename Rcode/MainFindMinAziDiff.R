t1 = Sys.time()
library(data.table)
library(dplyr)
source("E:\\Sam\\Knowledge_sets\\PersonalStudy\\SectorAzimuthCheck\\FindMinAziDiff.R")
sv <- fread("E:\\Sam\\Knowledge_sets\\PersonalStudy\\SectorAzimuthCheck\\Filtered.csv")
sv <- sv[HBW < 360,]

tresult <- sapply(1:nrow(sv), function(x) FindMinAziDiff(x, sv))
#result <- sapply(1:5, function(x) FindMinAziDiff(x, sv))
tresult <- as.data.frame(matrix(unlist(tresult), byrow = T, ncol = 9), 
                        stringsAsFactors = F)
colnames(tresult) <- c("Neigh.Freq", "Neigh.SITEID", "Neigh.Region",     
                      "Neigh.eNodeB_id",  "Neigh.LCI", "Neigh.Azimuth",    
                      "Neigh.AntennaType", "Neigh.HBW", "Neigh.AziDiff")
result <- cbind(sv, tresult)
write.csv(result, "E:\\Sam\\Knowledge_sets\\PersonalStudy\\SectorAzimuthCheck\\result.csv", row.names = F)

Sys.time() - t1
