package datos;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.*;

import entidades.*;

public class DTPublicacion {
	
	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	public ArrayList<Publicacion> listarPublicacion(){
		ArrayList<Publicacion> listaPublicaciones = new ArrayList<Publicacion>();
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.publicaciones where estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			
			while(rs.next()){
				Publicacion pu = new Publicacion();
				pu.setIdPublicacion(rs.getInt("idPublicaciones"));
				pu.setTitulo(rs.getString("titulo"));
				pu.setDescripcion(rs.getString("descripcion"));
				pu.setMultimedia("data:image/jpg;base64," + Base64.getEncoder().encodeToString(rs.getBytes("multimedia")));
				pu.setFechaPublicacion(rs.getDate("fechaPublicacion").toString());
				pu.setHipervinculo(rs.getString("hipervinculo"));
				pu.setEstado(rs.getInt("estado"));
				
				listaPublicaciones.add(pu);
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
		return listaPublicaciones;
	}
	
	public boolean guardarPublicacion(Publicacion pu, InputStream fi) {
		boolean resp = false;
		PreparedStatement ps;
		try {
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("INSERT INTO publicaciones(titulo, descripcion, multimedia, estado, hipervinculo, fechapublicacion) VALUES(?,?,?,?,?,current_date)");
			ps.setString(1, pu.getTitulo());
			ps.setString(2, pu.getDescripcion());
			ps.setBinaryStream(3, fi);
			ps.setInt(4, pu.getEstado());
			ps.setString(5, "https://www.google.com");
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				resp = true;
			}else {
				resp = false;
			}
			
			ps.close();
			
		} catch (Exception e) {
			System.out.println("Error al insertar: ");
			e.printStackTrace();
		}
		
		return resp;
	}

}
