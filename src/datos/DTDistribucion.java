package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Distribucion;
import entidades.Region;

public class DTDistribucion {
	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rsDistribucion = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	public void llenarRsDistri(Connection c)
	{
		String sql = "SELECT * FROM public.distribucion where estado <> 3";
		try 
		{
			//c = PoolConexion.getConnection();
			ps = c.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsDistribucion = ps.executeQuery();
		} 
		catch (Exception e) 
		{
			System.err.println("DT Distribucion: Error en listar las distribuciones " + e.getMessage());
			e.printStackTrace();
		}
	}
	
	public ArrayList<Distribucion> listarDistribucion(){
		ArrayList<Distribucion> listarD = new ArrayList<Distribucion>();
		
		String sql = "SELECT * FROM public.distribucion where estado <> 3";
		try {
			c = PoolConexion.getConnection();
			ps = c.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Distribucion d = new Distribucion();
				
				d.setIdDistribucion(rs.getInt("idDistribucion"));
				d.setNombre(rs.getString("nombre"));
				d.setDescripcion(rs.getString("descripcion"));
				d.setIdRegion(rs.getInt("idRegion"));
				d.setEstado(rs.getInt("estado"));
				
				listarD.add(d);
				
			}
			
		} catch (Exception e) 
		{
			System.err.println("DT Distribucion: Error en listar las distribuciones " + e.getMessage());
			e.printStackTrace();
		}
		finally 
		{
			try 
			{
				if(rs != null)
					rs.close();
				
				if(ps != null)
					ps.close();
				
				if(c != null)
					PoolConexion.closeConnection(c);
			} 
			catch (Exception e2) 
			{
				System.err.println("DT Distribucion: Error en listar las distribuciones " + e2.getMessage());
				e2.printStackTrace();
			}
		}
		
		return listarD;
	}
	
	public boolean guardarDistribucion(Distribucion d)
	{
		boolean guardado = false;
		PreparedStatement ps;
		String sql = "INSERT INTO public.distribucion (nombre, descripcion, estado, idregion) VALUES (?,?,?,?);";
		try 
		{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement(sql);
			ps.setString(1, d.getNombre());
			ps.setString(2, d.getDescripcion());
			ps.setInt(3, d.getEstado());
			ps.setInt(4, d.getIdRegion());
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				guardado = true;
			}else {
				guardado = false;
			}
			
			ps.close();

		} 
		catch (Exception e) 
		{
			System.err.println("DT Distribucion: Error al guardar una distribucion " + e.getMessage());
			e.printStackTrace();
		}
		finally 
		{
			try 
			{
				if(rsDistribucion != null)
				{
					rsDistribucion.close();
				}
				if(c != null)
				{
					c.close();
				}
			} 
			catch (Exception e2) 
			{
				System.err.println("DT Distribucion: Error al cerrar conexion " + e2.getMessage());
				e2.printStackTrace();
			}
		}
		
		return guardado;
	}
	
	/*
	public boolean modificarUsuario(Usuario u)
	{
		boolean modificado = false;
		Date utilDate = new Date();
		java.sql.Date sqlDate =  new java.sql.Date(utilDate.getTime());
		
		try 
		{
			c = PoolConexion.getConnection();
			this.llenarRsUsuario(c);
			rsUsuario.beforeFirst();
			//rsUsuario.absolute(u.getIdUsuario());
			//rsUsuario.updateInt("idusuario", u.getIdUsuario());
//			rsUsuario.updateString("nombre", u.getNombre());
//			rsUsuario.updateString("apellido", u.getApellido());
//			rsUsuario.updateString("usuario", u.getUsuarioNombre());
//			rsUsuario.updateString("pwd", md5(u.getPwd()));
//			rsUsuario.updateDate("fechaCreacion", sqlDate);
//			rsUsuario.updateInt("estado", 2);
//			rsUsuario.updateRow();
			modificado = true;
			
				
			while(rsUsuario.next())
			{
				if(rsUsuario.getInt(1) == u.getIdUsuario()) 
				{
					System.out.println("Id del usuario: " + u.getIdUsuario());
					
					//rsUsuario.updateInt("idusuario", u.getIdUsuario());
					rsUsuario.updateString("nombre", u.getNombre());
					rsUsuario.updateString("apellido", u.getApellido());
					rsUsuario.updateString("usuario", u.getUsuarioNombre());
					rsUsuario.updateString("pwd", md5(u.getPwd()));
					rsUsuario.updateDate("fechaCreacion", sqlDate);
					rsUsuario.updateInt("estado", 2);
					
					rsUsuario.updateRow();
					modificado = true;
					break;
				}
				
			}
			
		} 
		catch (Exception e) 
		{
			System.err.println("DTUSUARIO: Error al modificar usuario " + e.getMessage());
			e.printStackTrace();
		}
		finally 
		{
			try 
			{
				if(rsUsuario != null)
				{
					rsUsuario.close();
				}
				if(c != null)
				{
					c.close();
				}
			} 
			catch (Exception e2) 
			{
				System.err.println("DTUSUARIO: Error al cerrar conexion " + e2.getMessage());
				e2.printStackTrace();
			}
		}
		
		return modificado;
	}*/
	
	public boolean eliminarDistri(int id)
		{
			boolean eliminado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenarRsDistri(c);;
				rsDistribucion.beforeFirst();
				while (rsDistribucion.next())
				{
					if(rsDistribucion.getInt(1)==id)
					{
						rsDistribucion.deleteRow();
						eliminado=true;
						break;
					}
				}
			}
			catch (Exception e)
			{
				System.err.println("DT Distribucion: Error al eliminar una distribución "+e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rsDistribucion != null){
						rsDistribucion.close();
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
}
