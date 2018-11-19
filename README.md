# JDTS
El repositorio actual contiene el desarrollo de los items definidos por la empresa Bennu.

Con respecto a la primera sección del documento presentado: 

Se diseñó un modelo de datos acorde a las especificaciones indicadas.
El modelo de datos se encuentra en un archivo de imagen en formato ".jpg".
El respaldo de la base de datos diseñada se encuentra en el archivo "db.sql".
Se implementaron las 3 consultas especificadas, y su respaldo se encuentra en el archivo "querys.sql".
Con respecto a la implementación/Codificación de los mantenedores, se utilizaron las siguientes tecnologías:

Gradle en su versión 4.10.2
Springboot en su versión 2.1.0
Se aplicaron los siguientes patrones:

Data Access Object (DAO)
Model View Controller (MVC)
Se implementaron los siguientes casos de uso:

Crear colegio/profesor
Leer todos los colegios/profesores
Editar colegio/profesor
Eliminar colegio/profesor
Las rutas del proyecto son las siguientes:

/
/mantenedor/colegio
/mantenedor/colegio/add
/mantenedor/colegio/editcolegio
/mantenedor/colegio/delete
/mantenedor/profesor
/mantenedor/profesor/add
/mantenedor/profesor/editprofesor
/mantenedor/profesor/edited
/mantenedor/profesor/delete
Para ejecutar el proyecto en otro ambiente, considerar lo siguiente:

Se debe editar el archivo application.properties para ajustar los datos propios para configurar el acceso a la base de datos.
Se debe editar el archivo profesorDAO.java, especificamente en la función DataSource. Replicar la data del paso 3.1.
Se debe editar el archivo colegioDAO.java, especificamente en la función DataSource. Replicar la data del paso 3.1.