<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="entidades.Banner, datos.DTBanner, java.util.*"%>
    
    
    <% String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");%>

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
    <%
            	ArrayList<Banner> listBanner = new ArrayList<Banner>();
            	DTBanner dtb = new DTBanner();
            	listBanner = dtb.listarBanner();
            	
            	Banner ban = new Banner();
           	
            	int posicion = 0;
            	if(listBanner.size() == 0){
            		posicion= 1;	
            	}	
            	else{			
            		ban = listBanner.get(listBanner.size() - 1);
            		posicion = ban.getPosicion();		
            	}    
      %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Banner</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="plugins/jAlert/dist/jAlert.css">
        <link href="css/alertify.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/default.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed" style="background: #39603D;">
        <jsp:include page="components/mainMenu.jsp"></jsp:include>
        <jsp:include page="components/navBar.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4 mb-4" style="color:white">Banner</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                
                                <h3>Tabla Banner</h3>
                            </div>
                            <div class="card-body">
                                <table class="table table-bordered" id="datatablesSimple">
                                	<div style="text-align:right;"><a href="formbanner.jsp?posicion=<%=ban.getPosicion()%>"><i
                                            class="fas fa-plus-square"></i>&nbsp; Agregar banner</div>
                                <thead>
                                    <tr>
                                        <th>Título</th>
                                        <th>Descripción</th>
                                        <th>Foto</th>
                                        <th>Opciones</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                         <th>Título</th>
                                        <th>Descripción</th>
                                        <th>Foto</th>
                                        <th>Opciones</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                              			<%
                                       		for(Banner bn: listBanner){                                       		
                                       	%>
										<tr>
	                                        <td><%=bn.getTitulo() %></td>
	                                        <td><%=bn.getDescripcion()%></td>
	                                        <td><img alt="ejemplo" src="<%=bn.getFoto() %>" onClick="getValue()" width="100px" height="100px"></td>
											<td>&nbsp;&nbsp;<span title="Editar"><a href="editbanner.jsp?id=<%=bn.getIdBanner()%>"><i
                                                    class="fas fa-edit"></i></a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <span title="Eliminar"><a href="#" onclick="myDeletePub(<%=bn.getIdBanner()%>)"
                                                ><i class="far fa-trash-alt"></i></a></span></td>
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
                
                <!-- Footer -->
					<jsp:include page="components/adminFooter.jsp"></jsp:include>
				<!-- Fin Footer -->
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js " crossorigin="anonymous "></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="js/simple-datatables-latest.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script src="plugins/jAlert/dist/jAlert.min.js"></script>
	    <script src="plugins/jAlert/dist/jAlert-functions.min.js"></script>
	    <script src="js/alertify.min.js" type="text/javascript"></script>
	    
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

        })
         </script>
         <script>
   
        function myDeletePub(idBanner)
        {
        	$.fn.jAlert.defaults.confirmQuestion = '¿Estás Seguro?';
        	$.fn.jAlert.defaults.confirmBtnText = 'Si';
            confirm(function(e, btn){
                e.preventDefault();
                window.location.href = "SLEliminarBanner?id="+idBanner
            },
            function(e,btn){
                e.preventDefault();
            });
        }
    	
        $(document).ready(function ()
	    {
	        var mensaje = "";
	        mensaje = "<%=varMsj%>";
	        
	        if(mensaje == "1")
	        {
	        	alertify.success("Se guardo correctamente");
	        }
	        if(mensaje == "2")
	        {
	            errorAlert('Error', 'Revise los datos insertados');
	        }
	        if(mensaje == "5")
	        {
	            successAlert('Exito', 'Los datos han sido eliminado exitosamente');
	        }
	        if(mensaje == "6")
	        {
	            errorAlert('Error', 'Los datos estan siendo usados en otros elemento. Por favor revisar');
	        }
	       
	    });
 
	</script>