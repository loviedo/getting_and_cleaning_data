# Intro
- utilizamos 6 archivos>  `x_train.txt`, `x_test.txt`, `y_train.txt`, `y_test.txt`, `subject_train.txt`, `subject_test.txt`, Que se encuentran en el dataset descargado: **URI HAR Dataset**.
- `features.txt` contiene el numero correcto de nombres de variable. que corresponde con cada columna de `x_train.txt` y `x_test.txt`. mayor explicacion en `features_info.txt`. 
- `activity_labels.txt` contains the desciptive names for each activity label, which corresponds to each number in the `y_train.txt` and `y_test.txt`.
- The `README.txt` is the overall desciption about the overall process of how publishers of this dataset did the experiment and got the data result.


# Course Project Introduction
El script `run_analysis.R` utiliza el paquete `data.table` para renombrar las columnas y leer los archivos. REalizamos los siguientes 5 pasos:


1. Merge fr lod datos test y de training para crear un data set. s the training and the test sets to create one data set. (In the following the word data means both train and test).
The `x_data.txt`, `y_data.txt`, `subject_data.txt` se unen por filas, y luego los 3 se unen por columnas. 

2. Extrae solamente aquellos features que sean promedio y la desviacion estandard para cada medida.
PAra las columnas de `x_data.txt`, extraemos solamente aquellas que tengan: mean() o std() en los nombres, se comparan con `feature.txt`.


3. Usamos nombres descriptivos de actividad para los nombres en el dataset "activities"@ 
Matcheamos cada nro en las columans de `y_data` con `activity_labels.txt`.


4. Nombramos apropiadamente las etiquetas en el dataset con los datos de descripcion de variables. 
Renombramos las columnas de `y_data` y `subject_data`, en vez de usar los nombres por default.


5. para el data set en el paso 4, crearmos otro dataset independiemnte 
guardamos el dataset tidy en `tidyd.txt`.

# Descripcion de los datos finales. 
Generamos Los datasets `data3` y `data4` por el script>   `run_analysis.R`. 
