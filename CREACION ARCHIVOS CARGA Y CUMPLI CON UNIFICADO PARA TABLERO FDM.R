library(tidyverse)
library(readxl)
library(dplyr)
library(writexl)





CUMPLIS_controlA <- read_xlsx("C:/Users/natva/OneDrive/Escritorio/AGC_DATOS/Exportaciones/UnificadoCumplis2022aJulio.xlsx")
CUMPLIS_controlC <- read_xlsx("C:/Users/natva/OneDrive/Escritorio/AGC_DATOS/Exportaciones/Asignaciones051222.xlsx", sheet = "Cumplimientos")

CUMPLISA <- CUMPLIS_controlA %>% select("Analista","Fecha","Tkt DEN","N° Denuncia","Tkt área","Estado propuesto en SUACI","Estado TKT LIZA tras el análisis", "MOTIVO SEGUNDO TICKET","CRITICIDAD DE LA DENUNCIA", "SGO a la que fue planificada", "RESPONSABLE REVISOR", "¿Coincide criterio revisor?", "ESTADO EN SUACI tras revisión / Completar sólo si no coincide con el criterio del analista")%>%
  rename ('DEN'="Tkt DEN")%>%
  rename ('EstadoSUACI'="Estado propuesto en SUACI")%>%
  rename ('EstadoLIZA'="Estado TKT LIZA tras el análisis")


CUMPLISC <- CUMPLIS_controlC %>% select("Analista","Fecha","DEN","N Denuncia","Tkt Área","Estado propuesto en Gestión Colaborativa","Estado en LIZA tras análisis","Motivo 2do tkt","Criticidad", "SGO a la que se planifica", "Revisor responsable", "¿Coincide criterio?", "Estado en GC tras revisión (si no coincide con propuesta)")  %>%
  rename ('N° Denuncia'="N Denuncia") %>%  
  rename ('Tkt área'="Tkt Área")%>%
  rename ('EstadoSUACI'="Estado propuesto en Gestión Colaborativa")%>%
  rename ('EstadoLIZA'="Estado en LIZA tras análisis")%>%
  rename ('MOTIVO SEGUNDO TICKET'= "Motivo 2do tkt"  )%>%
  rename ('CRITICIDAD DE LA DENUNCIA'= "Criticidad" )%>%
  rename ('SGO a la que fue planificada' = "SGO a la que se planifica")%>%
  rename ('RESPONSABLE REVISOR'= "Revisor responsable")%>%
  rename ('¿Coincide criterio revisor?'= "¿Coincide criterio?" )%>%
  rename('ESTADO EN SUACI tras revisión / Completar sólo si no coincide con el criterio del analista'="Estado en GC tras revisión (si no coincide con propuesta)")


CUMPLIS <- rbind(CUMPLISA,CUMPLISC)

CUMPLIS <- CUMPLIS %>%
  rename(NSUACI="N° Denuncia")

CUMPLIS$DEN <- gsub(" |\r\n|\n|\r|", "", CUMPLIS$DEN)
CUMPLIS$Analista <- gsub(" |\r\n|\n|\r|", "", CUMPLIS$Analista)
CUMPLIS$NSUACI <- gsub(" |\r\n|\n|\r|", "", CUMPLIS$NSUACI)


write_xlsx(x = CUMPLIS ,path = 'C:/Users/natva/OneDrive/Escritorio/AGC_DATOS/RESULTADOS_CONTROLES/CUMPLIS051222.xlsx')





CARGAS_controlA <- read_xlsx("C:/Users/natva/OneDrive/Escritorio/AGC_DATOS/Exportaciones/UnificadoCargas2022aJulio.xlsx")
CARGAS_controlC <- read_xlsx("C:/Users/natva/OneDrive/Escritorio/AGC_DATOS/Exportaciones/Asignaciones051222.xlsx", sheet = "Cargas")

CARGASA <- CARGAS_controlA %>% select("Analista","Fecha","Nº Denuncia","DG","Criticidad","Estado","DEN","Tkt Hijo","SGO a la que fue planificada","Propuesta cierre por antecedentes","Tkt hijo para cumplir","REVISOR RESPONSABLE", "Coincide criterio","Estado de cierre efectivo", "Tkt hijo de cierre efectivo")
CARGASC <- CARGAS_controlC %>% select("Analista","Fecha iniciado AGC","N Denuncia","DG","Criticidad","Estado","DEN","Tkt hijo","SGO a la que fue planificada","Propuesta cierre por antecedentes","Tkt hijo para cumplir","Coincide criterio","Estado de cierre efectivo", "Revisor/a asignado/a","Tkt hijo de cierre efectivo" ) %>%
  rename ('Fecha'="Fecha iniciado AGC")%>%
  rename ('Nº Denuncia'="N Denuncia") %>%
  rename ('Tkt Hijo'="Tkt hijo")%>%
  rename ('REVISOR RESPONSABLE' = "Revisor/a asignado/a")


CARGAS <- rbind(CARGASA,CARGASC)

CARGAS <- CARGAS %>%
  rename(NSUACI="Nº Denuncia") %>%
  rename(SGO="SGO a la que fue planificada")

CARGAS$DEN <- gsub(" |\r\n|\n|\r|", "", CARGAS$DEN)
CARGAS$Analista <- gsub(" |\r\n|\n|\r|", "", CARGAS$Analista)
CARGAS$NSUACI <- gsub(" |\r\n|\n|\r|", "", CARGAS$NSUACI)
CARGAS$SGO <- gsub(" |\r\n|\n|\r|", "", CARGAS$SGO)



write_xlsx(x = CARGAS ,path = 'C:/Users/natva/OneDrive/Escritorio/AGC_DATOS/RESULTADOS_CONTROLES/CARGAS051222.xlsx')



