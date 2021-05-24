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
	private ResultSet rsGenero = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	public void llenarRsGenero(Connection c) {
		String sql = "SELECT * FROM public.genero where estado <> 3";
		try 
		{
			//c = PoolConexion.getConnection();
			ps = c.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsGenero = ps.executeQuery();
		} 
		catch (Exception e) 
		{
			System.err.println("DT USUARIO: Error en listar los generos " + e.getMessage());
			e.printStackTrace();
		}
	}
	
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
		//PreparedStatement ps;
		String sql = "Insert into public.genero(nombre, descripcion, estado) Values(?,?,1)";
		
		try {
			c = PoolConexion.getConnection();
			ps = c.prepareStatement(sql);
			
			ps.setString(1, g.getNombre());
			ps.setString(2, g.getDescripcion());
			
			ps.executeUpdate();
			
			guardado = true;
			
		} catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR Elementos del Banner "+ e.getMessage());
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
	
	public boolean eliminarGenero(int id) {
		boolean eliminado = false;
		
		try {
			c = PoolConexion.getConnection();
			this.llenarRsGenero(c);;
			rsGenero.beforeFirst();
			while (rsGenero.next())
			{
				if(rsGenero.getInt(1)==id)
				{
					rsGenero.deleteRow();
					eliminado=true;
					break;
				}
			}
			
		} catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR Elementos del Banner "+ e.getMessage());
			e.printStackTrace();
		}
		finally{
			try {
				if(rsGenero != null){
					rsGenero.close();
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
		
		return eliminado;
	}
	
	public Genero obtenerGenero(int id) {
		Genero genero = new Genero();
		
		try {
			
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.genero where idGenero = ?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			if(rs.first()) {
				genero.setIdGenero(rs.getInt("idGenero"));
				genero.setNombre(rs.getString("nombre"));
				genero.setDescripcion(rs.getString("descripcion"));
				genero.setEstado(rs.getInt("estado"));
			}
			
		} catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR Elementos del Banner "+ e.getMessage());
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
		
		return genero;
	}
}
