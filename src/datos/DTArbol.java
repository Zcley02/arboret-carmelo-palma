package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

import entidades.*;

public class DTArbol {

	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rsArbol = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	public void llenarArbol() {
		try {
			ps = c.prepareStatement("select * from arbol", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsArbol = ps.executeQuery();
		} catch (Exception e) {
			System.out.println("Error en listar arbol "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Arbol> listarArbol(){
		ArrayList<Arbol> listaArbol = new ArrayList<Arbol>();
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.arbol", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next()){
				Arbol arbol = new Arbol();
				arbol.setId(rs.getInt("idArbol")); 
				arbol.setNombreComun(rs.getString("nombreComun"));
				arbol.setNombreCientifico(rs.getString("nombreCientifico"));
				arbol.setDescripcion(rs.getString("descripcion"));
				arbol.setIdFamilia(rs.getInt("idFamilia"));
				arbol.setIdGenero(rs.getInt("idGenero"));
				arbol.setIdDistribucion(rs.getInt("idDistribucion"));
				arbol.setIdFlor(rs.getInt("idFlor"));
				arbol.setImg("data:image/jpg;base64," + Base64.getEncoder().encodeToString(rs.getBytes("foto")));
				//System.out.println(rs.getString("img"));
				listaArbol.add(arbol);
			}
		}
		catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR LA CARRERA "+ e.getMessage());
			e.printStackTrace();
		}
		finally{
			try {
				if(rs != null){
					rs.close();
				}
				if(ps != null){
					ps.close();
				}
				if(c != null){
					PoolConexion.closeConnection(c);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return listaArbol;
	}
}
