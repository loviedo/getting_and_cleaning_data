# PROYECTO  Curso de coursera> Coursera Getting and Cleaning Data 
# test 1



library(data.table)
setwd("D:/getting_cleaning")

#descargamos los valores
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file( url, destfile = "data.zip" )
unzip("data.zip")


# cambiamos de directorio
setwd("D:/getting_cleaning/UCI HAR Dataset")

#usamos los siguientes archivos: // test/subject_test.txt  , test/X_test.txt  , test/y_test.txt
# // train/subject_train.txt, train/X_train.txt, train/y_train.txt
trainf <- list.files( "train", full.names = TRUE )[-1]
testf  <- list.files( "test" , full.names = TRUE )[-1]

#leemos los 6 archivos....
archivo <- c( trainf, testf )
data <- lapply( archivo, read.table, stringsAsFactors = FALSE, header = FALSE )

# ---------------------------------------------------------------------
# PASO 1 : Hacemos merce de los train y test datasets, creamos 1 
data1 <- mapply ( rbind, data[ c(1:3) ], data[ c(4:6) ] )
# data2: cargamos en un dataset entero
data2 <- do.call( cbind, data1 )


# ----------------------------------------------------------------------
# PASO 2: For the feature column, extracts only the measurements on the 
# mean and standard deviation for each measurement

# matcheamos utilizando features.txt(segundo archivo del list.file() )  featurename esta en la segunda columna (V2)
featuresn <- fread( list.files()[2], header = FALSE, stringsAsFactor = FALSE )

# ------------------------------------------------------------------------------
# PASO 3: Use descriptive activity names to name the activities in the data set

# match it using activity_labels.txt(first file in list.file() )
activitynames <- fread(list.files()[1], header = FALSE, stringsAsFactor = FALSE)

data3$activity <- activitynames$V2[match(data3$activity, activitynames$V1)]

# seteamos los nombres de columnas para data2  
# PASO 4 : ponemos etiquetas apropiadas para para el dataset con los nombres de variables descriptivos
setnames( data2, c(1:563), c("subject",featuresn$V2, "activity"))

# Extraemos solamente la columan que tiene el promedio y desv std al final
medidas <- grep( "std|mean\\(\\)", featuresn$V2 ) + 1

# data3 : contiene solamente la desviacion standard para la columna feature 
data3 <- data2[, c( 1, medidas, 563 ) ]



# ---------------------------------------------------------------------------------
# PASO 5 : creamos el data set del PASO4, con el promedio de cada varialbe, de cada actividad y cada materia.
data4 <- aggregate( . ~ subject + activity, data = data3, FUN = mean )

# escribir data4
setwd("D:/getting_cleaning")
write.table( data4, "promedio_datos.txt", row.names = FALSE )