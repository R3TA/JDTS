<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Colegios</title>
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
        <h1>MANTENEDOR DE COLEGIO</h1>
		<div>
			<form action="/mantenedor/colegio/add" method="GET">
				<label>Nombre</label>
					<span>
						<input id="nombre" name="nombre" type="text" required></input>
					</span>
					</br>
					</br>
				<label>Direcci&oacute;n</label>
					<span>
						<input id="direccion" name="direccion" type="text" required></input>
					</span>
				</br>
				</br>
				<button type="reset">Limpiar</button><button type="submit">Guardar</button>
			</form>
		</div>
		</br>		
		<div>
			<table>
					<thead>
						<tr>
							<td>ID</td>
							<td>Nombre</td>
							<td>Direcci&oacute;n</td>
							<td>Opciones</td>
						</tr>				
					</thead>
					<tbody>
					<c:forEach var="colegio" items="${listColegio}">
					<tr>
						<td>${colegio.id}</td>
						<td>${colegio.nombre}</td>
						<td>${colegio.direccion}</td>
						<td>
							<a href="/mantenedor/colegio/editcolegio?id=${colegio.id}">Edit</a>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="/mantenedor/colegio/delete?id=${colegio.id}">Delete</a>
						</td>								 
					</tr>
					</c:forEach> 					
					</tbody>
			</table>
		</div>	
    </body>
</html>
