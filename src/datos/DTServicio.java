package datos;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Servicios;

public class DTServicio {
	
	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rsServicios = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	public ArrayList<Servicios> listarServicios(){
		ArrayList<Servicios> listaServicios = new ArrayList<Servicios>();
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.servicios where estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next()){
				Servicios servicios = new Servicios();
				servicios.setIdServicio(rs.getInt("idServicios")); 
				servicios.setNombre(rs.getString("nombre"));
				servicios.setDescripcion(rs.getString("descripcion"));
				servicios.setFoto(rs.getString("foto"));
				servicios.setEstado(rs.getInt("estado"));
				listaServicios.add(servicios);
			}
		}
		catch (Exception e){
			System.out.println("DT Servicio: ERROR EN LISTAR LOS SERVICIOS "+ e.getMessage());
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
		return listaServicios;
	}
	
	public boolean guardarServicio(Servicios s, FileInputStream fis, int longitud)
	{
		boolean guardado = false;
		PreparedStatement ps;
		String sql = "INSERT INTO public.servicios (nombre, descripcion, foto, estado) VALUES (?,?,?,?)";
		try 
		{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement(sql);
			ps.setString(1, s.getNombre());
			ps.setString(2, s.getDescripcion());
			ps.setBinaryStream(3, fis, longitud);;
			ps.setInt(4, s.getEstado());
			
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
			System.err.println("DT Servicio: Error al guardar un servicio " + e.getMessage());
			e.printStackTrace();
		}
		finally 
		{
			try 
			{
				if(rsServicios != null)
				{
					rsServicios.close();
				}
				if(c != null)
				{
					c.close();
				}
			} 
			catch (Exception e2) 
			{
				System.err.println("DT Servicio: Error al cerrar conexion " + e2.getMessage());
				e2.printStackTrace();
			}
		}
		
		return guardado;
	}
}
