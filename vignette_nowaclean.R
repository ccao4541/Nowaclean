# 3 Loading and Preprocessing

setwd("/home/kam025/Nowaclean")
library(nowaclean)
library(lumi)
datapath <- "/project/data1/tice/raw-gene-expression-data/Lung-cancer-dataset.RData"
load(datapath)
class(lobj)
dim(lobj)
data <- lobj
labInfo <- overview.data
rownames(labInfo) <- labInfo[,"Sample_ID"]
negCtrl <- negativeCtrls

# 3.1 Remove blood type probes

histo_boolean <- !rownames(data) %in% blood_probes()
length(which(histo_boolean==FALSE))
data <- data[histo_boolean, ]
dim(data)
dim(lobj)
expression <- t(exprs(data))
dim(expression)

# 3.2 Load background variables

