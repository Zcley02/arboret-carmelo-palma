package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.*;

public class DTServicio {
	
	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rsServicios = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	public ArrayList<Servicios> listarServicios(){
		ArrayList<Servicios> listaServicios = new ArrayList<Servicios>();
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.servicios where estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next()){
				Servicios servicios = new Servicios();
				servicios.setIdServicio(rs.getInt("idServicios")); 
				servicios.setNombre(rs.getString("nombre"));
				servicios.setDescripcion(rs.getString("descripcion"));
				servicios.setFoto(rs.getString("foto"));
				servicios.setEstado(rs.getInt("estado"));
				listaServicios.add(servicios);
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
		return listaServicios;
	}
}
