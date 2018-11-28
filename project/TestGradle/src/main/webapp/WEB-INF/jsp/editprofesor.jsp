<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <title>Editar profesor</title>
    </head>
    <body>
		<header>
			<div class="container-fluid">
				<nav class="navbar navbar-expand-lg navbar-light bg-secondary">
					<div class="container-fluid">
						<div class="navbar-header">
							<a class="navbar-brand text-white" href="/">Home</a>
						</div>
					</div>
				</nav>
			</div>
		</header>
		<main role="main">
			<div class="container-fluid"> <!-- Begin container form profesor -->	
				<form id="formEditProfesor" name="formEditProfesor" class="p-3 mb-2 bg-light text-black" action="/mantenedor/profesor/edited" method="POST">
					<div id="container-mensaje" class="form-group row" style="display:none">
						<div id="mensaje" class="col text-center alert alert-success" role="alert"></div>
					</div>
					<c:forEach items="${requestScope.profesor}" var="profesor" >
					<div class="form-group row">
						<div class="col text-center"><h1>Editar datos de profesor</h1></div>
					</div>
					<div class="form-group row">
						<label for="id" class="col-sm-2 col-form-label">id</label>
						<div class="col-sm-6">
							<input id="id" name="id" type="text" value="<c:out value="${profesor.id}"></c:out>" class="form-control" readonly></input>
						</div>
					</div>
					<div class="form-group row">
						<label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
						<div class="col-sm-6">
							<input id="nombre" name="nombre" type="text"  value = "<c:out value="${profesor.nombre}"></c:out>" class="form-control" required></input>
						</div>
						<div class="col">
							<input id="activohidden" name="activo" type="hidden" value="0">
								<c:set var = "activo" scope = "session" value = "${profesor.activo}"/>
									<c:if test = "${activo == 1}">
										<input id="activo" name="activo" type="checkbox" value = "<c:out value="${profesor.activo}"></c:out>" class="form-control" checked></input>
									</c:if>
									<c:if test = "${activo == 0}">
										<input id="activo" name="activo" type="checkbox" value = "<c:out value="${profesor.activo}"></c:out>" class="form-control"></input>
									</c:if>
						</div>
						<label for="activo" class="col-sm-2 col-form-label">Activo</label>
					</div>
					<div class="form-group row">
						<label for="fechanacimiento" class="col-sm-2 col-form-label">Fecha de nacimiento</label>
						<div class="col-sm-6">
							<input id="fechanacimiento" name="fechanacimiento" type="date" class="form-control" value = "<c:out value="${profesor.fechaNacimiento}"></c:out>" readonly></input>
						</div>					
					</div>
					<div class="form-group row">
						<label for="colegio" class="col-sm-2 col-form-label">Colegio</label>
						<div class="col-sm-6">
							<select id ="colegio" name = "colegio" class="form-control" required>
								<option value="" disabled selected>Seleccionar colegio</option>
								<option value = "<c:out value="${profesor.colegio}"></c:out>" selected><c:out value = "${profesor.colegio}"></c:out></option>
									<c:forEach var="colegio" items="${listColegio}">
										<option value = "<c:out value="${colegio.id}"></c:out>"><c:out value = "${colegio.nombre}"></c:out></option>
									</c:forEach> 
							</select>
						</div>
					</div>
					<div class="form-group row">	
						<label for="asignatura" class="col-sm-2 col-form-label">Asignatura</label>
						<div class="col-sm-6">
							<select id = "asignatura" name = "asignatura" class="form-control" required>
								<option value = "<c:out value="${profesor.asignatura}"></c:out>" selected><c:out value = "${profesor.asignatura}"></c:out></option>
									<option value="" disabled>Seleccionar asignatura</option>
									<c:forEach var="asignatura" items="${listAsignatura}">
										<option value = "<c:out value="${asignatura.id}"></c:out>"><c:out value = "${asignatura.nombre}"></c:out></option>
									</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group row">	
						<div class="col-sm-12 text-center">
							<button type="reset" class="btn btn-primary">Limpiar</button> 
							<button id="submit" name="submit" type="submit" class="btn btn-primary">Guardar</button>
						</div>
					</div>
					</c:forEach>
				</form>
			</div><!-- End container form profesor -->
		</main>
		<footer class="footer">
			<div class="container-fluid">
				<span class="text-muted">Footer content here.</span>
			</div>
		</footer>
		<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		<script>
		$('#activo').on('change', function () {
			this.value = this.checked ? 1 : 0;
		 }).change();

		$("#submit").click(function () {
			if(document.getElementById("activo").checked){
				document.getElementById('activohidden').disabled = true;
			}
			try{/*
					var error = false;
					var nombre = $("#nombre").val();
					var fechanacimiento = $("#fechanacimiento").val();
					var activo = $("#activo").val();
					var colegio = $("#colegio").val();
					var asignatura = $("#asignatura").val();
					var profesor = $("#profesor").val();				
					var subs = "";
					
					if((nombre.length == 0 || !nombre.trim())){
						$("#nombre").attr({"title":"Completar campo obligatorio"});
						error = true;					
					}else{
						error = false;
					}
					
					if((fechanacimiento.length == 0 || !fechanacimiento.trim())){
						$("#fechanacimiento").attr({"title":"Completar campo obligatorio"});
						error = true;					
					}else{
						error = false;
					}
					
					if(activo === null){
						error = true;					
					}else{
						error = false;
					}
					if(colegio === null){
						error = true;					
					}else{
						error = false;
					}

					if(asignatura === subs){
						error = true;					
					}else{
						error = false;
					}
					
					if(profesor === subs){
						error = true;					
					}else{
						error = false;
					}
					
					if(error === false){*/
						$.ajax({
							type: $("#formEditProfesor").attr("method"),
							url: $("#formEditProfesor").attr("action"),
							data: $("#formEditProfesor").serialize(),
							dataType: "text",
							encode: true,
							beforeSend: function (xhr) {
								console.log(xhr);
								$("#submit").attr({"disabled":"true"}).html("Enviando...");
							},        
							success: function (data) {
								console.log(data);
								if(data === "Updated"){
									$("#submit").removeAttr("disabled").html("Guardar");
									$("#container-mensaje").css({"display":"block"});							
									$("#mensaje").css({"display":"block"}).html("Profesor editado satisfactoriamente!").fadeOut(10000);
									$("#formEditProfesor")[0].reset();
								}
								else{
									$("#submit").removeAttr("disabled").html("Guardar");
									$("#container-mensaje").css({"display":"block"});	
									$("#mensaje").css({"display":"block"}).html("La operación no se pudo completar. Intentar nuevamente!").fadeOut(10000);
								}
							},
							error:function (){
								console.log("ERROR");
								$("#submit").removeAttr("disabled").html("Guardar");
							},
							 complete: function(){
								console.log("DONE");
							}
						});				
					//}
				}catch(e){
					console.log("Error in function formAddProfesor: "+e.message);   
				}
				return false;
			});			
		</script>			
    </body>
</html>
