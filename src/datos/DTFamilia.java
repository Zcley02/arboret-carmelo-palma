package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Familiar;

public class DTFamilia {

	PoolConexion pc = PoolConexion.getInstance();
	Connection c = null;
	private ResultSet rsFamilia = null;
	private ResultSet rs = null;
	private PreparedStatement ps = null;
	
	public void llenarRsFamilia(Connection c) {
		String sql = "SELECT * FROM public.familia where estado <> 3";
		try 
		{
			//c = PoolConexion.getConnection();
			ps = c.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rsFamilia = ps.executeQuery();
		} 
		catch (Exception e) 
		{
			System.err.println("DT USUARIO: Error en listar las familias " + e.getMessage());
			e.printStackTrace();
		}
	}
	
	public ArrayList<Familiar> listarFamilia(){
		ArrayList<Familiar> listarFamiliar = new ArrayList<Familiar>();
		
		try {
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("select * from public.familia where estado<>3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE, ResultSet.HOLD_CURSORS_OVER_COMMIT);
			rs = ps.executeQuery();
			while(rs.next()){
				Familiar fa = new Familiar();
				fa.setIdFamilia(rs.getInt("idFamilia"));
				fa.setNombre(rs.getString("nombre"));
				fa.setDescripcion(rs.getString("descripcion"));
				fa.setEstado(rs.getInt("estado"));
				listarFamiliar.add(fa);
			}
		} catch (Exception e) {
			System.out.println("DATOS: ERROR EN LISTAR LA CARRERA "+ e.getMessage());
			e.printStackTrace();
		}finally {
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
		
		
		return listarFamiliar;
	}
	
	public boolean guardarFamiliar(Familiar f) {
		boolean guardado = false;
		PreparedStatement ps;
		
		try {
			c = PoolConexion.getConnection();
			ps = c.prepareStatement("Insert into familia(nombre, descripcion, estado) Values(?,?,1)");
			
			ps.setString(1, f.getNombre());
			ps.setString(2, f.getDescripcion());
			
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
	
	public boolean eliminarFamilia(int id) {
		boolean eliminado = false;
		
		try {
			c = PoolConexion.getConnection();
			this.llenarRsFamilia(c);;
			rsFamilia.beforeFirst();
			while (rsFamilia.next())
			{
				if(rsFamilia.getInt(1)==id)
				{
					rsFamilia.deleteRow();
					eliminado=true;
					break;
				}
			}
			
		} catch (Exception e) {
			System.out.println("Error en eliminar la familia");
			e.printStackTrace();
		}
		
		return eliminado;
	}
}
