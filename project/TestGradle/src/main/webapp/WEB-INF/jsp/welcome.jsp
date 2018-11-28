<%-- 
    Document   : hello
    Created on : Jun 11, 2018, 1:16:12 AM
    Author     : Martin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Mantenedores</title>
		<!--link href="css/style.css" rel="stylesheet"-->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    </head>
    <body>
		<header>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="/">Home</a>
					</div>
				</div>
			</nav>
		</header>
		<main role="main">	
			<div class="table-responsive">
				<table class="table table-bordered text-center">
					<thead class="thead-dark">
						<tr>
							<th colspan="2">Mantenedores</th>
						</tr>
					</thead>
					<tbody>
						<tr class="bg-primary">
							<td><a class="btn btn-danger" href = "/mantenedor/colegio">Ir a Mantenedor de colegio</a></td>
							<td><a class="btn btn-danger" href = "/mantenedor/profesor">Ir a Mantenedor de profesor</a></td>	
						</tr>					
					</tbody>
				</table>								
			</div>
		</main>
		<footer class="footer">
			<div class="container-fluid">
				<span class="text-muted">Footer content here.</span>
			</div>
		</footer>
		<!--script src="js/custom.js"></script-->
		<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    </body>
</html>