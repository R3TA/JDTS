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
				<form id="formAddColegio" name="formAddColegio" class="p-3 mb-2 bg-light text-black" action="/mantenedor/colegio/add" method="POST">
					<div id="container-mensaje" class="form-group row" style="display:none">
						<div id="mensaje" class="col text-center alert alert-success" role="alert"></div>
					</div>
					<div class="form-group row">
						<div class="col text-center"><h1>Formulario de colegio</h1></div>
					</div>
					<div class="form-group row">
						<label for="name" class="col-sm-2 col-form-label">Nombre</label>
						<div class="col-sm-6">
							<input id="nombre" name="nombre" type="text" class="form-control" required></input>
						</div>
					</div>	
					<div class="form-group row">
						<label for="direccion" class="col-sm-2 col-form-label">Direcci&oacute;n</label>
						<div class="col-sm-6">
							<input id="direccion" name="direccion" type="text" class="form-control" required></input>
						</div>
					</div>
					<div class="form-group row">	
						<div class="col-sm-12 text-center">
							<button type="reset" class="btn btn-primary">Limpiar</button> 
							<button id="submit" name="submit" type="submit" class="btn btn-primary">Guardar</button>
						</div>
					</div>
				</form>
			</div><!-- End container form profesor -->
			<div class="container-fluid"><!-- Begin container grid profesor -->
				<div id="container-mensaje2" class="form-group row" style="display:none">
					<div id="mensaje2" class="col text-center alert alert-success" role="alert"></div>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered text-center">	
						<thead>
							<tr class="bg-dark text-white">
								<th colspan="4">Mantenedor de colegio</th>
							</tr>	
							<tr class="bg-secondary text-white">
								<th>ID</th>
								<th>Nombre</th>
								<th>Direcci&oacute;n</th>
								<th>Opciones</th>
							</tr>							
						</thead>
						<tbody id="grid-data">				
						</tbody>
					</table>
				</div>
			</div>
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
			var obj = JSON.stringify(${listColegio});
			var parser = JSON.parse(obj);
			var tabla = "";
			var length = parser.length;
			for(var i=0;i<length;i++){
				tabla = tabla + "<tr>"+
                                    "<td class='align-middle'>"+parser[i]["id"]+"</td>"+  
                                    "<td class='align-middle'>"+parser[i]["nombre"]+"</td>"+  
                                    "<td class='align-middle'>"+parser[i]["direccion"]+"</td>"+
									"<td class='align-middle'>"+
										"<a href='/mantenedor/colegio/editcolegio?id="+parser[i]["id"]+"'><input type='image' src = '/../img/icons/boton-editar.png' alt='"+parser[i]["id"]+"'></a>"+
										"&nbsp;&nbsp;&nbsp;&nbsp;"+
										//"<a href='/mantenedor/colegio/delete?id="+parser[i]["id"]+"' class='btn btn-danger'>Delete</a>"+
										"<input id='id' name='id' type='image' src='/../img/icons/boton-eliminar.png' alt='"+parser[i]["id"]+"'></input>"+
									"</td>"+
                               "</tr>";
			}
			$("#grid-data").append(tabla);
		</script>
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
							type: $("#formAddColegio").attr("method"),
							url: $("#formAddColegio").attr("action"),
							data: $("#formAddColegio").serialize(),
							dataType: "text",
							encode: true,
							beforeSend: function (xhr) {
								console.log(xhr);
								$("#submit").attr({"disabled":"true"}).html("Enviando...");
							},        
							success: function (data) {
								console.log(data);
								if(data === "Saved"){
									$("#submit").removeAttr("disabled").html("Guardar");
									$("#container-mensaje").css({"display":"block"});							
									$("#mensaje").css({"display":"block"}).html("Colegio agregado satisfactoriamente!").fadeOut(10000);
									$("#formAddColegio")[0].reset();
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
		<script>
		//event click to delete colegio
		$("input#id").on("click", deleteColegio);
		function deleteColegio(){
			try{
				var value = $(this).attr("alt");
				var src = $(this).attr("src");
				$(this).attr({"type":"submit"});
				$(this).removeAttr("src");
				console.log(value);

				$.ajax({
							type: "GET",
							url: "/mantenedor/colegio/delete?id="+value,
							cache: false,
							dataType: "text",
							beforeSend: function (xhr) {
								console.log(xhr);
								var con = confirm("Está seguro de continuar?");
								if(con === true){
									$("input#id").attr({"type":"image"});
									$("input#id").attr({"src":src});
									$("input#id").attr({"alt":value});
									return true;
								}else{
									xhr.abort();
									console.log("ABORT");
									$("input#id").attr({"type":"image"});
									$("input#id").attr({"src":src});
									$("input#id").attr({"alt":value});
									return false;                       
								}                   
							},
							success: function (data, textStatus, jqXHR) {
								console.log(data);
								if(data === "Deleted"){
									$("#container-mensaje2").css({"display":"block"});							
									$("#mensaje2").css({"display":"block"}).html("Colegio eliminado satisfactoriamente!").fadeOut(10000);}
								else{
									$("#container-mensaje").css({"display":"block"});							
									$("#mensaje").css({"display":"block"}).html("La operación no se pudo completar. Intentar nuevamente!").fadeOut(10000);
								}                    
								console.log("SUCCESS");                   
							},
							error:function (){
								console.log("ERROR");
								$("input#id").attr({"type":"image"});
								$("input#id").attr({"src":src});
								$("input#id").attr({"alt":value}); 
							},
							 complete: function(){
								console.log('DONE');
								$("input#id").attr({"type":"image"});
								$("input#id").attr({"src":src});
								$("input#id").attr({"alt":value});
							}
						});
			}catch(e){
				//alert("Un error ha ocurrido: "+e.message);
				console.log("Error in function deleteProfesor(): "+e.message);   
			}
		}		
		</script>	
    </body>
</html>
