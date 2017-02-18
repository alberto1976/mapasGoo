# Librerías Requeridas

library(readxl)
library(dplyr)
library(googleVis)

# Importar Base
# Ins20171 <- read_excel("F:/Mapa googleVis/Inscritos 2017.xlsx")
Ins20171 <- read_excel("Inscritos 2017.xlsx")

# Eliminar estudiantes Extranjeros
Ins20171 <- Ins20171 %>% filter(ASP_DEPARTAMENTORESIDENCIA != "DEPARTAMENTO EXTRANJERO")

# Seleccionar estudiantes por departamento
# Antioquia
Ant <- Ins20171 %>% filter(ASP_DEPARTAMENTORESIDENCIA == "ANTIOQUIA") %>%
  select(ASP_CIUDADRESIDENCIA, LONGITUD_CIUDADRESIDENCIA, LATITUD_CIUDADRESIDENCIA) %>%
  group_by(ASP_CIUDADRESIDENCIA) %>%
  summarise(Long = max(LONGITUD_CIUDADRESIDENCIA), Lat = max(LATITUD_CIUDADRESIDENCIA), Total = n()) %>%
  mutate(LatLong = paste(Lat, Long, sep = ":"), 
  Descrip = paste("<strong>", "Total Inscritos", ASP_CIUDADRESIDENCIA, "</strong>", "<BR>", paste("<strong>", "<font color='red'>", Total, "</font>", "</strong>")))

# Creación de mapa en googleVis (función gvisMap)
mapa <- gvisMap(Ant, "LatLong" ,"Descrip",
                options = list(showTip = TRUE, showLine = TRUE,
                              enableScrollWheel = TRUE,
                              mapType = "hybrid", useMapTypeControl = TRUE,
                              width = 1350, height = 700))
# Visualización de mapa
plot(mapa)
# Generar el código html
print(mapa)
# Exportar el mapa
cat(mapa$html$chart, file = "Antioquia.html")
