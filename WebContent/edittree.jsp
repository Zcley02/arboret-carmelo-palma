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
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Crear Árbol</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body onload="load();" class="sb-nav-fixed" style="background: #39603D;">
        <jsp:include page="components/mainMenu.jsp"></jsp:include>
        <jsp:include page="components/navBar.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container py-1">
        <div class="row py-5">
            <div class="col-lg-10 mx-auto mt-5">
                <div class="card rounded shadow border-0">

                    <div class="card-header">
                        <h2>
                            Editar árbol
                        </h2>

                    </div>
                    <div class="card-body bg-white rounded">


                        <form action="SLEditarArbol" method="Post" enctype="multipart/form-data">
                            <input hidden="true" name="id" id="id" value="<%=a.getId()%>">
                            <input hidden="true" value="false" id="cambio" name="cambio">
                            <div class="form-group">
                                <label>Nombre común:</label>
                                <input value="<%=a.getNombreComun() %>" name="nombreCo" id="nombreCo" class="form-control">

                            </div>
                            <div class="form-group">
                                <label>Nombre científico:</label>
                                <input value="<%=a.getNombreCientifico() %>" name="nombreCi" id="nombreCi" class="form-control">

                            </div>

                            <div class="form-group">
                                <label>Descripción:</label>
                                <textarea name="descripcion1" id="descripcion1" class="form-control" rows="3"></textarea>
                                <textarea name="descripcion" id="descripcion" class="form-control" rows="3" hidden="true"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Género del árbol:</label>
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
                                <label>Familia del árbol:</label>
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
                                <label>Floracion del árbol:</label>
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
                                <label>Distribución del árbol:</label>
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
                                <button id="btn" class="btn btn-primary" style="width: 100%;">Editar</button>
                            </div>
                            <div style="text-align:center;"><a href="treegestion.jsp"><i
                                        class="fas fa-undo"></i>&nbsp;Volver a la tabla</a></div>
                        </form>
                    </div>
                </div>
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
        <script src="https://code.jquery.com/jquery-3.5.1.min.js " crossorigin="anonymous "></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="js/simple-datatables-latest.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script src="plugins/jAlert/dist/jAlert.min.js"></script>
	    <script src="plugins/jAlert/dist/jAlert-functions.min.js"></script>
	    
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
	    		var descripcion = "<%=a.getDescripcion()%>";
				var desp = descripcion.replaceAll("<br>", ("\n"));
				$("#descripcion1").html(desp);
	    	}
	</script>