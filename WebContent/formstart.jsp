<%@page import = "entidades.*, datos.*, java.util.*;"%>
<%
    //Limpia la CACHE del navegador
	    response.setHeader("Pragma", "no-cache");
	    response.setHeader("Cache-Control", "no-store");
	    response.setDateHeader("Expires", 0);
	    response.setDateHeader("Expires", -1);
	      
		
		String loginUser = "";
		loginUser = (String)session.getAttribute("login");
		loginUser = loginUser==null?"":loginUser;
		
		if(loginUser.equals(""))
		{
			response.sendRedirect("login.jsp");
		}
    %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Arboreto Carmelo Palma</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
            crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
            crossorigin="anonymous"></script>

        <link rel="stylesheet" href="css/styles.css">
    </head>

    <body class="sb-nav-fixed" style="background: #39603D;">

        <!-- Here starts the menu-->
        <jsp:include page="components/navGestion.jsp"></jsp:include>


    </body>

    </html>
    
    <%
			Inicio in = new Inicio();
			DTInicio dt = new DTInicio();
			
			in = dt.llenarInicio();
		%>

        <!-- Summary -->
        

    <!--Form-->
    <div class="container py-1">
        <header class="text-center text-white">
            <script src="https://kit.fontawesome.com/a41f4b8198.js" crossorigin="anonymous"></script>
        </header>
        
        <div class="row py-5">
            <div class="col-lg-10 mx-auto mt-5">
                <div class="card rounded shadow border-0">
					<div class="container mb-5">
            <h1 class="my-4">Nuestra historia</h1>
            <hr class="bg-dark w-25 ml-0">
            <div class="row">
                <div class="col-md-5 mt-7">
                    <img class="img-fluid rounded-3"
                        src="<%=in.getFotoHistoria() %>"
                        alt="trees">
                </div>
                <div class="col-md-7">
                    <h2 class="my-3">Historia</h2>
                    <p class="paragraph"><%=in.getHistoria() %></p>
                </div>
            </div>
        </div>
        <!-- End of Summary -->

        <!-- Mision -->
        <div class="container mb-5">
            <h1 class="my-4">Misión</h1>
            <hr class="bg-dark w-25 ml-0">
            <div class="row">
                <div class="col-md-7">
                    <p class="paragraph">
                        <%=in.getMision() %>
                    </p>
                </div>
                <div class="col-md-5">
                    <img class="img-fluid rounded-3"
                        src="<%=in.getFotoMision() %>"
                        alt="">
                </div>
            </div>
        </div>
        
        <div class="container mb-5">
            <h1 class="my-4">Visión</h1>
            <hr class="bg-dark w-25 ml-0">
            <div class="row">
                <div class="col-md-5 mt-7">
                    <img class="img-fluid rounded-3"
                        src="<%=in.getFotoVision() %>"
                        alt="Card image cap">
                </div>
                <div class="col-md-7">
                    <p class="paragraph">
                        <%=in.getVision() %>
                    </p>
                </div>
            </div>
            
    </div>
    <div class="mb-3">
                <a href="edithistory.jsp" type="button" class="btn btn-primary" style="width: 33%;">Editar Historia</a>
                <a href="editmision.jsp" type="button" class="btn btn-primary" style="width: 33%;">Editar Misión</a>
                <a href="editvision.jsp" type="button" class="btn btn-primary" style="width: 33%;">Editar Visión</a>
            </div>
    </div>




    <script src="https://code.jquery.com/jquery-3.5.1.min.js " crossorigin="anonymous "></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js "
        crossorigin="anonymous "></script>
    <script src="js/scripts.js "></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js " crossorigin="anonymous "></script>
    <script src="assets/demo/chart-area-demo.js "></script>
    <script src="assets/demo/chart-bar-demo.js "></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js " crossorigin="anonymous "></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js " crossorigin="anonymous "></script>
    <script src="assets/demo/datatables-demo.js "></script>
    </body>
    <script src="assets/demo/chart-bar-demo.js ">
    </script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js " crossorigin="anonymous "></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js " crossorigin="anonymous "></script>
    <script src="assets/demo/datatables-demo.js "></script>
    </body>