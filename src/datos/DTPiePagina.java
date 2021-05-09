package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.PiePagina;

public class DTPiePagina {
	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	public PiePagina obtenerPP() {
		PiePagina pp = new PiePagina();
		
		try {
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.piepagina where id = 1", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			if(rs.first()) {
				pp.setDireccion(rs.getString("direccion"));
				pp.setIdPiePagina(rs.getInt("id"));
				pp.setTelefono(rs.getString("telefono"));
				pp.setExt(rs.getString("ext"));
				pp.setEmail(rs.getString("email"));
			}
			
		} catch (Exception e){
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
		
		return pp;
	}
}
