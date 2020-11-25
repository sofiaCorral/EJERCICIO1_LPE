
# EJERCICIO 1 -------------------------------------------------------------

#SOFIA CORRAL CABALLERO
#21846911

#ENUNCIADO DEL EJERCICIO####
#Queremos leer un archivo el cual lo generaremos en
#tiempo real, procesaremos el archivo y obtendremos
#información útil 

#CARGAMOS EL DATASET####
#Lo siguiente es una opcion para cargar el dataset pero es recomendable hacerlo con read_csv y el url
dataSet <- read.csv(file.choose(),header = TRUE, sep = ',')
print(dataSet)
length(dataSet)



#RENOMBRAMOS LAS COLUMNAS####
#Renombrar las columnas esta bien cuando hablamos de un dataset pequeño
#Ademas, hacemos que este programa solo funcione para este dataset concreto
names (dataSet) = c("Fecha", "Correo", "MiDescripcion", "Hyflex", "Nombre", "Mes", "Year",
                           "Apellido", "Descripcion_compañero", "EsRepetidor", "Expediente", "GitHub", "NivelProgramacion",
                           "PresentadoExpo", "DigitalBlock")

#Otra opción de renombrar una sola columna:
    #names(dataSet)[names(dataSet)=='Email.Address']<-'Correo'
   

#1 ¿CUAL ES EL ALUMNO MÁS VIEJO?####
attach(dataSet) #convertirlo en buscarlo
min(Year)
which.min(Year)
subset(dataSet, Year == min(Year))#En este caso me imprime toda la fila

alumnoViejo <- subset(dataSet, Year == min(Year), "Nombre")#solo imprime el nombre
alumnoViejo

#2 ¿Cuantos alumnos cumplen años este mes?####
#No puedo poner a mano el numero del mes, uso 'today'
cumpleanios <- sum(dataSet$Mes == "11")
cumpleanios

#3 Listado de los alumnos con expediente par e impar####
pares <- subset(dataSet, Expediente%%2 == 0, "Nombre")#solo imprime el nombre
pares

impares <- subset(dataSet, Expediente%%2 != 0, "Nombre")#solo imprime el nombre
impares

#4 ¿Cual es la palabra mas usada ?, ¿Que significado ?####
#PASOS PARA NUESTRA DESCRIPCION####
##instal pack####
#Comprobamos si tenemos pacman,SnowballC y tidyverse. En caso de no tenerlo, los instalamos.

pacman::p_load(pacman,tm,SnowballC,tidediverse)
NuestraDescripcion <- readLines(MiDescripcion)

#corpus (texto que ya está limpio)####

#term-document matrices y remove (METE TODA LA INFORMACIÓN QUE ME DA EL CORPUS)####
#calc y sort por frec.(Palabra) CARCULAR Y ORDENAR LO OBTENIDO CON SU FRECUENCIA (SUMA)####
#tabla de frecuencia####
#WORDS DISTINTIVE####

 

#5 Porcentaje de alumnos que hicieron la expo####
#Hay una opcion mejor sin usar el percent, con el count y calculos
AlumnosSiExpo <- subset(dataSet, PresentadoExpo == 0, "Nombre")
AlumnosSiExpo
sum(dataSet$PresentadoExpo == 0)
percent(sum(dataSet$PresentadoExpo == 0)/length(PresentadoExpo))  

#6 Numero y listado de asistentes a clase tanto Hyflex como presenciales####
alumnosPresencial <- subset(dataSet, Hyflex == 0, "Nombre")#solo imprime el nombre
alumnosPresencial

sumaPresencial <- sum(dataSet$Hyflex == 0)
sumaPresencial

hyflex <- subset(dataSet, Hyflex == 1, "Nombre")
hyflex

sumaHyflex <- sum(dataSet$Hyflex == 1)
sumaHyflex

