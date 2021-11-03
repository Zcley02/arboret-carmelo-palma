<%@page contentType="text/html" pageEncoding="UTF-8" import= "java.util.*;"%>
<% String varMsj = request.getParameter("msj")==null?"":request.getParameter("msj");%>
    <%
    Calendar cal=Calendar.getInstance();
    int year=cal.get(Calendar.YEAR);
    %>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setDateHeader("Expires", -1);
%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Iniciar sesión</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/alertify.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/default.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
            crossorigin="anonymous"></script>
    </head>

	<%
		//DESTRUYE LA SESIÓN
		HttpSession hts = request.getSession(false);
		hts.removeAttribute("login");
		hts.invalidate();
	%>

    <body class="">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header">
                                        <h3 class="text-center font-weight-light my-4">Iniciar sesión</h3>
                                    </div>
                                    <div class="card-body">
                                        <form action="SL_login" method="post">
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputEmailAddress">Usuario:</label>
                                                <input name="usuario" class="form-control py-4" id="inputEmailAddress" type="text"
                                                    placeholder="Ingresar usuario" required/>
                                            </div>
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputPassword">Contraseña</label>
                                                <input name="password" class="form-control py-4" id="inputPassword" type="password"
                                                    placeholder="Ingresar contraseña" required />
                                            </div>
<!-- 										<div class="form-group">
                                                <div class="custom-control custom-checkbox">
                                                    <input class="custom-control-input" id="rememberPasswordCheck"
                                                        type="checkbox" />
                                                    <label class="custom-control-label"
                                                        for="rememberPasswordCheck">Recordar
                                                        contraseña</label>
                                                </div>
                                            </div> -->
                                            <div
                                                class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small text-dark" href="password.jsp">¿Olvidaste tu
                                                    contraseña?</a>
                                                <input type="submit" class="btn btn-outline-success" value="Iniciar Sesión" />
                                              
                                            </div>&nbsp;
                                            <div style="text-align:center;"><a href="index.jsp"><i
                                        		class="fas fa-undo"></i>&nbsp;Regresar</a></div>
                                        </form>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </main>
                
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted ">Copyright &copy; Arboreto Carmelo Palma <%=year %></div>
                            <div>
                                <a class="text-dark" href="#">Privacidad</a> &middot;
                                <a class="text-dark" href="#">Terminos &amp; Condiciones</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="js/alertify.min.js" type="text/javascript"></script>
        
        <script type="text/javascript">
	        $(document).ready(function ()
	        	    {
	        	        var mensaje = "";
	        	        mensaje = "<%=varMsj%>";
	        	        
	        	        if(mensaje == "2")
	        	        {
	        	            alertify.error('Los datos de Usuario son incorrectos');
	        	        }
	        	        if(mensaje == "error")
	        	        {
	        	            alertify.alert('Alerta','Ha ocurrido un error. Intente nuevamente.');
	        	        }
        </script>
    </body>

    </html>