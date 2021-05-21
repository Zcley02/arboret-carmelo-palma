<%@page import="entidades.*, datos.*, vistas.*,java.util.*" %>
<%
	ArrayList<Genero> listarG = new ArrayList<Genero>();
	DTGenero dtg = new DTGenero();
	listarG = dtg.listarGenero();
	
	ArrayList<Familiar> listarFa = new ArrayList<Familiar>();
	DTFamilia dt = new DTFamilia();
	listarFa = dt.listarFamilia();
	
	ArrayList<Distribucion> listarD = new ArrayList<Distribucion>();
	DTDistribucion dtd = new DTDistribucion();
	listarD = dtd.listarDistribucion();
	
	ArrayList<Flor> listarFl = new ArrayList<Flor>();
	DTFlor dtf = new DTFlor();
	listarFl = dtf.listarFlor();
	
	String id = request.getParameter("id")==null?"":request.getParameter("id");
	int idT = Integer.parseInt(id);
	
	DTArbol dtt = new DTArbol();
	Arbol a = dtt.buscarArbol(idT);
	
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
                            Editar �rbol
                        </h2>

                    </div>
                    <div class="card-body bg-white rounded">


                        <form action="SLEditarArbol" method="Post" enctype="multipart/form-data">
                            <input hidden="true" name="id" id="id" value="<%=a.getId()%>">
                            <input hidden="true" value="false" id="cambio" name="cambio">
                            <div class="form-group">
                                <label>Nombre com�n:</label>
                                <input value="<%=a.getNombreComun() %>" name="nombreCo" id="nombreCo" class="form-control">

                            </div>
                            <div class="form-group">
                                <label>Nombre cient�fico:</label>
                                <input value="<%=a.getNombreCientifico() %>" name="nombreCi" id="nombreCi" class="form-control">

                            </div>

                            <div class="form-group">
                                <label>Descripci�n:</label>
                                <textarea name="descripcion" id="descripcion" class="form-control" rows="3"><%=a.getDescripcion() %></textarea>
                            </div>
                            <div class="form-group">
                                <label>G�nero del �rbol:</label>
                                <select name="genero" id="genero" class="form-control">
                                	<%
                                		for(Genero g: listarG){
                                			if(a.getIdGenero()==g.getIdGenero()){
                                	%>
                                    			<option selected="true" value="<%=g.getIdGenero()%>"><%=g.getNombre() %></option>
                                    	<%
                                			}else{
                                    	%>
                                    			<option value="<%=g.getIdGenero()%>"><%=g.getNombre() %></option>
                                   	<%
                                			}
                                		}
                                   	%>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Familia del �rbol:</label>
                                <select name="familia" id="familia" class="form-control">
                                	<%
                                		for(Familiar f: listarFa){
                                			if(a.getIdFamilia()==f.getIdFamilia()){
                                	%>
                                    			<option selected="true" value="<%=f.getIdFamilia()%>"><%=f.getNombre() %></option>
                                    	<%
                                			}else{
                                    	%>
                                    			<option value="<%=f.getIdFamilia()%>"><%=f.getNombre() %></option>
                                    <%
                                			}
                                		}
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Floracion del �rbol:</label>
                                <select name="flor" id="flor" class="form-control">
                                	<%
                                		for(Flor fl: listarFl){
                                			if(a.getIdFlor()==fl.getIdFlor()){
                                	%>
                                    			<option selected="true" value="<%=fl.getIdFlor()%>"><%=fl.getNombreComun() %> : <%=fl.getTemporadaFloracion() %> </option>
                                    	<%
                                			}else{
                                    	%>
                                    			<option value="<%=fl.getIdFlor()%>"><%=fl.getNombreComun() %> : <%=fl.getTemporadaFloracion() %> </option>
                                    <%
                                			}
                                		}
                                	%>
                                </select>
                            </div>


                            <div class="form-group">
                                <label>Distribuci�n del �rbol:</label>
                                <select name="distribucion" id="distribucion" class="form-control">
                                	<%
                                		for(Distribucion d: listarD){
                                			if(a.getIdDistribucion()==d.getIdDistribucion()){
                                	%>
                                				<option selected="true" value="<%=d.getIdDistribucion()%>"><%=d.getNombre() %></option>
                                		<%
                                			}else{
                                    	%>
                                    			<option value="<%=d.getIdDistribucion()%>"><%=d.getNombre() %></option>
                                    <%
                                			}
                                		}
                                    %>
                                </select>
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
                                	<img class="rounded img-fluid" alt="nose" src="<%=a.getImg() %>" name="foto" id="foto">
                                </div>
                            </div>
                            <div class="mb-3">
                                <button class="btn btn-primary" style="width: 100%;">Editar</button>
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