package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.DTPais;
import entidades.Pais;

/**
 * Servlet implementation class SLGuardarPais
 */
@WebServlet("/SLGuardarPais")
public class SLGuardarPais extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLGuardarPais() {
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
		doGet(request, response);
		try 
		{
			Pais p = new Pais();
			DTPais dtp = new DTPais();
			
			String nombre;
			int estado = 1;
			
			nombre = request.getParameter("nombre");
		
			p.setNombre(nombre);
			p.setEstado(estado);

			
			if(dtp.guardarPais(p)) { 
				
			response.sendRedirect("countrygestion.jsp");
				
			} else {
			response.sendRedirect("countrygestion.jsp?error"); }
			
		} 
		catch (Exception e) 
		{
			System.err.println("SL Pais: Error al guardar el Pais " +e.getMessage());
			e.printStackTrace();
		}

	}

}
