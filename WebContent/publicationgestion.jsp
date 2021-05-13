<%@page import="entidades.*, datos.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Publicacion> listarPu = new ArrayList<Publicacion>();
	DTPublicacion dt = new DTPublicacion();
	listarPu = dt.listarPublicacion();
%>   
    <!DOCTYPE html>
    <html lang="es">

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


    </body>

    </html>
    <div class="container py-1">
        <div class="row py-5">
            <div class="col-lg-12 ml-lg-5 mx-auto mt-5">
                <div class="card rounded shadow border-0">
                    <div class="card-header">
                        <h3>Gestión Publicación</h3>
                    </div>
                    <div class="card-body bg-white rounded">
                    
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <div style="text-align:right;"><a href="formpost.jsp"><i
                                            class="fas fa-plus-square"></i>&nbsp; Nueva Publicación</div>

                                <thead>
                                    <tr>
                                        <th>Título</th>    
                                        <th>Descripción</th>
                                        <th>Fecha Publicacion</th>
                                        <th>Hipervinculo</th>
                                        <th>Imagen</th>  
                                        <th>Opciones</th>              
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Título</th>    
                                        <th>Descripción</th>
                                        <th>Fecha Publicacion</th>
                                        <th>Hipervinculo</th>
                                        <th>Imagen</th>  
                                        <th>Opciones</th>              
                                    </tr> 
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
                                        <td><img alt="ejemplo" src="<%=u.getMultimedia() %>" width="100px" height="100px"></td>
                                        <td>&nbsp;&nbsp;<a href="#"><i
                                                    class="fas fa-edit"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <a onclick="myDeletePub(<%=u.getIdPublicacion()%>)"><i class="far fa-trash-alt"></i></td>
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
    <!--termina tabla-->

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
	
	        function myDeletePub(idPublicacion)
	        {
	        	$.fn.jAlert.defaults.confirmQuestion = '¿Estás Seguro?';
	            confirm(function(e, btn){
	                e.preventDefault();
	                window.location.href = "SLEliminarPublicacion?id="+idPublicacion
	            },
	            function(e,btn){
	                e.preventDefault();
	            });
	        }
	
	    </script>
        
    </body>

    </html>