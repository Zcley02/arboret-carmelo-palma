package vistas;

public class Vista_region_pais {
	private String nombre;
	private String descripcion;
	private String nombre_pais;
	
	
	public Vista_region_pais() {
		super();
	}
	public Vista_region_pais(String nombre, String descripcion, String nombre_pais) {
		super();
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.nombre_pais = nombre_pais;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getNombre_pais() {
		return nombre_pais;
	}
	public void setNombre_pais(String nombre_pais) {
		this.nombre_pais = nombre_pais;
	}

}
