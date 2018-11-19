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
        <h1>MANTENEDOR DE PROFESOR</h1>
		<a href = "/mantenedor/profesor">VOLVER</a>
		<div>
			<form action="/mantenedor/profesor/edited" method="GET">
				<c:forEach items="${requestScope.profesor}" var="profesor" >
					<table border="1">
						<label>id</label>
						<span>
							<input id="id" name="id" type="text" value="<c:out value="${profesor.id}"></c:out>" readonly></input>
						</span>
						</br>
						</br>
						<label>Nombre:</label>
							<span>
								<input id="nombre" name="nombre" type="text" value = "<c:out value="${profesor.nombre}"></c:out>"></input>
							</span>
							<span>
							<input id="activohidden" name="activo" type="hidden" value="0"></input>
							<c:set var = "activo" scope = "session" value = "${profesor.activo}"/>
								<c:if test = "${activo == 1}">
									<input id="activo" name="activo" type="checkbox" value = "<c:out value="${profesor.activo}"></c:out>" checked></input>
								</c:if>
								<c:if test = "${activo == 0}">
									<input id="activo" name="activo" type="checkbox" value = "<c:out value="${profesor.activo}"></c:out>"></input>
								</c:if>
		
								<label>Activo</label>
							</span>					
						</br>
						</br>
						<label>Fecha de nacimiento:</label>
							<span>
								<input id="fechanacimiento" name="fechanacimiento" type="date" value = "<c:out value="${profesor.fechaNacimiento}"></c:out>" readonly></input>
							</span>
						</br>
						</br>				
						<label>Colegio:</label>
							<span>
								<select id ="colegio" name = "colegio">
									<option value="" disabled>Seleccionar colegio</option>
									<option value = "<c:out value="${profesor.colegio}"></c:out>" selected><c:out value = "${profesor.colegio}"></c:out></option>
									<c:forEach var="colegio" items="${listColegio}">
										<option value = "<c:out value="${colegio.id}"></c:out>"><c:out value = "${colegio.nombre}"></c:out></option>
									</c:forEach> 
								</select>
							</span>
						</br>
						</br>	
						<label>Asignatura:</label>
							<span>
								<select id = "asignatura" name = "asignatura">
									<option value = "<c:out value="${profesor.asignatura}"></c:out>" selected><c:out value = "${profesor.asignatura}"></c:out></option>
									<option value="" disabled>Seleccionar asignatura</option>
									<c:forEach var="asignatura" items="${listAsignatura}">
										<option value = "<c:out value="${asignatura.id}"></c:out>"><c:out value = "${asignatura.nombre}"></c:out></option>
									</c:forEach>
								</select>
							</span>
						</br>
						</br>					
						<button type="reset">Limpiar</button><button id="submit" name="submit" type="submit">Guardar</button>
					</table>
				</c:forEach>				
			</form>
		</div>
		</br>
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
