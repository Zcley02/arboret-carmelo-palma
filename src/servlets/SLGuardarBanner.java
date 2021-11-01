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
import javax.ws.rs.NotFoundException;

import datos.DTBanner;
import datos.DTServicio;
import entidades.Banner;
import entidades.Servicios;

/**
 * Servlet implementation class SLGuardarBanner
 */
@WebServlet(name="SLGuardarBanner" ,urlPatterns="/SLGuardarBanner")
@MultipartConfig
public class SLGuardarBanner extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLGuardarBanner() {
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
		try {
			String titulo = request.getParameter("txtTitulo");
			String descripcion = request.getParameter("txtDescripcion");
			int posicion = Integer.parseInt(request.getParameter("posicion").trim());
			Part part = request.getPart("foto");			
			
			InputStream fin = part.getInputStream();
			
			int estado = 1;
			boolean resp = false;
			
			Banner b = new Banner();
			
			b.setTitulo(titulo);
			b.setDescripcion(descripcion);
			//pu.setImgBytea(imgBytea);
			b.setPosicion(posicion);
			b.setEstado(estado);
			
			DTBanner dt = new DTBanner();
			
			resp = dt.guardarBanner(b,fin);
			
			if(resp == true) {
				response.sendRedirect("bannergestions.jsp?msj=1");
			}else{
				response.sendRedirect("management.jsp");
			};
		} catch (NotFoundException e) {
			System.out.println(e);
		}catch (Exception e) {
			System.out.println(e);
		}
			

		
	}

}
