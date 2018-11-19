# JDTS
El repositorio actual contiene el desarrollo de los items definidos por la empresa Bennu.

Con respecto a la primera sección del documento presentado: <br />
<ol>
<li>Se diseñó un modelo de datos acorde a las especificaciones indicadas.</li>
<li>El modelo de datos se encuentra en un archivo de imagen en formato ".jpg".</li>
<li>El respaldo de la base de datos diseñada se encuentra en el archivo "db.sql".</li>
<li>Se implementaron las 3 consultas especificadas, y su respaldo se encuentra en el archivo "querys.sql".</li>
</ol>

Con respecto a la implementación/Codificación de los mantenedores, se utilizaron las siguientes tecnologías: 
 * Gradle en su versión 4.10.2
 * Springboot en su versión 2.1.0

Se aplicaron los siguientes patrones:
 * Data Access Object (DAO)
 * Model View Controller (MVC)
 
 Se implementaron los siguientes casos de uso:
 * Crear colegio/profesor
 * Leer todos los colegios/profesores
 * Editar colegio/profesor
 * Eliminar colegio/profesor
 
Las rutas del proyecto son las siguientes:
<ul>
 <li>/</li>
 <li>/mantenedor/colegio</li>
 <li>/mantenedor/colegio/add</li>
 <li>/mantenedor/colegio/editcolegio</li>
 <li>/mantenedor/colegio/delete</li>
 <li>/mantenedor/profesor</li>
 <li>/mantenedor/profesor/add</li>
 <li>/mantenedor/profesor/editprofesor</li>
 <li>/mantenedor/profesor/edited</li>
 <li>/mantenedor/profesor/delete</li>
</ul>

Para ejecutar el proyecto en otro ambiente, considerar lo siguiente:
<ol>
<li>Se debe editar el archivo application.properties para ajustar los datos propios para configurar el acceso a la base de datos.</li>
<li>Se debe editar el archivo profesorDAO.java, especificamente en la función DataSource. Replicar la data del paso 3.1.</li>
<li>Se debe editar el archivo coleioDAO.java, especificamente en la función DataSource. Replicar la data del paso 3.1.</li>
</ol>
