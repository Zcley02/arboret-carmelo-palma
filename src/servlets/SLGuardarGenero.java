package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.*;
import datos.*;

/**
 * Servlet implementation class SLGuardarGenero
 */
@WebServlet(name="SLGuardarGenero", urlPatterns="/SLGuardarGenero")
public class SLGuardarGenero extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLGuardarGenero() {
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
		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");
		boolean resp = false;
		
		Genero g = new Genero();
		DTGenero dtg = new DTGenero();
		
		g.setNombre(nombre);
		g.setDescripcion(descripcion);
		
		resp = dtg.guardarGenero(g);
		
		if(resp==true) {
			response.sendRedirect("gendergestion.jsp");
		}else {
			response.sendRedirect("gendergestion.jsp?error");
		}
		
	}

}
