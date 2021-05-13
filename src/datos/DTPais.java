package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Pais;

public class DTPais {
	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rsPais = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	public void llenarRsPais(Connection c)
	{
		String sql = "SELECT * FROM public.pais where estado <> 3";
		try 
		{
			//c = PoolConexion.getConnection();
			ps = c.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsPais = ps.executeQuery();
		} 
		catch (Exception e) 
		{
			System.err.println("DT USUARIO: Error en listar los paises " + e.getMessage());
			e.printStackTrace();
		}
	}

	
	public ArrayList<Pais> listarPaises()
	{
		ArrayList<Pais> listaPaises = new ArrayList<Pais>();
		
		String sql = "SELECT * FROM public.pais where estado <> 3";
		try 
		{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next())
			{
				Pais p = new Pais();
				p.setIdPais(rs.getInt("idpais"));
				p.setNombre(rs.getString("nombre"));
				
				listaPaises.add(p);
				
			}
		} 
		catch (Exception e) 
		{
			System.err.println("DT USUARIO: Error en listar los paises " + e.getMessage());
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
				System.err.println("DT Pais: Error en listar los paises " + e2.getMessage());
				e2.printStackTrace();
			}
		}
		
		return listaPaises;
	}
	
	
	public boolean guardarPais(Pais p)
	{
		boolean guardado = false;
		PreparedStatement ps;
		String sql = "INSERT INTO public.pais (nombre, estado) VALUES (?,?);";
		try 
		{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement(sql);
			ps.setString(1, p.getNombre());
			ps.setInt(2, p.getEstado());
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
			System.err.println("DT Pais: Error al guardar un pais " + e.getMessage());
			e.printStackTrace();
		}
		finally 
		{
			try 
			{
				if(rsPais != null)
				{
					rsPais.close();
				}
				if(c != null)
				{
					c.close();
				}
			} 
			catch (Exception e2) 
			{
				System.err.println("DT Pais: Error al cerrar conexion " + e2.getMessage());
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
	
	public boolean eliminarPais(int id)
	{
		boolean eliminado=false;	
		try
		{
			c = PoolConexion.getConnection();
			this.llenarRsPais(c);;
			rsPais.beforeFirst();
			while (rsPais.next())
			{
				if(rsPais.getInt(1)==id)
				{
					rsPais.deleteRow();
					eliminado=true;
					break;
				}
			}
		}
		catch (Exception e)
		{
			System.err.println("Erro al eliminar el País "+e.getMessage());
			e.printStackTrace();
		}
		finally
		{
			try {
				if(rsPais != null){
					rsPais.close();
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
	public boolean eliminarPais(Pais p)
	{
			boolean eliminado = false;
			
			
			PreparedStatement ps;
			
			String sql = "Update public.pais set estado = 3 where idPais = ?";
			
			try {
				c = PoolConexion.getConnection();
				ps = c.prepareStatement(sql);
				
				ps.setInt(1, p.getIdPais());
				ps.executeUpdate();
				
				eliminado = true;
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("Error en eliminar el País");
				e.printStackTrace();
			}
			
			return eliminado;
	}*/
	
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
