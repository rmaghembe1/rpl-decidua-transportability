suppressPackageStartupMessages({
  library(data.table)
})

message("[audit] Auditing GSE178535 GEO file availability")

acc <- "GSE178535"
base_url <- "https://ftp.ncbi.nlm.nih.gov/geo/series/GSE178nnn/GSE178535/suppl/"
out_dir <- file.path("data/raw/second_bulk_candidates", acc)
qc_dir <- "results/qc/second_bulk_candidates"

dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
dir.create(qc_dir, recursive = TRUE, showWarnings = FALSE)

index_file <- file.path(out_dir, "GSE178535_supplementary_index.html")

cmd <- sprintf("wget -O %s %s", shQuote(index_file), shQuote(base_url))
status <- system(cmd)

if (status != 0) {
  stop("[audit] Failed to download supplementary index from: ", base_url)
}

txt <- paste(readLines(index_file, warn = FALSE), collapse = "\n")

links <- unlist(regmatches(txt, gregexpr('href="[^"]+"', txt)))
links <- gsub('^href="|"$', "", links)
links <- links[!grepl("^/|^\\?", links)]
links <- unique(links)

files <- data.table(
  accession = acc,
  base_url = base_url,
  file_name = links,
  file_url = paste0(base_url, links)
)

files <- files[
  grepl("\\.(txt|tsv|csv|gz|xlsx|xls|soft|tar|zip)$", file_name, ignore.case = TRUE) |
    grepl("GSE178535", file_name, ignore.case = TRUE)
]

fwrite(
  files,
  file.path(qc_dir, "GSE178535_supplementary_file_audit.tsv"),
  sep = "\t"
)

message("[audit] Files detected:")
print(files)
