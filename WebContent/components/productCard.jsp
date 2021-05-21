<%@page contentType="text/html" pageEncoding="UTF-8" import="entidades.*, datos.*, java.util.*"%>
<%
	ArrayList<Producto> listarPro = new ArrayList<Producto>();
	DTProducto dt = new DTProducto();
	listarPro = dt.listarProducto();
	
	for(Producto u: listarPro){
%>
    <div class="col-lg-4 mb-4">
        <div class="card border-dark rounded-3">
            <div class="figure">
                <img class="card-img-top"
                    src="<%=u.getFoto() %>"
                    alt="">
            </div>
            <div class="card-body">
                <h2 class="card-title my-2">
                    <%=u.getNombre() %>
                </h2>
                <p class="card-text paragraph">
                    <%=u.getDescripcion() %>
                </p>
                <a href="./contact.jsp" class="btn btn-outline-primary">
                    Contactar
                </a>
                <div class="price-wrap h5 my-4">
                    <span class="price-new">C$100.00</span>
                </div>
            </div>

        </div>
    </div>
    
<%
	}
%>