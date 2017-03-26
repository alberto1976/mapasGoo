# verbos de dplyr
# cargar la librería dplyr
library(dplyr)

# verbo: select

iris1 <- select(iris, Sepal.Length, Species)

# verbo: mutate

iris2 <- mutate(iris1, Nueva = Sepal.Length / 10)

# Verbo: filter

iris3 <- filter(iris2, Species %in% c("setosa", "virginica"))
