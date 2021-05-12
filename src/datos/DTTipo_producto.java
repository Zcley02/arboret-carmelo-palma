package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.TipoProducto;

public class DTTipo_producto {
	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	
	public ArrayList<TipoProducto> listarTipoP(){
		ArrayList<TipoProducto> listarTP = new ArrayList<TipoProducto>();
		
		try {
			
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.tipo_producto where estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				TipoProducto tp = new TipoProducto();
				tp.setIdTipoProducto(rs.getInt("idTipo_producto"));
				tp.setNombreTipo(rs.getString("nombretipo"));
				tp.setDescripcion(rs.getString("descripcion"));
				tp.setEstado(rs.getInt("estado"));
				
				listarTP.add(tp);
				
			}
			
			
		} catch (Exception e){
			System.out.println("DATOS: ERROR EN LISTAR El TIPO DE PRODUCTO "+ e.getMessage());
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
		
		return listarTP;
	}
	
	public boolean guardarTipoProducto(TipoProducto tp) {
		boolean guardado = false;
		PreparedStatement ps;
		
		try {
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("Insert into tipo_producto(nombretipo, descripcion, estado) Values(?,?,1)");
			
			ps.setString(1, tp.getNombreTipo());
			ps.setString(2, tp.getDescripcion());
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				guardado = true;
			}else {
				guardado = false;
			}
			
			ps.close();
			
		} catch (Exception e) {
			System.out.println("Error al insertar: ");
			e.printStackTrace();
		}
		
		return guardado;
	}
}
