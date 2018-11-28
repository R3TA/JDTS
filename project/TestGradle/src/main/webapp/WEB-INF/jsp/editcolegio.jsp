<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <title>Colegios</title>		
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
				<form id="formEditColegio" name="formEditColegio" class="p-3 mb-2 bg-light text-black" action="/mantenedor/colegio/edited" method="POST">
					<div id="container-mensaje" class="form-group row" style="display:none">
						<div id="mensaje" class="col text-center alert alert-success" role="alert"></div>
					</div>
					<c:forEach items="${requestScope.colegio}" var="colegio" >
					<div class="form-group">
						<div class="col text-center"><h1>Editar datos de colegio</h1></div>
					</div>
					<div class="form-group row">
						<label for="id" class="col-sm-2 col-form-label">id</label>
						<div class="col-sm-6">
							<input id="id" name="id" type="text" value="<c:out value="${colegio.id}"></c:out>" class="form-control" readonly></input>
						</div>
					</div>
					<div class="form-group row">
						<label for="name" class="col-sm-2 col-form-label">Nombre</label>
						<div class="col-sm-6">
							<input id="nombre" name="nombre" type="text" class="form-control" value="<c:out value="${colegio.nombre}"></c:out>" required></input>
						</div>
					</div>	
					<div class="form-group row">
						<label for="direccion" class="col-sm-2 col-form-label">Direcci&oacute;n</label>
						<div class="col-sm-6">
							<input id="direccion" name="direccion" type="text" class="form-control" value="<c:out value="${colegio.direccion}"></c:out>" required></input>
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
		<script>
			$("#submit").click(function (e) {
				//Prevent default submission of form
				e.preventDefault();
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
							type: $("#formEditColegio").attr("method"),
							url: $("#formEditColegio").attr("action"),
							data: $("#formEditColegio").serialize(),
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
									$("#mensaje").css({"display":"block"}).html("Colegio editado satisfactoriamente!").fadeOut(10000);
									$("#formEditColegio")[0].reset();
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
					console.log("Error in function formAddColegio: "+e.message);   
				}
				return false;
			});	
		</script>			
    </body>
</html>
