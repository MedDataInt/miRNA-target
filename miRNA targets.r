
### access the targets of mirna 
library(multiMiR)
db.ver = multimir_dbInfoVersions()
db.ver
curr_vers <- db.ver[1,'VERSION']
multimir_switchDBVersion(db_version = curr_vers)
db.tables = multimir_dbTables()
db.tables
multimir_dbSchema()
predicted_tables()
validated_tables()

library("edgeR")
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("edgeR")

target1 <- get_multimir(mirna = 'has-miR-23a-3p') 
names(target)
names(target1)
table(target1@data$type)
?get_multimir
str(target1)

aa <- get_multimir(url = NULL, org = "mmu", mirna = "mmu-miR-19a-3p", target = NULL,
             disease.drug = NULL, table = "validated", predicted.cutoff = NULL,
             predicted.cutoff.type = "p", predicted.site = "conserved",
             summary = FALSE, add.link = FALSE, use.tibble = FALSE, limit = NULL,
             legacy.out = FALSE)
str(aa)
miR19 <- aa@data
library(writexl)
write_xlsx(miR19,'miR19 Target. xlsx')