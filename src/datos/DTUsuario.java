package datos;

import java.io.InputStream;
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
			
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("INSERT INTO public.usuario(nombres, apellidos, usuario, email, contrasenia, idrol, estado) "
										+ "VALUES(?,?,?,?,?,?,?)");
				
				ps.setString(1, u.getNombres());
				ps.setString(2, u.getApellidos());
				ps.setString(3, u.getUsuario());
				ps.setString(4, u.getEmail());
				ps.setString(5, u.getContrasenia());
				ps.setInt(6, u.getIdRol());
				ps.setInt(7, u.getEstado());
				
				int i = ps.executeUpdate();
				
				if(i==1) {
					resp = true;
				}else {
					resp = false;
				}
				
				ps.close();
			}
			catch (Exception e) {
				System.err.println("Error al guardar usuario "+e.getMessage());
				e.printStackTrace();
			}
			finally{
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
			
			return resp;
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
}
