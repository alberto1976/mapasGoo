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

# Operado %>%

iris %>% select(Sepal.Length, Species) %>% 
  mutate(Nueva = Sepal.Length / 10) %>% 
  filter(Species %in% c("setosa", "virginica")) %>% 
  group_by(Species) %>% 
  summarise(Media1 = mean(Sepal.Length), Media2 = mean(Nueva)) %>% 
  arrange(Media2)
  
  
  
  
