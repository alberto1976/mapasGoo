# verbos de dplyr
# cargar la librería dplyr
library(dplyr)

# verbo: select

iris1 <- select(iris, Sepal.Length, Species)

# verbo: mutate

iris2 <- mutate(iris1, Nueva = Sepal.Length / 10)

# Verbo: filter

iris3 <- filter(iris2, Species %in% c("setosa", "virginica"))

# Verbo: arrange

iris4 <- arrange(iris3, Nueva)
iris5 <- arrange(iris3, desc(Nueva))

# Verbo: summarise

iris6 <- summarise(iris5, Media1 = mean(Sepal.Length), Media2 = mean(Nueva))

# Verbo: summarise + group_by

iris7 <- group_by(iris5, Species)
iris8 <- summarise(iris7, Media1 = mean(Sepal.Length), Media2 = mean(Nueva))

# Operador pipe (%>%)

iris %>% select(Sepal.Length, Species) %>% 
  mutate(Nueva = Sepal.Length / 10) %>% 
  filter(Species %in% c("setosa", "virginica")) %>% 
  group_by(Species) %>% 
  summarise(Total = n(), Media1 = mean(Sepal.Length), Media2 = mean(Nueva), 
            Cuartil1 = quantile(Sepal.Length, c(0.25)), Rango = IQR(Sepal.Length),
            Cuartil3 = quantile(Sepal.Length, c(0.75))) %>% 
  arrange(Media2)
  
  
  
  
