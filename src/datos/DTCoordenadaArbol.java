package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.CoordenadaArbol;

public class DTCoordenadaArbol {
	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rsRegion = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	public boolean guardarCoordenadaArbol(CoordenadaArbol ca) {
		boolean guardado = false;
		String sql = "INSERT INTO public.coordenada_arbol (latitud, longitud, idArbol) VALUES (?,?,?);";
		
		try 
		{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement(sql);
			ps.setDouble(1, ca.getLatitud());
			ps.setDouble(2, ca.getLongitud());
			ps.setInt(3, ca.getIdArbol());
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				guardado = true;
			}else {
				guardado = false;
			}

		} catch (Exception e){
			System.out.println("DR REGION: ERROR EN GUARDAR"+ e.getMessage());
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
		
		return guardado;
	}
}
