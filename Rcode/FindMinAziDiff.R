#FindMinAziDiff: Find the co-site minimum Azimuth difference Cell 
#input: index=index for row number
#       siteview: siteview 
#Output: the minimum Azimuth difference Cell information
#       [1]"Neigh.Freq"        "Neigh.SITEID"      "Neigh.Region"     
#       [4] "Neigh.eNodeB_id"   "Neigh.LCI"         "Neigh.Azimuth"    
#       [7] "Neigh.AntennaType" "Neigh.HBW"         "Neigh.AziDiff"
######################################################################
FindMinAziDiff = function(index, siteview){
  print(index)
  sourcecell <- siteview[index,]
  tempsv <- siteview[Freq == sourcecell$Freq & SITEID == sourcecell$SITEID,]
  tempsv$AziDiff <- ifelse(((tempsv$Azimuth - sourcecell$Azimuth) %% 360) > 180,
                           360 - ((tempsv$Azimuth - sourcecell$Azimuth) %% 360),
                           ((tempsv$Azimuth - sourcecell$Azimuth) %% 360))
  colnames(tempsv) <- paste("Neigh", names(tempsv), sep = ".")
  tempsv[order(tempsv$Neigh.AziDiff), ][2]
}