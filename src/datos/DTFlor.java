package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.*;

public class DTFlor {

	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	public ArrayList<Flor> listarFlor(){
		ArrayList<Flor> listaFlor = new ArrayList<Flor>();
		
		try {
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.flor where estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Flor fl = new Flor();
				
				fl.setIdFlor(rs.getInt("idFlor"));
				fl.setNombreComun(rs.getString("nombreComun"));
				fl.setNombreCientifico(rs.getString("nombreCientifico"));
				fl.setDescripcion(rs.getString("descripcion"));
				fl.setTemporadaFloracion(rs.getString("temporadaFloracion"));
				fl.setEstado(rs.getInt("estado"));
				
				listaFlor.add(fl);
				
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
		
		return listaFlor;
	}
	
	
	public boolean guardarFlor(Flor fl) {
		boolean guardado = false;
		PreparedStatement ps;
		String sql = "Insert into public.Flor(nombreComun, nombreCientifico, descripcion, temporadaFloracion, estado) Values(?,?,?,?,1)";
		
		try {
			
			c = PoolConexion.getConnection();
			ps = c.prepareStatement(sql);
			
			ps.setString(1, fl.getNombreComun());
			ps.setString(2, fl.getNombreCientifico());
			ps.setString(3, fl.getDescripcion());
			ps.setString(4, fl.getTemporadaFloracion());
			
			ps.executeUpdate();
			
			guardado = true;
			
			ps.close();
			
		} catch (Exception e) {
			System.out.println("Error al insertar: ");
			e.printStackTrace();
		}
		
		return guardado;
	}
}
