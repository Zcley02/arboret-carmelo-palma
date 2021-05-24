package servlets;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import datos.DTInicio;
import entidades.Inicio;

/**
 * Servlet implementation class SLEditarMision
 */
@WebServlet("/SLEditarMision")
@MultipartConfig
public class SLEditarMision extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLEditarMision() {
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
		String cambio = request.getParameter("cambio");
		String v = "true";
		
		Inicio in = new Inicio();
		DTInicio dt = new DTInicio();
		
		int idInicio = Integer.parseInt(request.getParameter("id"));
		String mision = request.getParameter("descripcion1");
		
		
		in.setIdInicio(idInicio);
		in.setMision(mision);;
		
		if(cambio.equals(v)) {
			Part partH = request.getPart("foto");
			InputStream inH = partH.getInputStream();
			
			if(dt.editarConImgMision(in, inH)) {
				response.sendRedirect("formstart.jsp");
			}else {
				response.sendRedirect("formstart.jsp?error");
			}
			
		}else {
			if(dt.editarSinImgMision(in)) {
				response.sendRedirect("formstart.jsp");
			}else {
				response.sendRedirect("formstart.jsp?error");
			}
		}
	}

}
