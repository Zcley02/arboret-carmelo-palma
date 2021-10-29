<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contacto - Arboreto Carmelo Palma</title>

        <!--CSS boostrap-->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/styles2.css">
        <link rel="stylesheet" href="css/styles.css">

        <!--font awesome-->
        <script src="https://kit.fontawesome.com/78a455df4c.js" crossorigin="anonymous"></script>

        <!-- Scrollbar -->
        <link rel="stylesheet" href="https://unpkg.com/simplebar@latest/dist/simplebar.css">
    </head>

    <body data-simplebar>
        <jsp:include page="components/mainHeader.jsp" />


        <!-- Contact -->
        <div class="container">
            <!-- Header -->
            <h1 class="my-4">
                Contacto
                <div class="float-end">
                    <img src="https://image.ibb.co/kUASdV/contact-image.png" alt="image" />
                </div>
            </h1>

            <hr class="bg-dark">
            <!-- End of Header -->

            <div class="container contact">
            <form class = "Contacto"  method="post" action="./SLEnviarCorreoContact"> 

                <div class="col-md-12">
                    <div class="contact-form">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="fname">Nombres:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="nombre" placeholder="" name="nombre" minlength="3" maxlength="80" requerid>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="lname">Apellidos:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="apellido" placeholder="" name="apellido" minlength="3" maxlength="80" requerid>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Correo:</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="correo" placeholder="ejemplo@gmail.com" name="correo" minlength="3" maxlength="100" requerid>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="Descripción">Mensaje:</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" id="mensaje" name="mensaje" minlength="3" maxlength="500" requerid></textarea>
                            </div>
                        </div>
                        <div class="form-group"><br>
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary">Enviar</button>
                            </div>
                        </div>
                    </div>
                </div>
               </form>
            </div>
        </div>
        <!-- End of Contact -->

        <jsp:include page="components/mainFooter.jsp" />

        <!-- Javascript -->
        <link rel="stylesheet" href="js/bootstrap.min.js">
        <script defer src="./js/index.js"></script>

        <!-- BOOTSTRAP V.4 -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
            integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
            integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
            crossorigin="anonymous"></script>

        <!-- Scrollbar -->
        <script src="https://unpkg.com/simplebar@latest/dist/simplebar.js"></script>
    </body>


    </html>