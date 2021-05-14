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


    </body>

    </html>

    <!--Form-->
    <div class="container py-1">
        <header class="text-center text-white">
            <script src="https://kit.fontawesome.com/a41f4b8198.js" crossorigin="anonymous"></script>
        </header>
        <div class="row py-5">
            <div class="col-lg-10 mx-auto mt-5">
                <div class="card rounded shadow border-0">

                    <div class="card-header">
                        <h2 class="card-title text-center">Inicio</h2>
                    </div>
                    <div class="card-body">
                        <form action="SLGuardarInicio" method="Post" enctype="multipart/form-data">
                            <h3>Historia</h3>
                            <hr class="bg-dark w-auto">
                            <div class="form-group">
                                <label for="custom-file">Imagen:</label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Subir</span>
                                    </div>
                                    <div class="custom-file">
                                        <input name="hFoto" type="file" class="custom-file-input" id="inputGroupFile01">
                                        <label class="custom-file-label" for="inputGroupFile01">Seleccionar el
                                            archivo</label>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="nombreCP" class="form-label fw-bolder">Descripción:</label>
                                <textarea name="historia" id="descripciónCP" rows="4" class="form-control"></textarea>
                            </div>
                            <h3>Misión</h3>
                            <hr class="bg-dark w-auto">
                            <div class="form-group">
                                <label for="custom-file">Imagen:</label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Subir</span>
                                    </div>
                                    <div class="custom-file">
                                        <input name="mFoto" type="file" class="custom-file-input" id="inputGroupFile02">
                                        <label class="custom-file-label" for="inputGroupFile02">Seleccionar el
                                            archivo</label>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="nombreCP" class="form-label fw-bolder">Descripción:</label>
                                <textarea name="mision" id="descripciónCP" rows="4" class="form-control"></textarea>
                            </div>

                            <h3>Visión</h3>
                            <hr class="bg-dark w-auto">
                            <div class="form-group">
                                <label for="custom-file">Imagen:</label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Subir</span>
                                    </div>
                                    <div class="custom-file">
                                        <input name="vFoto" type="file" class="custom-file-input" id="inputGroupFile03">
                                        <label class="custom-file-label" for="inputGroupFile03">Seleccionar el
                                            archivo</label>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="nombreCP" class="form-label fw-bolder">Descripción:</label>
                                <textarea name="vision" id="descripciónCP" rows="4" class="form-control"></textarea>
                            </div>
                            <div class="mb-3">
                                <button class="btn btn-primary" style="width: 49%;">Guardar</button>
                                <button class="btn btn-primary" style="width: 48%;">Previsualizar</button>
                            </div>
                        </form>
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
    </body>
    <script src="assets/demo/chart-bar-demo.js ">
    </script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js " crossorigin="anonymous "></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js " crossorigin="anonymous "></script>
    <script src="assets/demo/datatables-demo.js "></script>
    </body>