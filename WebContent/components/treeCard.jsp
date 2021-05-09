<%@page contentType="text/html" pageEncoding="UTF-8" import="entidades.*, datos.*, java.util.*"%>
<%
	ArrayList<Arbol> listarArbol = new ArrayList<Arbol>();
	DTArbol dt = new DTArbol();
	listarArbol = dt.listarArbol();

    for(Arbol u: listarArbol){
%>
    <div class="col-lg-4 mb-4">
        <div class="card border-dark rounded-3">
            <div class="figure">
                <img class="card-img-top"
                    src="<%=u.getImg()%>"
                    alt="Abies alba">
            </div>

            <div class="card-body">
                <h2 class="card-title my-2">
                     <%=u.getNombreComun()%>
                </h2>
                <h5 class="card-subtitle my-2 mb-2">
                    <%=u.getNombreCientifico()%>
                </h5>
                <p class="card-text paragraph">
                    <%=u.getDescripcion()%>
                </p>
                <div class="details">
	                <ul class="list-group list-group-flush rounded-3">
	                    <li class="list-group-item"><b>Otros nombres: </b>Abeto, abeto común, pinabete (cast.);
	                        avet
	                        (cat.);...</li>
	                    <li class="list-group-item"><b>Ecología: </b>Se cría formando bosques mixtos con hayas o
	                        pinos,...</li>
	                    <li class="list-group-item"><b>Distribución: </b>El abeto es natural de Europa y ocupa
	                        las
	                        montañas...
	                    </li>
	                    <li class="list-group-item"><b>Autóctona: </b>Sí</li>
	                </ul>
	            </div>
                <a href="" class="btn btn-outline-primary">
                    Ver más
                </a>
            </div>
            
        </div>
    </div>
<%
	}
%>