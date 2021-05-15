<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="entidades.*, datos.*, java.util.*"%>
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
    
     <% String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");%>

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
        <link rel="stylesheet" href="plugins/jAlert/dist/jAlert.css">
    </head>

    <body class="sb-nav-fixed" style="background: #39603D;">

        <!-- Here starts the menu-->
        <jsp:include page="components/navGestion.jsp"></jsp:include>
        
        <!--Table-->
    <div class="container py-1">
        <div class="row py-5">

            <div class="col-lg-10 mx-auto mt-5">
                <div class="card rounded shadow border-0">
                    <div class="card-header">
                        <h3>Servicios</h3>
                    </div>
                    <div class="card-body bg-white rounded">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <div style="text-align:right;"><a href="formservice.jsp"><i
                                            class="fas fa-plus-square"></i>&nbsp; Nuevo servicio</div>

                                <thead>
                                    <tr>
                                        <th>Nombre del servicio</th>
                                        <th>Descripción</th>
                                        <th>Foto</th>
                                        <th>Opciones</th>

                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Nombre del servicio</th>
                                        <th>Descripción</th>
                                        <th>Foto</th>
                                        <th>Opciones</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                
                                <%
									ArrayList<Servicios> listarS = new ArrayList<Servicios>();
									DTServicio dt = new DTServicio();
									listarS = dt.listarServicios();
					            	   for(Servicios s: listarS){
					             %>
										<tr>
	                                        <td><%=s.getNombre()%></td>
	                                        <td><%=s.getDescripcion()%></td>
	                                        <td><img alt="ejemplo" src="<%=s.getFoto() %>" width="100px" height="100px"></td>
											<td>&nbsp;&nbsp;<a href="#"><i
                                                    class="fas fa-edit"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="myDeletePub(<%=s.getIdServicio()%>)"
                                                ><i class="far fa-trash-alt"></i></td>
										</tr>
										
									<%
					            		}
                                	%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--table ends-->

        <script src="https://code.jquery.com/jquery-3.5.1.min.js " crossorigin="anonymous "></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js "
            crossorigin="anonymous "></script>
        <script src="js/scripts.js "></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js "
            crossorigin="anonymous "></script>
        <script src="assets/demo/chart-area-demo.js "></script>
        <script src="assets/demo/chart-bar-demo.js "></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js " crossorigin="anonymous "></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js "
            crossorigin="anonymous "></script>
        <script src="assets/demo/datatables-demo.js "></script>
        <script src="plugins/jAlert/dist/jAlert.min.js"></script>
		<script src="plugins/jAlert/dist/jAlert-functions.min.js"></script>
		
		<script>
	
	        function myDeletePub(idServicio)
	        {
	        	$.fn.jAlert.defaults.confirmQuestion = '¿Estás Seguro?';
	        	$.fn.jAlert.defaults.confirmBtnText = 'Si';
	            confirm(function(e, btn){
	                e.preventDefault();
	                window.location.href = "SLEliminarServicio?id="+idServicio
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
	        	            successAlert('Exito', 'Los datos del Servicio han sido eliminados exitosamente');
	        	        }
	        	        if(mensaje == "6")
	        	        {
	        	            errorAlert('Error', 'Los datos estan siendo usados en otros elemento. Por favor revisar');
	        	        }
	        	       
	        	    });
	
	    </script>
    </body>

    </html>