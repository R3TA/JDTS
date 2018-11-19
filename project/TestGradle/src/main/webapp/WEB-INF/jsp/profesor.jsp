<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profesores</title>
		<style>
			table , th , td {
				border: 1px black solid;
				border-collapse: collapse;
				text-align: center;
			}
		</style>	
    </head>
    <body>
		<a href = "/">VOLVER AL HOME</a>
        <h1>MANTENEDOR DE PROFESOR</h1>
		<div>
			<form action="/mantenedor/profesor/add" method="GET">
				<label>Nombre:</label>
					<span>
						<input id="nombre" name="nombre" type="text" required></input>
					</span>
					<span>
						<input id="activohidden" name="activo" type='hidden' value="0">
						<input id="activo" name="activo" type='checkbox' value="1" required>
						<label>Activo</label>
					</span>					
				</br>
				</br>
				<label>Fecha de nacimiento:</label>
					<span>
						<input id="fechanacimiento" name="fechanacimiento" type="date" required></input>
					</span>
				</br>
				</br>				
				<label>Colegio:</label>
					<span>
						<select id ="colegio" name = "colegio" required>
							<option value="" disabled selected>Seleccionar colegio</option>
							<c:forEach var="colegio" items="${listColegio}">
							<option value = "<c:out value="${colegio.id}"></c:out>"><c:out value = "${colegio.nombre}"></c:out></option>
							</c:forEach> 
						</select>
					</span>
				</br>
				</br>	
				<label>Asignatura:</label>
					<span>
						<select id = "asignatura" name = "asignatura" required>
							<option value="" disabled selected>Seleccionar asignatura</option>
							<c:forEach var="asignatura" items="${listAsignatura}">
							<option value = "<c:out value="${asignatura.id}"></c:out>"><c:out value = "${asignatura.nombre}"></c:out></option>
							</c:forEach>
						</select>
					</span>
				</br>
				</br>					
				<button type="reset">Limpiar</button><button id="submit" name="submit" type="submit">Guardar</button>
			</form>
		</div>
		</br>
		<div>	
			<table>
				<thead>
					<tr>
						<td>ID</td>
						<td>Nombre</td>
						<td>Colegio</td>
						<td>Asignatura</td>
						<td>Opciones</td>
					</tr>				
				</thead>
				<tbody>
				<c:forEach var="profesor" items="${listProfesor}">
                <tr>
					<td>${profesor.id}</td>
                    <td>${profesor.nombre}</td>
                    <td>${profesor.colegio}</td>
					<td>${profesor.asignatura}</td>
                    <td>
                        <a href="/mantenedor/profesor/editprofesor?id=${profesor.id}">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="/mantenedor/profesor/delete?id=${profesor.id}">Delete</a>
                    </td>                           
                </tr>
                </c:forEach>    				
				</tbody>
			</table>
		</div>
		<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script>
			$('#activo').on('change', function () {
				this.value = this.checked ? 1 : 0;
			 }).change();

			$("#submit").click(function () {
				if(document.getElementById("activo").checked){
					document.getElementById('activohidden').disabled = true;
				}
			});				
		</script>	
    </body>
</html>
