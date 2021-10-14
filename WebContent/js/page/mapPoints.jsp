<%@page import="java.util.*, vistas.Vista_coordenada_arbol, datos.DTVista_coordenada_arbol" %>
<%
	ArrayList<Vista_coordenada_arbol> listaCA = new ArrayList<Vista_coordenada_arbol>();
	DTVista_coordenada_arbol dt = new DTVista_coordenada_arbol();
	listaCA = dt.listarCA();
	
%>

<script>
	let html = `
	<div class="card border-dark rounded-3">
	<div class="figure">
	    <img class="card-img-top"
	        src="https://images.unsplash.com/photo-1586378904433-32718f1c475b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw=&amp;ixlib=rb-1.2.1&amp;auto=format&amp;fit=crop&amp;w=1000&amp;q=80"
	        alt="Abies alba">
	</div>

	<div class="card-body">
	    <h2 class="card-title my-2">
	        Abies alba
	    </h2>
	    <h5 class="card-subtitle my-2 mb-2">
	        Abeto, pinabete
	    </h5>
	    <p class="card-text paragraph">
	        Gran árbol robusto de corteza blanquecina y porte piramidal, que puede llegar
	        excepcionalmente a los...
	    </p>
	    <a href="" class="btn btn-outline-primary">
	        Ver más
	    </a>
	</div>
	<div>
	    <ul class="list-group list-group-flush rounded-3">
	        <li class="list-group-item"><b>Otros nombres: </b>Abeto, abeto común, pinabete (cast.); avet
	            (cat.);...</li>
	        <li class="list-group-item"><b>Ecología: </b>Se cría formando bosques mixtos con hayas o
	            pinos,...</li>
	        <li class="list-group-item"><b>Distribución: </b>El abeto es natural de Europa y ocupa las
	            montañas...
	        </li>
	        <li class="list-group-item"><b>Autóctona: </b>Sí</li>
	    </ul>
	</div>
	</div>
	`;

	const tilesProvider = "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";
	let mymap = L.map("mapid").setView(
	  [12.125543900322048, -86.27085907676695],
	  13
	);
	L.tileLayer(tilesProvider, {
	  maxZoom: 18,
	}).addTo(mymap);

	let icon = L.icon({
	  iconUrl:
	    "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fpurepng.com%2Fpublic%2Fuploads%2Flarge%2Fpurepng.com-treenaturetreegreensummer-8315240022162idmu.png&f=1&nofb=1",
	  iconSize: [40, 40],
	});

	let pop = L.popup({
	  maxHeight: 300,
	  maxWidth: 250,
	  autoClose: true,
	}).setContent(html);
	
	<%
		for(Vista_coordenada_arbol ca: listaCA){
	%>
	var marker = L.marker(
	  [<%=ca.getLatitud()%>, <%=ca.getLongitud()%>],
	  { icon },
	  {
	    title: "Acacia",
	  }
	)addTo(mymap);
	<%
		}
	%>
</script>

