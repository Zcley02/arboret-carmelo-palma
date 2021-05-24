<%@page import="entidades.*, datos.*, vistas.*,java.util.*" %>
<%
		String id = request.getParameter("id")==null?"":request.getParameter("id");
		int idT = Integer.parseInt(id);
	
		DTTipo_producto dt = new DTTipo_producto();
		TipoProducto tp = dt.buscarTP(idT);
		

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

    <body onload="load();" class="sb-nav-fixed" style="background: #39603D;">

        <!-- Here starts the menu-->
        <jsp:include page="components/navGestion.jsp"></jsp:include>

    </body>

    </html>

    </html>
    <!--Form-->
    <div class="container py-1">
        <div class="row py-5">
            <div class="col-lg-10 mx-auto mt-5">
                <div class="card rounded shadow border-0">
                    <div class="card-header">
                        <h2>
                            Tipo Producto
                        </h2>
                    </div>
                    <div class="card-body bg-white rounded">
                        <form action="SLEditarTipoProducto" method="Post" role="form">
                        	<input hidden="true" value="<%=tp.getIdTipoProducto() %>" name="id">
                            <div class="form-group">
                                <label>Nombre del tipo de producto</label>
                                <input value="<%=tp.getNombreTipo() %>" name="nombre" class="form-control">

                                <div class="form-group">
                                    <label>Descripci�n:</label>
                                    <textarea id="descripcion" name="descripcion" class="form-control" rows="3" hidden="true"></textarea>
                                    <textarea id="descripcion1" name="descripcion1" class="form-control" rows="3"></textarea>
                                </div>
                            </div>
                            <div class="mb-3">
                                <button id="btn" class="btn btn-primary" style="width: 100%;">Guardar</button>
                            </div>
                            <div style="text-align:center;"><a href="typeproductgestion.jsp"><i
                                        class="fas fa-undo"></i>&nbsp;Volver a la tabla</a></div>
                        </form>
                    </div>
                </div>
            </div>
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
    <script type="text/javascript">
		$(function()
		{
			$("#btn").click(function(){
	   			textarea = $("#descripcion1").val();
	   			textarea_line = textarea.replace(new RegExp("\n","g"), "<br>");
	   			$("#descripcion").html(textarea_line);
	  			});
		});
		
		function load(){
			var descripcion = "<%=tp.getDescripcion()%>";
			var desp = descripcion.replaceAll("<br>", ("\n"));
			$("#descripcion1").html(desp);
		}
	</script>
    </body>

    </html>