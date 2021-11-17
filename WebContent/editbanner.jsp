 <%@page import="entidades.*, datos.*, java.util.*" %>
 <%
 	String id = request.getParameter("id")==null?"":request.getParameter("id");
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
		
		Opciones op = new Opciones();
		DTOpciones dtpo = new DTOpciones();
		ArrayList<Opciones> listarOp = new ArrayList<Opciones>();
		String code = "";
		
		String rol = "";
		rol = (String)session.getAttribute("rol");
		rol = rol==null?"":rol;
		
		if(loginUser.equals("") || rol.equals(""))
		{
			response.sendRedirect("login.jsp");
		}else{
			int rolUser = Integer.parseInt(rol);
			
			listarOp = dtpo.listarOpciones(rolUser);
			

			for(Opciones o: listarOp){
				if(o.getNombre().equals("Crear")){
					code+="1";
				}
				if(o.getNombre().equals("Editar")){
					code+="2";
				}
				if(o.getNombre().equals("Eliminar")){
					code+="3";
				}
			}
			
			if(!code.contains("2")){
				response.sendRedirect("management.jsp?msj=9");
			}
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
        <title>Editar Banner</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/alertify.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/default.min.css" rel="stylesheet" type="text/css"/>
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
                            Banner
                        </h2>

                    </div>
                    <div class="card-body bg-white rounded">
                     <% 	
					 	int idB = Integer.parseInt(id);
					 	
					 	DTBanner dt = new DTBanner();
					 	Banner b = dt.getBanner(idB);
					 	String file = "false";
					 	
					 %>


                        <form name="formBanner"  action="SLEditarBanner" method="Post" enctype="multipart/form-data" onsubmit="return validar_campos()">
                        	<input hidden="true" value="false" id="cambio" name="cambio">
                        	<input hidden="true" value="<%=b.getIdBanner() %>" name="id">
                        	<input hidden="true" value="<%=b.getPosicion()%>" name="posicion">
                            <div class="form-group">
                                <label>Titulo:</label>
                                <input value="<%=b.getTitulo() %>" id="titulo" name="titulo" class="form-control"  minlength="5" maxlength="30" requerid>
								<small id= "mensaje" style="color:red"></small>
                            </div>

                            <div class="form-group">
                                <label>Descripción:</label>
                                <textarea id="descripcion" name="descripcion" class="form-control" rows="3" minlength="5" maxlength="80" requerid></textarea>
                                <textarea id="descripcion1" name="descripcion1" class="form-control" rows="3" hidden minlength="5" maxlength="80" requerid></textarea>
                            	<small id= "mensaje1" style="color:red"></small>
                            </div>
                            <div class="form-group">
                                <label for="custom-file">Imagen:</label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend" >
                                        <span class="input-group-text" id="inputGroupFileAddon01">Subir</span>
                                    </div>
                                    <div class="custom-file">
                                        <input id="foto" name="foto" type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" onchange="readUrl(this);" accept="image/jpeg"> 
                                    	<label class="custom-file-label" for="inputGroupFile01">Buscar Archivo</label>
                                    </div>
                              	</div>
                                <div class="text-center">
                                	<img class="rounded img-fluid" alt="nose" src="<%=b.getFoto() %>" name="imagen" id="imagen">
                                </div>
                                
                            </div>
                            <div class="mb-3">
                                <button id="btn" type="submit" class="btn btn-primary" style="width: 100%;">Editar</button>
                            </div>
                            <div style="text-align:center;"><a href="bannergestions.jsp"><i
                                        class="fas fa-undo"></i>&nbsp;Volver a la tabla</a></div>
                        </form>
                    </div>
                </div>
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
         <script type="text/javascript">
		
    	function readUrl(input) {
			if(input.files && input.files[0]){
				var reader = new FileReader();
				
				reader.onload = function (e) {
					$('#imagen')
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
	    			textarea = $("#descripcion").val();
	    			textarea_line = textarea.replace(new RegExp("\n","g"), "<br>");
	    			$("#descripcion1").html(textarea_line);
	   			});
			});
	    	
	    	function load(){
	    		var descripcion = "<%=b.getDescripcion()%>";
				var desp = descripcion.replaceAll("<br>", ("\n"));
				$("#descripcion").html(desp);
	    	}
	    	
	    	function validar_campos(){
         		titulo = document.formBanner.titulo.value;
         		des = document.formBanner.descripcion.value;
         		
         		if (titulo.length == 0 || des.length == 0){
         			alertify.alert("Alerta", "Tiene algunos campos vacios").set('label', 'Ok');
         			
         			if (titulo.length == 0){
         				$("#mensaje").text("Campo obligatorio *");
         			}
         			if (des.length == 0){
         				$("#mensaje1").text("Campo obligatorio *");
         			}
         			return false;
         		}else{
         			return true;
         		}
	         }
	    	
	    	
		</script>
		
		<script>
        $('#titulo').on("keydown", function(e) {
	        var textLength = $('#titulo').val().replace(' ', '1').length + 1;
	        var maxValue = 30;
	        
	        console.log(e.keyCode);
	        if (textLength > maxValue) {
				if(e.keyCode != 8){
				e.preventDefault();
				}                     	
	        }

	     });
	    $('#titulo').on("keyup", function(e) {
	        var textLength = $('#titulo').val().replace(' ', '1').length;
	        var maxValue = 30;

	        $("#mensaje").text(textLength+" de "+maxValue+" carácteres permitidos");
	       
	    });
	    
        $('#descripcion').on("keydown", function(e) {
	        var textLength = $('#descripcion').val().replace(' ', '1').length + 1;
	        var maxValue = 80;
	        
	        console.log(e.keyCode);
	        if (textLength > maxValue) {
				if(e.keyCode != 8){
				e.preventDefault();
				}                     	
	        }

	     });
	    $('#descripcion').on("keyup", function(e) {
	        var textLength = $('#descripcion').val().replace(' ', '1').length;
	        var maxValue = 80;

	        $("#mensaje1").text(textLength+" de "+maxValue+" carácteres permitidos");
	       
	    });
		
		</script>