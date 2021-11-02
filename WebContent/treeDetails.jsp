<%@page contentType="text/html" pageEncoding="UTF-8" import="entidades.*, datos.*, vistas.*, java.util.*"%>
<%
	String id = request.getParameter("idArbol")==null?"":request.getParameter("idArbol");
	int idT = Integer.parseInt(id);

	DTArbol dtt = new DTArbol();
	Arbol a = dtt.buscarArbol(idT);

    
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Árboles - Arboreto Carmelo Palma</title>

    <!--CSS boostrap-->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/styles2.css">
    <link rel="stylesheet" href="css/styles.css">

    <!--font awesome-->
    <script src="https://kit.fontawesome.com/78a455df4c.js" crossorigin="anonymous"></script>

    <!-- Scrollbar -->
    <link rel="stylesheet" href="https://unpkg.com/simplebar@latest/dist/simplebar.css">
</head>
<style>
	#nav-tabContent{
		border-radius: 0px 0px 5px 5px;
	}

</style>
<body data-simplebar>

	<jsp:include page="components/mainHeader.jsp" />
		<div class="container my-4 mb-4">
            <!-- Header -->
            <h1 class="my-4">
                Árbol
            </h1>

            <hr class="bg-dark">
            <!-- End of Header -->

           <div class="card mb-3">
			  <div class="row g-0">
			    <div class="col-md-4">
			      <img src="<%=a.getImg() %>" class="img-fluid rounded" alt="...">
			    </div>
			    <div class="col-md-8">
			      <div class="card-body">
			        <h3 class="card-title"><%=a.getNombreComun() %></h3>
			        <h5 class="card-text"><%=a.getNombreCientifico() %></h5>
			        <p class="card-text"><%=a.getDescripcion() %></p>
			        
			      </div>
			      
			    </div>
			  </div>
			</div>
						
			
		</div>
		
		
		
		<div class="container mb-5" >
		<h4 class="my-4 text-muted">
                Información específica
            </h4>

            <hr class="bg-dark">
			<nav>
					  <div class="nav nav-tabs" id="nav-tab" role="tablist">
					    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Familia</button>
					    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Género</button>
					    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Floración</button>
					    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Distribución</button>
					  </div>
					</nav>
					<div class="tab-content p-3" id="nav-tabContent" style="background-color:white">
					  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
						
					  		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus, culpa, esse, magni omnis blanditiis unde vitae in nobis fuga optio numquam at ipsum impedit perspiciatis quia rem consequatur recusandae repudiandae provident nemo voluptatibus corporis ab id iste pariatur ipsam vero porro eos eaque rerum nam dolorum mollitia adipisci. Quaerat, ullam!</p>
					  	
					  </div>
					  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">...</div>
					  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">...</div>
					  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">...</div>
					</div>
		</div>

	<jsp:include page="components/mainFooter.jsp" />
	
	<link rel="stylesheet" href="js/bootstrap.min.js">
        <script defer src="./js/index.js"></script>
        <!-- <script src="js/page/trees.js"></script> -->

        <!-- BOOTSTRAP V.4 -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
            integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
            integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
            crossorigin="anonymous"></script>

        <!-- Scrollbar -->
        <script src="https://unpkg.com/simplebar@latest/dist/simplebar.js"></script>
</body>
</html>