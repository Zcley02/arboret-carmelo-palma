package entidades;

public class UsuarioRol {
	private int idUsuarioRol;
	private String descripcion;
	private int idRol;
	private int idUsuario;
	public UsuarioRol() {
		super();
	}
	public UsuarioRol(int idUsuarioRol, String descripcion, int idRol, int idUsuario) {
		super();
		this.idUsuarioRol = idUsuarioRol;
		this.descripcion = descripcion;
		this.idRol = idRol;
		this.idUsuario = idUsuario;
	}
	public int getIdUsuarioRol() {
		return idUsuarioRol;
	}
	public void setIdUsuarioRol(int idUsuarioRol) {
		this.idUsuarioRol = idUsuarioRol;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getIdRol() {
		return idRol;
	}
	public void setIdRol(int idRol) {
		this.idRol = idRol;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	
	
}
