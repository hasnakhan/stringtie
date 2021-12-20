library(IsoformSwitchAnalyzeR)
library(tidyverse)

stringtie <- importIsoformExpression(parentDir = "sp_all_out/", readLength = 76)

myDesign <- data.frame(sampleID =  c("D6K20d2", "D6K20d3",  "D6K20W1", "D6Krw1", "D6Krw3", "D6L20d1", "D6L20d2", "D6L20d3", "D6L20W1", "D6L20W2", "D6L20W3", "D6L40d1", "D6L40d2", "D6L40d3", "D6L40W1", "D6L40W2", "D6L40W3", "D6L60d1", "D6L60d2", "D6L60d3", "D6L60W1", "D6L60W2", "D6L60W3", "D6Lrw1", "D6Lrw2", "D6Lrw3", "D7K20d2", "D7K20d5", "D7K20W1", "D7K20W2", "D7K40d1", "D7K40d2", "D7K40W2", "D7K40W3", "D7K40W4", "D7K60d1", "D7K60d2", "D7K60d3", "D7K60W2", "D7K60W3", "D7K60W4",  "D7Krw2"), condition = rep(c("K20d", "K20w", "Krw", "L20d", "L20w", "L40d", "L40w", "L60d", "L60w", "Lrw", "K20d", "K20w", "K40d", "K40w", "K60d", "K60w", "Krw"), times = c(2, 1, 2, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 3, 3, 3, 1)))
myDesign$sampleID <- as.factor(myDesign$sampleID)
myDesign$condition <- as.factor(myDesign$condition)
aSwitchList <- importRdata(isoformCountMatrix = stringtie$counts, isoformRepExpression = stringtie$abundance, designMatrix = myDesign, isoformExonAnnoation = "sp_all_merged_stringtie.gtf")
aSwitchList <- preFilter(aSwitchList)
aSwitchList <- isoformSwitchTestDEXSeq(aSwitchList, reduceToSwitchingGenes = F)
aSwitchList <- analyzeAlternativeSplicing(aSwitchList)
write.table(aSwitchList$isoformFeatures, "sp_stringtie_isoform_features.tsv", col.names = T, row.names = F, sep = "\t", quote = F)

filter_by_conditions <- function (full_switch_list, cond1, cond2){
  sub_switch_list <- subsetSwitchAnalyzeRlist(full_switch_list, full_switch_list$isoformFeatures$condition_1 == cond1)
  sub_switch_list <- subset(
    extractTopSwitches(
      sub_switch_list,
      n = 10000000,
      inEachComparison = F,
    )[,c('gene_id','condition_1','condition_2','gene_switch_q_value','Rank')]
  )
  sub_switch_list <- sub_switch_list %>% filter(condition_2 == cond2)
  write.table(sub_switch_list, paste("sp_dAS_analysis/dAS_", cond1, cond2, "_stringtie.txt", sep = ""), col.names = T, row.names = F, sep = "\t", quote = F)
}

filter_by_conditions(aSwitchList, "K20d", "K20w")
filter_by_conditions(aSwitchList, "K20d", "L20d")
filter_by_conditions(aSwitchList, "K20w", "L20w")
filter_by_conditions(aSwitchList, "K40d", "K40w")
filter_by_conditions(aSwitchList, "K40d", "L40d")
filter_by_conditions(aSwitchList, "K40w", "L40w")
filter_by_conditions(aSwitchList, "K60d", "K60w")
filter_by_conditions(aSwitchList, "K60d", "L60d")
filter_by_conditions(aSwitchList, "K60w", "L60w")
filter_by_conditions(aSwitchList, "L20d", "L20w")
filter_by_conditions(aSwitchList, "L40d", "L40w")
filter_by_conditions(aSwitchList, "L60d", "L60w")