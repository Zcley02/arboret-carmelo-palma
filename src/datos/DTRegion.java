package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Pais;
import entidades.Region;

public class DTRegion {
	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rsRegion = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	public void llenarRsRegion(Connection c)
	{
		String sql = "SELECT * FROM public.region where estado <> 3";
		try 
		{
			//c = PoolConexion.getConnection();
			ps = c.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsRegion = ps.executeQuery();
		} 
		catch (Exception e) 
		{
			System.err.println("DT Region: Error en listar las regiones " + e.getMessage());
			e.printStackTrace();
		}
	}
	
	public ArrayList<Region> listarRegiones()
	{
		ArrayList<Region> listaR = new ArrayList<Region>();
		
		String sql = "SELECT * FROM public.region where estado <> 3";
		try 
		{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next())
			{
				Region r = new Region();
				r.setIdRegion(rs.getInt("idregion"));
				r.setNombre(rs.getString("nombre"));
				r.setDescripcion(rs.getString("descripcion"));
				r.setEstado(Integer.parseInt(rs.getString("estado")));
				r.setIdPais(Integer.parseInt(rs.getString("idpais")));
				
				listaR.add(r);
				
			}
		} 
		catch (Exception e) 
		{
			System.err.println("DT Region: Error en listar los regiones " + e.getMessage());
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
				System.err.println("DT REGION: Error en listar los regiones " + e2.getMessage());
				e2.printStackTrace();
			}
		}
		
		return listaR;
	}
	
	
	public boolean guardarRegion(Region r)
	{
		boolean guardado = false;
		PreparedStatement ps;
		String sql = "INSERT INTO public.region (nombre, descripcion, estado, idpais) VALUES (?,?,?,?);";
		try 
		{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement(sql);
			ps.setString(1, r.getNombre());
			ps.setString(2, r.getDescripcion());
			ps.setInt(3, r.getEstado());
			ps.setInt(4, r.getIdPais());
			
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
			System.err.println("DT Region: Error al guardar una region " + e.getMessage());
			e.printStackTrace();
		}
		finally 
		{
			try 
			{
				if(rsRegion != null)
				{
					rsRegion.close();
				}
				if(c != null)
				{
					c.close();
				}
			} 
			catch (Exception e2) 
			{
				System.err.println("DT Region: Error al cerrar conexion " + e2.getMessage());
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
	}
	*/
	public boolean eliminarRegion(int id)
		{
			boolean eliminado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenarRsRegion(c);
				rsRegion.beforeFirst();
				while (rsRegion.next())
				{
					if(rsRegion.getInt(1)==id)
					{
						rsRegion.deleteRow();
						eliminado=true;
						break;
					}
				}
			}
			catch (Exception e)
			{
				System.err.println("DT Region: Error al eliminar una Región "+e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rsRegion != null){
						rsRegion.close();
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
	
	/*
	
	//Método para encriptar con MD5
	public String md5(String input)
	{
		try 
		{
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] messageDigest = md.digest(input.getBytes());
			BigInteger no = new BigInteger(1, messageDigest);
			
			String hashtext = no.toString(16);
			while (hashtext.length() < 32) 
			{
				hashtext = "0" + hashtext;
			}
			return hashtext;
		} 
		catch (NoSuchAlgorithmException e) 
		{
			throw new RuntimeException(e);
		}
	}
	*/

}
