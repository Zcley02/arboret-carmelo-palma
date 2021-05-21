<%@page import="entidades.*, datos.*" %>
<%
	String id = request.getParameter("id")==null?"":request.getParameter("id");
	int idP = Integer.parseInt(id);
	
	DTPublicacion dtp = new DTPublicacion();
	Publicacion p = dtp.buscarPublicacion(idP);
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

    <!--Form-->
    <div class="container py-1">
        <div class="row py-5">
            <div class="col-lg-10 mx-auto mt-5">
                <div class="card rounded shadow border-0">

                    <div class="card-header">
                        <h2>
                            Editar Publicacion
                        </h2>

                    </div>
                    <div class="card-body bg-white rounded">


                        <form  action="SLEditarPublicacion" method="Post" enctype="multipart/form-data">
                        	<input hidden="true" value="false" id="cambio" name="cambio">
                        	<input hidden="true" value="<%=p.getIdPublicacion() %>" name="id">
                            <div class="form-group">
                                <label>T�tulo:</label>
                                <input value="<%=p.getTitulo() %>" name="titulo" class="form-control">

                            </div>

                            <div class="form-group">
                                <label>Descripci�n:</label>
                                <textarea name="descripcion" class="form-control" rows="3"><%=p.getDescripcion() %></textarea>
                            </div>
                            <div class="form-group">
                                <label>Hipervinculo:</label>
                                <input value="<%=p.getHipervinculo() %>" name="hipervinculo" class="form-control">

                            </div>
                            <div class="form-group">
                                <label for="custom-file">Imagen:</label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Subir</span>
                                    </div>
                                    <div class="custom-file">
                                        <input name="imagen" type="file" class="custom-file-input" id="inputGroupFile01" onchange="readUrl(this);">
                                        <label class="custom-file-label" for="inputGroupFile01">Seleccionar el
                                            archivo</label>
                                    </div>
                                </div>
                                <div class="text-center">
                                	<img class="rounded img-fluid" alt="nose" src="<%=p.getMultimedia() %>" name="foto" id="foto">
                                </div>
                            </div>
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary" style="width: 100%;">Guardar</button>
                            </div>
                            <div style="text-align:center;"><a href="GestionArbol.jsp"><i
                                        class="fas fa-undo"></i>&nbsp;Volver a la tabla</a></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--ends form-->
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
		
    	function readUrl(input) {
			if(input.files && input.files[0]){
				var reader = new FileReader();
				
				reader.onload = function (e) {
					$('#foto')
						.attr('src', e.target.result);
				};
				reader.readAsDataURL(input.files[0]);
				var inputNombre = document.getElementById('cambio');
	    	    inputNombre.value = "true";
			}
		}	
	</script>
    </body>
    <script src="assets/demo/chart-bar-demo.js ">
    </script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js " crossorigin="anonymous "></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js " crossorigin="anonymous "></script>
    <script src="assets/demo/datatables-demo.js "></script>
    </body>