# **************************************************************************
# This short file prepares the data for the workshop in the following ways 
# - Reduce the size of the data file to 1000 rows from a million rows data file
# - Insert NA values for cleaning demonstration
# **************************************************************************

setwd("C:/Users/Whokin/OneDrive - sfu.ca/University/Courses/DSSS/R workshop")
# Load a subset of the data
df <- read.delim("personality-data.csv", 
                 header = TRUE,
                 stringsAsFactors=TRUE, 
                 nrows = 1000) # The nrows = 1000 argument tells R that we only want the first thousand rows

# delete portion of the data to practice cleaning
rows_corrupt = sample(1:nrow(df), floor(nrow(df)*0.1), replace = FALSE)
cols_corrupt = sample(1:ncol(df), floor(nrow(df)*0.1), replace = FALSE)

df[rows_corrupt, cols_corrupt] = NA

# Add missing values in 3% of the data
n = nrow(df)*0.03
for(i in seq_len(n)){
  row = sample(n, 1)
  col = sample(ncol(df), 1)
  df[row, col] = NA
}

write.csv(x = df, file = "personality-data-subset.csv")

