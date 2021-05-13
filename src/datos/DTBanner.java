package datos;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

import entidades.Banner;

public class DTBanner {
	PoolConexion pc = PoolConexion.getInstance(); 
	Connection c = null;
	private ResultSet rsBanner = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
		public void llenarBanner(Connection c){
			try{
				ps = c.prepareStatement("select * from public.banner", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rsBanner = ps.executeQuery();
			}
			catch (Exception e){
				System.out.println("DATOS: Error al listar elementos del Banner "+ e.getMessage());
				e.printStackTrace();
			}
		}

		public ArrayList<Banner> listarBanner(){
			ArrayList<Banner> listBanner = new ArrayList<Banner>();
			
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("SELECT * FROM banner b where b.estado <> 3 order by b.posicion asc", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				rs = ps.executeQuery();
				while(rs.next()){
					Banner bn = new Banner();
					bn.setIdBanner(rs.getInt("idBanner"));
					bn.setTitulo(rs.getString("titulo"));
					bn.setDescripcion(rs.getString("descripcion"));
					bn.setFoto("data:image/jpg;base64," + Base64.getEncoder().encodeToString(rs.getBytes("foto")));
					bn.setPosicion(rs.getInt("posicion"));
					bn.setEstado(rs.getInt("estado"));
					
					listBanner.add(bn);
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
			return listBanner;
		}
	
		public boolean guardarBanner(Banner bn, InputStream fi){
			boolean resp = false;
			
			try{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("INSERT INTO public.banner(titulo,descripcion, foto, posicion, estado) "
										+ "VALUES(?,?,?,?,?)");
				
				ps.setString(1, bn.getTitulo());
				ps.setString(2, bn.getDescripcion());
				ps.setBinaryStream(3, fi);
				ps.setInt(4, bn.getPosicion() + 1);
				ps.setInt(5, bn.getEstado());
				
				int i = ps.executeUpdate();
				
				if(i==1) {
					resp = true;
				}else {
					resp = false;
				}
				
				ps.close();
			}
			catch (Exception e) {
				System.err.println("Error al guardar Banner "+e.getMessage());
				e.printStackTrace();
			}
			finally{
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
			
			return resp;
		}
		
		public Banner getBanner(int idBanner)
		{
			Banner bnG = new Banner();
			try
			{
				c = PoolConexion.getConnection();
				ps = c.prepareStatement("select * from public.banner where estado <> 3 and idbanner = ?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
				ps.setInt(1, idBanner);
				rs = ps.executeQuery();
				if(rs.next())
				{
					bnG.setIdBanner(idBanner);
					bnG.setTitulo(rs.getString("titulobanner"));
					bnG.setDescripcion(rs.getString("descripcion"));
					bnG.setPosicion(rs.getInt("posicion"));
					bnG.setEstado(rs.getInt("estado"));
				}
			}
			catch (Exception e)
			{
				System.out.println("DATOS ERROR BANNER: "+ e.getMessage());
				e.printStackTrace();
			}
			finally
			{
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
			
			return bnG;
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
		}
		
	
		// Metodo para eliminar Banner
		public boolean eliminaBanner(int idB)
		{
			boolean eliminado=false;	
			try
			{
				c = PoolConexion.getConnection();
				this.llenarBanner(c);;
				rsBanner.beforeFirst();
				while (rsBanner.next())
				{
					if(rsBanner.getInt(1)==idB)
					{
						rsBanner.deleteRow();
						eliminado=true;
						break;
					}
				}
			}
			catch (Exception e)
			{
				System.err.println("ERROR AL ELIMINAR BANNER "+e.getMessage());
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
			return eliminado;
		}*/
}