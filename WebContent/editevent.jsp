<%@page import="entidades.*, datos.*, java.util.*, java.text.*" %>
 <%
 	String id = request.getParameter("id")==null?"":request.getParameter("id");	
 
 	int idE = Integer.parseInt(id);
 
 	DTEvento dt = new DTEvento();
 	Eventos ev = dt.obtenerEvento(idE);
 
 	String fechaIn = "";
 	String fechaFin = "";
 	
 	try{
 		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
 		Date date = sdf.parse(ev.getFechaInicio());
 		Date date1 = sdf.parse(ev.getFechaFin());
 		
 		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
 		fechaIn = format.format(date);
 		fechaFin = format.format(date1);
 		
 		
 	}catch (ParseException e) {
		// TODO: handle exception
		e.printStackTrace();
	}
 	
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

    <body onload="load();" class="sb-nav-fixed" style="background: #39603D;">

        <!-- Here starts the menu-->
        <jsp:include page="components/navGestion.jsp"></jsp:include>

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
    </body>

    </html>

    <!--Formulario-->
    <div class="container py-1">
        <header class="text-center text-white">
            <script src="https://kit.fontawesome.com/a41f4b8198.js" crossorigin="anonymous"></script>
        </header>
        <div class="row py-5">
            <div class="col-lg-10 mx-auto mt-3">
                <div class="card rounded shadow border-0">

                    <div class="card-header">
                        <h2>Evento</h2>
                    </div>
                    <div class="card-body bg-white rounded">
                        <form action="SLEditarEvento" method="post">
                        	<input value="<%=ev.getIdEvento() %>" hidden="true" name="id">
                            <div class="form-group">
                                <label for="formGroupExampleInput">Nombre:</label>
                                <input value="<%=ev.getNombre() %>" name="nombre" type="text" class="form-control" id="formGroupExampleInput">
                            </div>

                            <div class="form-group">
                                <div class="form-group">
                                    <label>Descripci�n:</label>
                                    <textarea id="descripcion1" name="descripcion1" class="form-control" rows="3"></textarea>
                                    <textarea id="descripcion" name="descripcion" class="form-control" rows="3" hidden="true"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="formGroupExampleInput">Fecha Inicio:</label>
                                <input value="<%=fechaIn %>" name="fechaInicio" type="date" class="form-control" id="formGroupExampleInput">
                            </div>

                            <div class="form-group">
                                <label for="formGroupExampleInput">Fecha Final:</label>
                                <input value="<%=fechaFin %>" name="fechaFin" type="date" class="form-control" id="formGroupExampleInput">
                            </div>

                            <div class="form-group">

                                <div class="form-group">
                                    <label for="formGroupExampleInput">Tipo de Evento</label>
                                    <select name="tipoEvento" class="form-control">
                                    	<%
                                    		if(ev.getTipoEvento().equals("Agenda Privada")){
                                    		
                                    	%>
                                    		<option value="Agenda P�blica">Agenda P�blica</option>
                                        	<option value="Agenda Privada" selected>Agenda Privada</option>
                                    	<%
                                    	
                                    		}else{
                                    	%>
                                    		<option value="Agenda P�blica" selected>Agenda P�blica</option>
                                        	<option value="Agenda Privada" selected>Agenda Privada</option>
                                    	<%
                                    		}
                                    	%>
                                        
                                    </select>
                                </div>


                            </div>

                            <div class="form-group ">
                                <label for="formGroupExampleInput ">Ubicaci�n</label>
                                <input value="<%=ev.getUbicacion() %>" name="ubicacion" type="text" class="form-control " id="formGroupExampleInput ">
                            </div>

                            <div class="form-group ">
                                <label for="formGroupExampleInput ">Hipervinculo</label>
                                <input value="<%=ev.getHipervinculo() %>" name="hipervinculo" type="text" class="form-control " id="formGroupExampleInput ">
                            </div>
                            <div class="mb-3">
                                <button id="btn" type="submit" class="btn btn-primary" style="width: 100%;">Editar</button>
                            </div>
                        </form>

                        <div style="text-align: center; "><a href="eventgestion.jsp"><i
                                    class="fas fa-undo "></i>&nbsp;Volver a la tabla</div>
                    </div>
                </div>
            </div>
            <!--termina formulario-->
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
		var descripcion = "<%=ev.getDescripcion()%>";
		var desp = descripcion.replaceAll("<br>", ("\n"));
		$("#descripcion1").html(desp);
	}
	</script>
    </body>
    <script src="assets/demo/chart-bar-demo.js ">
    </script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js " crossorigin="anonymous "></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js " crossorigin="anonymous "></script>
    <script src="assets/demo/datatables-demo.js "></script>
    </body>