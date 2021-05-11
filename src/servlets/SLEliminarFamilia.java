package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.DTFamilia;
import entidades.Familiar;

/**
 * Servlet implementation class SLEliminarFamilia
 */
@WebServlet(name="SLEliminarFamilia", urlPatterns="/SLEliminarFamilia")
public class SLEliminarFamilia extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLEliminarFamilia() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idFamilia = "";
		idFamilia = request.getParameter("id");
		
		try {
			
			DTFamilia dt = new DTFamilia();
			Familiar fa = new Familiar();
			
			fa.setIdFamilia(Integer.parseInt(idFamilia));
			
			if(dt.eliminarFamilia(fa)) {
				response.sendRedirect("familygestion.jsp");
			}else {
				response.sendRedirect("familygestion.jsp?error");
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
