#SOFIA CORRAL CABALLERO
#21846911

#ENUNCIADO DEL EJERCICIO####
#Queremos leer un archivo el cual los generaremos en
#tiempo real, procesaremos el archivo y obtendremos
#información útil 

#CARGAMOS EL DATASET####
#setwd('C:\\Users\\sofia\\OneDrive\\Documentos\\UEM1\\Tercer año\\LPE\\EJERCICIOS\\EJERCICIO 1 (Cargar dataset tiempo real)')
dataSet <- read.csv(file.choose(),header = TRUE, sep = ',')
print(dataSet)
length(dataSet)

#RENOMBRAMOS LAS COLUMNAS####
names (dataSet) = c("Fecha", "Correo", "MiDescripcion", "Hyflex", "Nombre", "Mes", "Year",
                           "Apellido", "Descripcion_compañero", "EsRepetidor", "Expediente", "GitHub", "NivelProgramacion",
                           "PresentadoExpo", "DigitalBlock")

#Otra opción de renombrar una sola columna:
    #names(dataSet)[names(dataSet)=='Email.Address']<-'Correo'
   

#1 ¿CUAL ES EL ALUMNO MÁS VIEJO?####
attach(dataSet)
min(Year)
which.min(Year)

alumnoViejo <- subset(dataSet, Year == viejo, "Nombre")
alumnoViejo

#2 ¿Cuantos alumnos cumplen años este mes?####

cumpleanios <- sum(dataSet$Mes == "11")
cumpleanios

#3 Listado de los alumnos con expediente par e impar####
pares <- subset(dataSet, Expediente%%2 == 0, "Nombre")
pares

impares <- subset(dataSet, Expediente%%2 != 0, "Nombre")
impares

#4 ¿Cual es la palabra mas usada ?, ¿Que significado ?####

  #library(tidyverse)
  #library(tokenizers)

  #tabla <- table(palabras)
  #tabla <- data_frame(palabra = names(dataSet), recuento = as.numeric(dataSet))
  #tabla

#5 Porcentaje de alumnos que hicieron la expo####
AlumnosSiExpo <- subset(dataSet, PresentadoExpo == 0, "Nombre")
AlumnosSiExpo
sum(dataSet$PresentadoExpo == 0)
percent(sum(dataSet$PresentadoExpo == 0)/length(PresentadoExpo))  

#6 Numero y listado de asistentes a clase tanto Hyflex como presenciales####
alumnosPresencial <- subset(dataSet, Hyflex == 0, "Nombre")
alumnosPresencial

sumaPresencial <- sum(dataSet$Hyflex == 0)
sumaPresencial

hyflex <- subset(dataSet, Hyflex == 1, "Nombre")
hyflex

sumaHyflex <- sum(dataSet$Hyflex == 1)
sumaHyflex

