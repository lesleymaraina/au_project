library(tidyverse)
library("data.table")
library("readr")

df <- fread('file1.tsv')
df %>% select('Sample1') -> col

# Print column names
for (i in 1:ncol(df)){
    print(colnames(df)[i])
}

#Extract column info
col %>%
    mutate(Sample1 = gsub("^([^:]*:[^:]*:[^:]*:[^:]*):.*$", "\\1", Sample1),
       Sample1 = str_sub(Sample1, -1)) -> col

#Extract data from multiple files
for (i in 1:ncol(df)) {
    col %>%
        mutate(Sample1 = gsub("^([^:]*:[^:]*:[^:]*:[^:]*):.*$", "\\1", Sample1),
               Sample1 = str_sub(Sample1, -1)) -> col
}
