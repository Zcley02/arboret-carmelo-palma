
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
               	String pos = "";
				pos = request.getParameter("posicion")==null?"0":request.getParameter("posicion");                           															
    %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Crear Banner</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body onload="load();" class="sb-nav-fixed" style="background: #39603D;">
        <jsp:include page="components/mainMenu.jsp"></jsp:include>
        <jsp:include page="components/navBar.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                	<div class="container">
        <header class="text-center text-white">
            <script src="https://kit.fontawesome.com/a41f4b8198.js" crossorigin="anonymous"></script>
        </header>
        <div class="row py-3">
            <div class="col-lg-10 mx-auto mt-5">
                <div class="card rounded shadow border-0">

                    <div class="card-header">
                        <h3 class="card-title text-left">Banner</h3>
                    </div>
                    <div class="card-body">
                        <form action="SLGuardarBanner" method="Post" enctype="multipart/form-data">
                        <input name="posicion"  type = "hidden" value="<%=pos%>" />
                             <div class="mb-3">
                                <label class="form-label fw-bolder">T�tulo:</label>
                                <input id="nombre" name="txtTitulo" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bolder">Descripci�n:</label>
                                <textarea id="descripcion" name="txtDescripcion" rows="4" class="form-control" hidden="trues"></textarea>
                                <textarea id="descripcion1" name="txtDescripcion1" rows="4" class="form-control"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="custom-file">Imagen:</label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Subir</span>
                                    </div>
                                    <div class="custom-file">
                                        <input name="foto" type="file" class="custom-file-input" id="inputGroupFile01" onchange="readUrl(this);">
                                        <label class="custom-file-label" for="inputGroupFile01">Seleccionar el
                                            archivo</label>
                                    </div>
                                </div>
                                <div class="text-center">
                                	<img class="rounded img-fluid" alt="Seleccione la imagen" src="" name="imagen" id="imagen" onchange="readUrl(this);">
                                </div>
                            </div>
                            <div class="mb-3">
                                <button id="btn" class="btn btn-primary" style="width: 100%;">Guardar</button>
                            </div>
                            <div style="text-align:center;"><a href="bannergestions.jsp"><i
                                        class="fas fa-undo"></i>&nbsp;Volver a la tabla</a></div>
                        </form>
                    </div>

                </div>
            </div>
            <!--Ends form-->
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
	$(function()
			{
				$("#btn").click(function(){
	    			textarea = $("#descripcion1").val();
	    			textarea_line = textarea.replace(new RegExp("\n","g"), "<br>");
	    			$("#descripcion").html(textarea_line);
	   			});
			});
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
			}
		}	
	</script>