install.packages("GEOquery")

# get GEO data first using GEOquery library
# GEO (gene expression Omnibus) is a database repository of high throughput gene expression data
# and other data (such as chips, microarray, etc).
# GEOQuery library provides an interface for query and fetch data from GEO

geo_id <- "GSE120741"
library(GEOquery)
geo <- getGEO(geo_id)

# save the gene expression data into a file,
# the row name is the file name for the results
ge_file <- getGEOSuppFiles(geo_id)
ge_file_name <- row.names(ge_file)

# read gene expression data, 
# each column is a sample and each row is a gene
ge <- read.table(ge_file_name, header=T, sep="\t", skip=1)

# clean data: remove genes with same name
ge1 <- ge[!duplicated(ge[,1]),]
# clean data: remove first column, which is the gene name
exp <- ge1[,-1]
rownames(exp) <- ge1[,1]

# classify the samples into 3 group by ERG gene expression value:
#    lower 33.3 percentile will be low 
#    middle 33.3 percentile will be mid
#    and upper 33.3 percentile will be high

# erg gene expression
erg <- as.numeric(exp["ERG",])
groups <- rep("mid", ncol(exp))
groups[rank(erg) %in% c(1:30)] <- "low"
groups[rank(erg) %in% c(63:92)] <- "high"

# plot the gene data according to the Prostate cancer classification in Figure 1 of the paper
# using the AR (androgen receptor) target genes


# read the genes related to the classification in Figure 1 of the paper first
# read each line as a single record
gene_set <- read.table("../Downloads/geneset_c8.gmt", sep="\n", stringsAsFactors = FALSE)
# split the lines into a list and each list is a type of prostate cancer
gene_set <- strsplit(gene_set$V1, split = "\t")
# rename each list to the correct name
names(gene_set) <- unlist(lapply(gene_set, "[[", 1))
# remove first 2 element of each list as they are not genes
gene_set <- lapply(gene_set, "[", c(-1, -2))

# covert the list to a data frame 
gene_set <- data.frame(gene = unlist(gene_set), sets = rep(names(gene_set), lengths(gene_set)),
                       stringsAsFactors = FALSE)

# the color of each cluster is set as Figure 1
gene_set$color <- substr(gene_set$sets, 3, nchar(gene_set$sets))
gene_set$sets <- substr(gene_set$sets, 1, 2)

# set the order the same as Figure one by color and class
gene_set <- gene_set[nrow(gene_set):1, ]

# select the genes in the gene_set only
exp1 <- as.matrix(exp[as.character(gene_set$gene),])

# using gplots library for heatmap generation
library(gplots)
heatmap.2(exp1, Rowv = FALSE, dendrogram = "column", trace = "none", density.info="none", 
          RowSideColors = gene_set$color, col = bluered, scale = "row", labRow = FALSE)


