package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

import entidades.*;

public class DTProducto {
	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rsServicios = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	public ArrayList<Producto> listarProducto(){
		ArrayList<Producto> listaProducto = new ArrayList<Producto>();
		try{
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.productos where estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next()){
				Producto pro = new Producto();
				pro.setIdProducto(rs.getInt("idProductos"));
				pro.setNombre(rs.getString("nombre"));
				pro.setDescripcion(rs.getString("descripcion"));
				pro.setFoto("data:image/jpg;base64," + Base64.getEncoder().encodeToString(rs.getBytes("foto")));
				pro.setPrecio(rs.getDouble("precio"));
				pro.setEstado(rs.getInt("estado"));
				pro.setIdTipoProducto(rs.getInt("idTipo_producto"));
				listaProducto.add(pro);
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
		return listaProducto;
	}
}
