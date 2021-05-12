package datos;

import java.io.InputStream;
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
	
	public boolean guardarProducto(Producto p, InputStream fin) {
		boolean guardado =false;
		PreparedStatement ps;
		String sql = "Insert into productos(nombre, descripcion, foto, precio, idtipo_producto, estado) Values(?,?,?,?,?,1)";
		
		try {
			c = PoolConexion.getConnection();
			ps = c.prepareStatement(sql);
			
			ps.setString(1, p.getNombre());
			ps.setString(2, p.getDescripcion());
			ps.setBinaryStream(3, fin);
			
			ps.setDouble(4, p.getPrecio());
			ps.setInt(5, p.getIdTipoProducto());
			
			ps.executeUpdate();
			
			guardado = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return guardado;
	}
}
