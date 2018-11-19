/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.spring.model;

/**
 *
 * @author Martin
 */
public class Profesor {
    private int id;
    private String nombre;
    private String fechaNacimiento;
    private int asignatura;
    private int activo;
    private int colegio;
    
    public Profesor(){
    }
    
    public Profesor(String nombre, String fechaNacimiento, int asignatura, int activo, int colegio){
        this.nombre = nombre;
        this.fechaNacimiento = fechaNacimiento;
        this.asignatura = asignatura;
        this.activo = activo;
        this.colegio = colegio;
    }
       
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }
    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the fechaNacimiento
     */
    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    /**
     * @param fechaNacimiento the fechaNacimiento to set
     */
    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    /**
     * @return the asignatura
     */
    public int getAsignatura() {
        return asignatura;
    }

    /**
     * @param asignatura the asignatura to set
     */
    public void setAsignatura(int asignatura) {
        this.asignatura = asignatura;
    }

    /**
     * @return the activo
     */
    public int getActivo() {
        return activo;
    }

    /**
     * @param activo the activo to set
     */
    public void setActivo(int activo) {
        this.activo = activo;
    }

    /**
     * @return the colegio
     */
    public int getColegio() {
        return colegio;
    }

    /**
     * @param colegio the colegio to set
     */
    public void setColegio(int colegio) {
        this.colegio = colegio;
    }   
}
