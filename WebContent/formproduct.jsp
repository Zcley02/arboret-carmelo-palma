 <%@page import="entidades.*, datos.*, java.util.*" %>
 <%
 	ArrayList<TipoProducto> listarP = new ArrayList<TipoProducto>();
 	DTTipo_producto dtd = new DTTipo_producto();
 	listarP = dtd.listarTipoP();
 
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
                            Producto
                        </h2>

                    </div>
                    <div class="card-body bg-white rounded">


                        <form  action="SLGuardarProducto" method="Post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label>Nombre:</label>
                                <input id="nombre" name="nombre" class="form-control">

                            </div>

                            <div class="form-group">
                                <label>Descripci�n:</label>
                                <textarea id="descripcion" name="descripcion" class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Precio:</label>
                                <input type="number" id="precio" name="precio" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Tipo Producto:</label>
                                <select name="tipoP" id="tipoP" class="form-control">
                                	<%
                                		for(TipoProducto tp: listarP){
                                	%>
                                    <option value="<%=tp.getIdTipoProducto()%>"><%=tp.getNombreTipo()%> </option>
                                    <%
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
                                        <input id="foto" name="foto" type="file" class="custom-file-input">
                                        <label class="custom-file-label" for="inputGroupFile01">Seleccionar el
                                            archivo</label>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary" style="width: 100%;">Guardar</button>
                            </div>
                            <div style="text-align:center;"><a href="productgestion.jsp"><i
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
    </body>
    <script src="assets/demo/chart-bar-demo.js ">
    </script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js " crossorigin="anonymous "></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js " crossorigin="anonymous "></script>
    <script src="assets/demo/datatables-demo.js "></script>
    </body>