<%@page import="entidades.*" %>
<%@page import="datos.*" %>
<%@page import="java.util.*" %>
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
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="management.jsp">Apartado Administrativo</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i
                    class="fas fa-bars"></i></button>

            <!-- Search-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Buscar" aria-label="Search"
                        aria-describedby="basic-addon2" />
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <!-- <a class="dropdown-item" href="#">Settings</a> -->
                        <a class="dropdown-item" href="password.jsp">Cambiar contrase�a</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="login.jsp">Cerrar Sesi�n</a>
                    </div>
                </li>
            </ul>
        </nav>
        <!--Stars the menu-->
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link collapsed" href="#" data-toggle="collapse"
                                data-target="#collapseLayouts5" aria-expanded="false" aria-controls="collapseLayouts5">
                                <div class="sb-nav-link-icon">
                                </div><i class="fas fa-home"></i>&nbsp; Estructura Arboreto
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts5" aria-labelledby="headingOne">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="bannergestions.jsp">Gesti�n Banner</a>
                                    <a class="nav-link" href="formstart.jsp">Gesti�n Inicio </a>
                                    <a class="nav-link" href="formfooter.jsp">Gesti�n Pie P�gina</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse"
                                data-target="#collapseLayouts3" aria-expanded="false" aria-controls="collapseLayouts3">
                                <div class="sb-nav-link-icon">
                                </div><i class="fas fa-lock"></i>&nbsp; Seguridad
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts3" aria-labelledby="headingOne">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="usergestion.jsp">Gesti�n Usuario</a>
                                </nav>
                            </div>

                            <a class="nav-link collapsed" href="#" data-toggle="collapse"
                                data-target="#collapseLayouts4" aria-expanded="false" aria-controls="collapseLayouts4">
                                <div class="sb-nav-link-icon">
                                </div><i class="fas fa-calendar"></i>&nbsp; Evento
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts4" aria-labelledby="headingOne">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="eventgestion.jsp">Gesti�n Evento</a>
                                    <a class="nav-link" href="publicagend.jsp">Agenda P�blica</a>
                                    <a class="nav-link" href="privateagend.jsp">Agenda Privada</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse"
                                data-target="#collapseLayouts6" aria-expanded="false" aria-controls="collapseLayouts6">
                                <div class="sb-nav-link-icon">
                                </div><i class="fas fa-tree"></i>&nbsp; �rbol
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts6" aria-labelledby="headingOne">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="treegestion.jsp">�rbol</a>
                                    <a class="nav-link" href="gendergestion.jsp">G�nero</a>
                                    <a class="nav-link" href="familygestion.jsp">Familia</a>
                                    <a class="nav-link" href="distributiongestion.jsp">Distribuci�n</a>
                                    <a class="nav-link" href="regiongestion.jsp">Regi�n</a>
                                    <a class="nav-link" href="countrygestion.jsp">Pa�s</a>
                                    <a class="nav-link" href="regiongestion.jsp">Floraci�n</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse"
                                data-target="#collapseLayouts2" aria-expanded="false" aria-controls="collapseLayouts2">
                                <div class="sb-nav-link-icon">
                                </div><i class="fas fa-map"></i>&nbsp; Mapa Interactivo
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts2" aria-labelledby="headingOne">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="mapgestion.jsp">Gesti�n Mapa Interactivo</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse"
                                data-target="#collapseLayouts7" aria-expanded="false" aria-controls="collapseLayouts7">
                                <div class="sb-nav-link-icon">
                                </div><i class="fas fa-store-alt"></i>&nbsp; Servicios
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts7" aria-labelledby="headingOne">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="servicegestion.jsp">Gesti�n Servicios</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse"
                                data-target="#collapseLayouts8" aria-expanded="false" aria-controls="collapseLayouts8">
                                <div class="sb-nav-link-icon">
                                </div><i class="fas fa-shopping-cart"></i>&nbsp; Productos
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts8" aria-labelledby="headingOne">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="productgestion.jsp">Gesti�n Productos</a>
                                    <a class="nav-link" href="typeproductgestion.jsp">Gesti�n Tipos de Productos</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse"
                                data-target="#collapseLayouts9" aria-expanded="false" aria-controls="collapseLayouts9">
                                <div class="sb-nav-link-icon">
                                </div><i class="fas fa-bullhorn"></i>&nbsp; Publicaci�n
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts9" aria-labelledby="headingOne">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="publicationgestion.jsp">Gesti�n Publicaciones</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <a class="nav-link collapsed text-light" href="index.jsp" data-target="#collapseLayouts9"
                            aria-expanded="false" aria-controls="collapseLayouts9">
                            <div class="sb-nav-link-icon">
                            </div><i class="fas fa-home text-light"></i>&nbsp;&nbsp; Portal ACP
                        </a>
                    </div>
                </nav>
            </div>
        </div>

        </div>
        </div>

    </body>

    </html>
    <!--Formulario-->
    <div class="container py-1">
        <div class="row py-5">
            <div class="col-lg-10 mx-auto mt-5">
                <div class="card rounded shadow border-0">

                    <div class="card-header">
                        <h2>
                            Coordenada �rbol
                        </h2>

                    </div>
                    <div class="card-body bg-white rounded">
                        <form action="SLGuardarCoord" method="Post">
                           
                            
                            <%
	                            DTArbol dtp = new DTArbol();
								ArrayList<Arbol> listaArbol = new ArrayList<Arbol>();
	
								listaArbol = dtp.listarArbol();
                            %>
                            <div class="form-group">
                                <label>Arbol:</label>
                                <select name="cmbArbol" class="form-control">
                                
                                <%for (Arbol r : listaArbol) { %>
                                    <option value=" <%= r.getId() %> "><%= r.getNombreComun()%></option>
                                <% } %>
                                </select>
                            </div>
                            
                            <div class="form-group">
                            	<label>Latitud: </label>
                            	<input type="text" name="txtLat" class="form-control">
                            </div>
                                <div class="form-group">
                            	<label>Longitud: </label>
                            	<input type="text" name="txtLon" class="form-control">
                            </div>
                               

                            <div class="mb-3">
                                <button class="btn btn-primary" style="width: 100%;">Guardar</button>
                            </div>
                            <div style="text-align:center;"><a href="usergestion.jsp"><i
                                        class="fas fa-undo"></i>&nbsp;Volver a la tabla</a></div>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--termona formulario-->
    </div>


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