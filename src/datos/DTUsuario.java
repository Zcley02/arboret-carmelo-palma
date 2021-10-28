package datos;

import java.io.InputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

import entidades.Usuario;

public class DTUsuario {
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rsUsuario = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
		public void llenarBanner(Connection c){
			try{
				ps = c.prepareStatement("select * from public.usuario", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsUsuario = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DT Usuario: Error al listar elementos del Usuario "+ e.getMessage());
				e.printStackTrace();
			}
		}
	
		public boolean guardarUsuario(Usuario u){
			boolean resp = false;
			String contrasenia = getMD5(u.getContrasenia());
			
			if(buscarUsuario(u.getUsuario())) {
				resp = false;
			}else {
				try{
					c = PoolConexion.getConnection();
					ps = c.prepareStatement("INSERT INTO public.usuario(nombres, apellidos, usuario, email, contrasenia, idrol, estado) "
											+ "VALUES(?,?,?,?,?,?,?)");
					
					ps.setString(1, u.getNombres());
					ps.setString(2, u.getApellidos());
					ps.setString(3, u.getUsuario());
					ps.setString(4, u.getEmail());
					ps.setString(5, contrasenia);
					ps.setInt(6, u.getIdRol());
					ps.setInt(7, u.getEstado());
					
					int i = ps.executeUpdate();
					
					if(i==1) {
						resp = true;
					}else {
						resp = false;
					}
				}
				catch (Exception e){
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
			}
			
			return resp;
		}
		
		public boolean buscarUsuario(String usuario) {
			boolean existe = false;
			
			//PreparedStatement ps;
			String sql = "Select * from public.usuario where usuario = ?";
			
			try {
				c = PoolConexion.getConnection();
				ps = c.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				ps.setString(1, usuario);
				
				rs = ps.executeQuery();
				
				if(rs.next()) {
					existe = true;
				}else {
					existe = false;
				}
				
				rs.close();
				
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
			
			return existe;
		}
		
		/*
		
		// Metodo para modificar Banner
		public boolean modificarInfoBanner(Banner bn)
		{
			boolean modificado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenarBanner(c);
				rsBanner.beforeFirst();
				while (rsBanner.next())
				{
					if(rsBanner.getInt(1)==bn.getBannerID())
					{
						rsBanner.updateString("titulobanner", bn.getTitulobanner());
						rsBanner.updateString("descripcion", bn.getDescripcion());
						rsBanner.updateTimestamp("fmodificacion", bn.getFmodificacion());								
						rsBanner.updateInt("estado", 2);
						rsBanner.updateRow();
						modificado=true;
						break;
					}
				}
			}
			catch (Exception e)
			{
				System.err.println("ERROR AL ACTUALIZAR BANNER "+e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rsBanner != null){
						rsBanner.close();
					}
					if(c != null){
						PoolConexion.closeConnection(c);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return modificado;
		}*/
		
		public boolean eliminarUsuario(int id)
		{
			boolean eliminado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenarBanner(c);;
				rsUsuario.beforeFirst();
				while (rsUsuario.next())
				{
					if(rsUsuario.getInt(1)==id)
					{
						rsUsuario.deleteRow();
						eliminado=true;
						break;
					}
				}
			}
			catch (Exception e)
			{
				System.err.println("ERROR AL ELIMINAR USUARIO "+e.getMessage());
				e.printStackTrace();
			}
			finally
			{
				try {
					if(rsUsuario != null){
						rsUsuario.close();
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
		
		public boolean loginUsuario(Usuario u) {
			boolean encontrado = false;
			String contrasenia = getMD5(u.getContrasenia());
			
			//PreparedStatement ps;
			String sql = "Select * from public.usuario where usuario = ? and contrasenia = ?";
			
			try {
				c = PoolConexion.getConnection();
				ps = c.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				ps.setString(1, u.getUsuario());
				ps.setString(2, contrasenia);
				
				rs = ps.executeQuery();
				
				if(rs.next()) {
					encontrado = true;
				}else {
					encontrado = false;
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
			
			return encontrado;
		}
		
		public String getMD5(String input) {
	        try {
	            MessageDigest md = MessageDigest.getInstance("MD5");
	            byte[] encBytes = md.digest(input.getBytes());
	            BigInteger numero = new BigInteger(1, encBytes);
	            String encString = numero.toString(16);
	            while (encString.length() < 32) {
	                encString = "0" + encString;
	            }
	            return encString;
	        } catch (Exception e) {
	            throw new RuntimeException(e);
	        }
	    }
}
