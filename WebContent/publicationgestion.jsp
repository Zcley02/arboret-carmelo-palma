<%@page import="entidades.*, datos.*, java.util.*"%>

<%
	ArrayList<Publicacion> listarPu = new ArrayList<Publicacion>();
	DTPublicacion dt = new DTPublicacion();
	listarPu = dt.listarPublicacion();
%>
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
<html lang="es">
<% String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");%>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Publicaci�n</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="plugins/jAlert/dist/jAlert.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed" style="background: #39603D;">
        <jsp:include page="components/mainMenu.jsp"></jsp:include>
        <jsp:include page="components/navBar.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4 mb-4" style="color:white">Publicaciones</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                
                                <h3>Tabla Publicaci�n</h3>
                            </div>
                            <div class="card-body">
                                <table class="table table-bordered" id="datatablesSimple">
                                	<div style="text-align:right;"><a href="formpost.jsp"><i
                                            class="fas fa-plus-square"></i>&nbsp; Nueva Publicaci�n</div>
                                    <thead>
                                    <tr>
                                        <th>T�tulo</th>    
                                        <th>Descripci�n</th>
                                        <th>Fecha Publicacion</th>
                                        <th>Hipervinculo</th>
                                        <th>Imagen</th>  
                                        <th>Opciones</th>              
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>T�tulo</th>    
                                        <th>Descripci�n</th>
                                        <th>Fecha Publicacion</th>
                                        <th>Hipervinculo</th>
                                        <th>Imagen</th>  
                                        <th>Opciones</th>              
                                    </tr>
                                </tfoot>
                                <tbody>
                                	<%
					            		for(Publicacion u: listarPu){
					            	%>
                                    <tr>
                                        <td><%=u.getTitulo() %></td>
                                        <td><%=u.getDescripcion() %></td>
                                        <td><%=u.getFechaPublicacion() %></td>
                                        <td><%=u.getHipervinculo() %></td>
                                        <td><img alt="ejemplo" src="<%=u.getMultimedia() %>" width="200px" height="200px" class="img-thumbnail"></td>
                                        <td>&nbsp;&nbsp;<a href="editpost.jsp?id=<%=u.getIdPublicacion()%>"><i
                                                    class="fas fa-edit"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <a href="#" onclick="myDeletePub(<%=u.getIdPublicacion()%>)"><i class="far fa-trash-alt"></i></td>
                                    </tr>
                                	<%
					            		}
                                	%>
                                
                                </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script>
         window.addEventListener('DOMContentLoaded', event => {

            // Toggle the side navigation
            const sidebarToggle = document.body.querySelector('#sidebarToggle');
            if (sidebarToggle) {
                // Uncomment Below to persist sidebar toggle between refreshes
                // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
                //     document.body.classList.toggle('sb-sidenav-toggled');
                // }
                sidebarToggle.addEventListener('click', event => {
                    event.preventDefault();
                    document.body.classList.toggle('sb-sidenav-toggled');
                    localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
                });
            }

        });
         </script>
         <script src="https://code.jquery.com/jquery-3.5.1.min.js " crossorigin="anonymous "></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="js/simple-datatables-latest.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script src="plugins/jAlert/dist/jAlert.min.js"></script>
	    <script src="plugins/jAlert/dist/jAlert-functions.min.js"></script>
	    
	    
	    <script>
	
	        function myDeletePub(idPublicacion)
	        {
	        	$.fn.jAlert.defaults.confirmQuestion = '�Est�s Seguro?';
	        	$.fn.jAlert.defaults.confirmBtnText = 'Si';
	            confirm(function(e, btn){
	                e.preventDefault();
	                window.location.href = "SLEliminarPublicacion?id="+idPublicacion
	            },
	            function(e,btn){
	                e.preventDefault();
	            });
	        }
	        
	        $(document).ready(function ()
       	    {
       	        var mensaje = "";
       	        mensaje = "<%=varMsj%>";
       	        
       	        if(mensaje == "5")
       	        {
       	            successAlert('Exito', 'Los datos han sido eliminado exitosamente');
       	        }
       	        if(mensaje == "6")
       	        {
       	            errorAlert('Error', 'No se han podido eliminar los datos correctamente');
       	        }
       	       
       	    });
	
	    </script>
    </body>
</html>
