package servlets;

import java.io.IOException;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.DTEvento;
import entidades.Eventos;

/**
 * Servlet implementation class SLGuardarEvento
 */
@WebServlet(name="SLGuardarEvento", urlPatterns="/SLGuardarEvento")
public class SLGuardarEvento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLGuardarEvento() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			
			
			Eventos ev = new Eventos();
			DTEvento dt = new DTEvento();
			
			String fechaIn = fechaIn(request.getParameter("fechaInicio"));
			String fechaFin = fechaFin(request.getParameter("fechaFin"));
			String nombre = request.getParameter("nombre");
			String descripcion = request.getParameter("descripcion");
			String tipoEvento = request.getParameter("tipoEvento");
			String ubicacion = request.getParameter("ubicacion");
			String hipervinculo = request.getParameter("hipervinculo");
			
			ev.setNombre(nombre);
			ev.setDescripcion(descripcion);
			ev.setFechaInicio(fechaIn);
			ev.setFechaFin(fechaFin);
			ev.setTipoEvento(tipoEvento);
			ev.setUbicacion(ubicacion);
			ev.setHipervinculo(hipervinculo);
			
			if(validarFechas(fechaIn, fechaFin)) {
				if(dt.guardarEvento(ev)) {
					response.sendRedirect("eventgestion.jsp");
				}else {
					response.sendRedirect("eventgestion.jsp?error");
				}
			}else {
				System.out.println("nose");
				response.sendRedirect("eventgestion.jsp?error");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
	}
	
	private String fechaIn(String fecha) {
		
		String fechaIn = "";
		try {
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date date = format.parse(fecha);
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			fechaIn = sdf.format(date);
			
			System.out.println(sdf.format(date));
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return fechaIn;
		
	}
	
	private String fechaFin(String fecha) {
		String fechaFin = "";
		try {
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date date = format.parse(fecha);
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			fechaFin = sdf.format(date);
			
			System.out.println(sdf.format(date));
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return fechaFin;
	}

	private boolean validarFechas(String fechaIn, String fechaFin) {
		boolean correcto = false;
		
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyyy");
			Date fechain = sdf.parse(fechaIn);
			Date fechafin = sdf1.parse(fechaFin);
			
			if(fechain.compareTo(fechafin) < 0) {
				System.out.println("start is before end");
				correcto = true;
			}if(fechain.compareTo(fechafin)==0) {
				System.out.println("start is befd1");
				correcto = true;
				
			}if(fechain.compareTo(fechafin) > 0) {
				System.out.println("start is before endddd");
				correcto = false;
			}
			
			
		} catch (ParseException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return correcto;
	}
}
