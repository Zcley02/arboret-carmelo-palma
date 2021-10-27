<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        	<div class="sb-sidenav-menu-heading">Arboreto Carmelo Palma</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseGestion" aria-expanded="false" aria-controls="collapseGestion">
                                <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                                Estructura Arboreto
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseGestion" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="bannergestions.jsp">Gesti�n Banner</a>
                                    <a class="nav-link" href="formstart.jsp">Gesti�n Inicio </a>
                                    <a class="nav-link" href="formfooter.jsp">Gesti�n Pie P�gina</a>
                                </nav>
                            </div>
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUsuario" aria-expanded="false" aria-controls="collapseUsuario">
                                <div class="sb-nav-link-icon"><i class="fas fa-lock"></i></div>
                                Seguridad
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseUsuario" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="usergestion.jsp">Gesti�n Usuario</a>
                                </nav>
                            </div>

                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEve" aria-expanded="false" aria-controls="collapseEve">
                                <div class="sb-nav-link-icon"><i class="fas fa-calendar"></i></div>
                                Eventos
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseEve" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="eventgestion.jsp">Gesti�n Evento</a>
                                    <a class="nav-link" href="publicagend.jsp">Agenda P�blica</a>
                                    <a class="nav-link" href="privateagend.jsp">Agenda Privada</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTree" aria-expanded="false" aria-controls="collapseTree">
                                <div class="sb-nav-link-icon"><i class="fas fa-tree"></i></div>
                               	�rbol
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseTree" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="treegestion.jsp">�rbol</a>
                                    <a class="nav-link" href="gendergestion.jsp">G�nero</a>
                                    <a class="nav-link" href="familygestion.jsp">Familia</a>
                                    <a class="nav-link" href="distributiongestion.jsp">Distribuci�n</a>
                                    <a class="nav-link" href="regiongestion.jsp">Regi�n</a>
                                    <a class="nav-link" href="countrygestion.jsp">Pa�s</a>
                                    <a class="nav-link" href="flowergestion.jsp">Floraci�n</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseMap" aria-expanded="false" aria-controls="collapseMap">
                                <div class="sb-nav-link-icon"><i class="fas fa-map"></i></div>
                                Mapa Interactivo
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseMap" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="mapgestion.jsp">Gesti�n Mapa Interactivo</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseSer" aria-expanded="false" aria-controls="collapseSer">
                                <div class="sb-nav-link-icon"><i class="fas fa-store-alt"></i></div>
                                Servicio
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseSer" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="servicegestion.jsp">Gesti�n Servicios</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePro" aria-expanded="false" aria-controls="collapsePro">
                                <div class="sb-nav-link-icon"><i class="fas fa-shopping-cart"></i></div>
                                Productos
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePro" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="productgestion.jsp">Gesti�n Productos</a>
                                    <a class="nav-link" href="typeproductgestion.jsp">Gesti�n Tipos de Productos</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePubli" aria-expanded="false" aria-controls="collapsePubli">
                                <div class="sb-nav-link-icon"><i class="fas fa-bullhorn"></i></div>
                                Publicaciones
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePubli" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="publicationgestion.jsp">Gesti�n Publicaciones</a>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <a class="nav-link collapsed text-light" href="index.jsp" data-target="#collapseLayouts9"
                            aria-expanded="false" aria-controls="collapseLayouts9">
                            <div class="sb-nav-link-icon">
                            </div><i class="fas fa-home text-light"></i>&nbsp;&nbsp; Portal ACP
                        </a>
                    </div>
                </nav>
            </div>