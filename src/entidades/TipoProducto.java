package entidades;

public class TipoProducto {
	private int idTipoProducto;
	private String nombreTipo;
	private String descripcion;
	public TipoProducto() {
		super();
	}
	public TipoProducto(int idTipoProducto, String nombreTipo, String descripcion) {
		super();
		this.idTipoProducto = idTipoProducto;
		this.nombreTipo = nombreTipo;
		this.descripcion = descripcion;
	}
	public int getIdTipoProducto() {
		return idTipoProducto;
	}
	public void setIdTipoProducto(int idTipoProducto) {
		this.idTipoProducto = idTipoProducto;
	}
	public String getNombreTipo() {
		return nombreTipo;
	}
	public void setNombreTipo(String nombreTipo) {
		this.nombreTipo = nombreTipo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	
}
