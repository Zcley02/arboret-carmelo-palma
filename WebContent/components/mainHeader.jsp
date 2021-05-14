<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!-- Navbar -->
    <nav id="navbar" class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">Arboreto Carmelo Palma</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="posts.jsp">Publicaciones</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="trees.jsp">Árboles</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="events.jsp">Eventos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="map.jsp">Mapa</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="services.jsp">Servicios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="products.jsp">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">Contactos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp"><i class="fas fa-user-circle"></i></a>
                    </li>
                    <div class="hidden">
                        <form class="d-flex">
                            <input class="form-control me-2 d-none" id="inputSearch1" type="search" placeholder="Buscar"
                                aria-label="Search">
                            <button class="btn btn-outline-light" id="btnSearch" type="submit"><i
                                    class="fas fa-search"></i></button>
                        </form>
                    </div>

            </div>
        </div>
    </nav>
    <!-- End of Navbar -->