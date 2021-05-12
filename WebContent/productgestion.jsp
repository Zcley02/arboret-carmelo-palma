<%@page contentType="text/html" pageEncoding="UTF-8" import="entidades.*, datos.*, java.util.*" %>
<%
	ArrayList<Producto> listarPr = new ArrayList<Producto>();
	DTProducto dtp = new DTProducto();
	listarPr = dtp.listarProducto();
%>
    <!DOCTYPE html>
    <html lang="en">

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

		<!--Formulario-->
    <div class="container py-1">
       
        <div class="row py-5">
            <div class="col-lg-12 mx-auto mt-5">
                <div class="card rounded shadow border-0">
                    <div class="card-header">
                        <h3>Gestión de eventos</h3>
                    </div>
                    <div class="card-body bg-white rounded">
                        <div style="text-align: right;"><a href="formproduct.jsp"><i class="fas fa-plus-square"></i>&nbsp;
                                Nuevo Producto</a>
                        </div>
                        <div class="table-responsive">
                            <table id="example" style="width:100%" class="table table-striped table-bordered">

                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Descripción</th>
                                                <th>Tipo Producto</th>
                                                <th>Precio</th>
                                                <th>Imagen</th>
                                                <th>Opciones</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Descripción</th>
                                                <th>Tipo Producto</th>
                                                <th>Precio</th>
                                                <th>Imagen</th>
                                                <th>Opciones</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        	<%
                                        		for(Producto p: listarPr){
                                        	%>
                                            <tr>
                                                <td><%=p.getNombre() %></td>
                                                <td><%=p.getDescripcion() %></td>
                                                <td><%=p.getIdProducto() %></td>
                                                <td>C$<%=p.getPrecio() %></td>
                                                <td><img src="<%=p.getFoto() %>" width="100px" height="100px"></td>
                                                <td>
                                                    <a href="#"><i class="fas fa-edit"></i></a>
                                                    <a href="#"><i class="far fa-trash-alt"></i></a>
                                                </td>
                                            </tr>
                                         	<%
                                        		}
                                         	%>
                                        </tbody>
                                    </table>
                                </div>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--termona formulario-->
    </div>


    </div>
    </div>

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