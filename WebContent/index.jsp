<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Página de inicio - Arboreto Carmelo Palma</title>

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
		
        <!-- Banner -->
        <div id="mycarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#mycarousel" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#mycarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#mycarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/1.jpg" class="d-block w-100 h-50" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="img/2.jpg" class="d-block w-100 h-50" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="img/3.jpg" class="d-block w-100 h-50" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev " type="button" data-bs-target="#mycarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="false"></span>
                <span class="visually-hidden">Anterior</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#mycarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon position" aria-hidden="false"></span>
                <span class="visually-hidden">Siguiente</span>
            </button>
        </div>
        <!-- End of Banner -->

        <!-- Summary -->
        <div class="container">
            <h1 class="my-4">Nuestra historia</h1>
            <hr class="bg-dark w-25 ml-0">
            <div class="row">
                <div class="col-md-8 border-success">
                    <img class="img-fluid rounded-3"
                        src="https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80"
                        alt="trees">
                </div>
                <div class="col-md-4">
                    <h2 class="my-3">Title</h2>
                    <p class="paragraph">Lorem ipsum dolor sit amet consectetur adipisicing elit.
                        Unde sapiente incidunt quisquam perspiciatis animi velit amet omnis dolores
                        eius excepturi, obcaecati et quis quod, quos maxime eveniet qui laborum porro.</p>
                    <h2 class="my-3">Subtitle</h2>
                    <ul>
                        <li>Lorem Ipsum</li>
                        <li>Dolor Sit Amet</li>
                        <li>Consectetur</li>
                        <li>Adipiscing Elit</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- End of Summary -->

        <!-- Mision -->
        <div class="container mb-5">
            <h1 class="my-4">Misión</h1>
            <hr class="bg-dark w-25 ml-0">
            <div class="row">
                <div class="col-md-7">
                    <p class="paragraph">
                        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Obcaecati tempora consequuntur
                        magnam ipsum id quo voluptatem vitae. Animi temporibus fugit quod laborum assumenda aliquid,
                        itaque doloribus dicta nam cum explicabo!
                    </p>
                    <p class="paragraph">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis architecto ab magnam dolorum.
                        Expedita suscipit labore quisquam tempora doloribus, blanditiis nobis maiores iusto harum
                        tenetur
                        eius ex a asperiores laboriosam? Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                        Illo
                        sed
                        qui maiores officia unde? Repellat tenetur hic inventore molestiae? Vel sint neque enim
                        quasi
                        dolorum
                        maxime tempora alias aspernatur adipisci. Lorem ipsum dolor sit, amet consectetur
                        adipisicing
                        elit.
                        Atque, necessitatibus! Ducimus a sit consequuntur? Dolor optio rerum voluptatum sapiente,
                        quia,
                        adipisci
                        ut hic, dolorem quos suscipit architecto consectetur laborum ducimus.
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis architecto ab magnam dolorum.
                        Expedita suscipit labore quisquam tempora doloribus, blanditiis nobis maiores iusto harum
                        tenetur
                        eius ex a asperiores laboriosam? Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                    </p>
                    <ul class="list-unstyled pl-2">
                        <li><i class="fa fa-check"></i> Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                        </li>
                        <li><i class="fa fa-check"></i> Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                        </li>
                        <li><i class="fa fa-check"></i> Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                        </li>
                        <li><i class="fa fa-check"></i> Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                        </li>
                        <li><i class="fa fa-check"></i> Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                        </li>
                    </ul>
                </div>
                <div class="col-md-5">
                    <img class="img-fluid rounded-3"
                        src="https://images.unsplash.com/photo-1598100931767-979cdc7b0175?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80"
                        alt="">
                </div>
            </div>
        </div>
        <!-- End of Mision -->

        <!-- Vision -->
        <div class="container mb-5">
            <h1 class="my-4">Visión</h1>
            <hr class="bg-dark w-25 ml-0">
            <div class="row">
                <div class="col-md-5 mt-7">
                    <img class="img-fluid rounded-3"
                        src="https://images.unsplash.com/photo-1598100931767-979cdc7b0175?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80"
                        alt="Card image cap">
                </div>
                <div class="col-md-7">
                    <p class="paragraph">
                        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Obcaecati tempora consequuntur
                        magnam ipsum id quo voluptatem vitae. Animi temporibus fugit quod laborum assumenda aliquid,
                        itaque doloribus dicta nam cum explicabo!
                    </p>
                    <p class="paragraph">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis architecto ab magnam dolorum.
                        Expedita suscipit labore quisquam tempora doloribus, blanditiis nobis maiores iusto harum
                        tenetur
                        eius ex a asperiores laboriosam? Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                        Illo
                        sed
                        qui maiores officia unde? Repellat tenetur hic inventore molestiae? Vel sint neque enim
                        quasi
                        dolorum
                        maxime tempora alias aspernatur adipisci. Lorem ipsum dolor sit, amet consectetur
                        adipisicing
                        elit.
                        Atque, necessitatibus! Ducimus a sit consequuntur? Dolor optio rerum voluptatum sapiente,
                        quia,
                        adipisci
                        ut hic, dolorem quos suscipit architecto consectetur laborum ducimus.
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis architecto ab magnam dolorum.
                        Expedita suscipit labore quisquam tempora doloribus, blanditiis nobis maiores iusto harum
                        tenetur
                        eius ex a asperiores laboriosam? Lorem ipsum, dolor sit amet consectetur adipisicing elit.
                    </p>
                </div>
            </div>
        </div>
        <!-- End of Vision -->

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