package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.*;
import entidades.*;


/**
 * Servlet implementation class SLEliminarPublicacion
 */
@WebServlet(name="SLEliminarPublicacion", urlPatterns="/SLEliminarPublicacion")
public class SLEliminarPublicacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLEliminarPublicacion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idRol = "";
		idRol = request.getParameter("id");
		
		try {
			DTPublicacion dt = new DTPublicacion();
			Publicacion p = new Publicacion();
			
			p.setIdPublicacion(Integer.parseInt(idRol));
			
			if(dt.eliminarPublicacion(p)) {
				response.sendRedirect("publicationgestion.jsp");
			}else {
				response.sendRedirect("publicationgestion.jsp?error");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
