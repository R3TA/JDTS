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
        <h1>MANTENEDOR DE COLEGIO</h1>
		<a href = "/mantenedor/colegio">VOLVER</a>
		
		<div>
			<form action="/mantenedor/colegio/edited" method="GET">
			<c:forEach items="${requestScope.colegio}" var="colegio" >
				<table border="1">
				<label>id</label>
					<span>
						<input id="id" name="id" type="text" value="<c:out value="${colegio.id}"></c:out>" readonly></input>
					</span>
					</br>
					</br>
				<label>Nombre</label>
					<span>
						<input id="nombre" name="nombre" type="text" value="<c:out value="${colegio.nombre}"></c:out>" required></input>
					</span>
					</br>
					</br>
				<label>Direcci&oacute;n</label>
					<span>
						<input id="direccion" name="direccion" type="text" value="<c:out value="${colegio.direccion}"></c:out>" required></input>
					</span>
				</br>
				</br>
				<button type="reset">Limpiar</button><button type="submit">Guardar</button>
				</table>
			</c:forEach>  
			</form>			
		</div>
		</br>		
    </body>
</html>
