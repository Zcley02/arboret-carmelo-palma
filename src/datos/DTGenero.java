package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.*;

public class DTGenero {
	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	public ArrayList<Genero> listarGenero(){
		ArrayList<Genero> listaGenero = new ArrayList<Genero>();
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.genero where estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next()){
				Genero genero = new Genero();
				genero.setIdGenero(rs.getInt("idGenero"));
				genero.setNombre(rs.getString("nombre"));
				genero.setDescripcion(rs.getString("descripcion"));
				genero.setEstado(rs.getInt("estado"));
				//System.out.println(rs.getString("fechaInicio"));
				listaGenero.add(genero);
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
		return listaGenero;
	}
	
	
	public boolean guardarGenero(Genero g) {
		boolean guardado = false;
		PreparedStatement ps;
		String sql = "Insert into public.genero(nombre, descripcion, estado) Values(?,?,1)";
		
		try {
			c = PoolConexion.getConnection();
			ps = c.prepareStatement(sql);
			
			ps.setString(1, g.getNombre());
			ps.setString(2, g.getDescripcion());
			
			ps.executeUpdate();
			
			guardado = true;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
				
		return guardado;
	}
}
