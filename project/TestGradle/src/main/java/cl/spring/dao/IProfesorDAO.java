/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.spring.dao;

import cl.spring.model.Asignatura;
import cl.spring.model.Profesor;
import java.util.List;

/**
 *
 * @author Martin
 */
public interface IProfesorDAO {
 //Insert profesor in database
    public void insertarProfesor(Profesor profesor);
           
    //Read profesor from database
    public Profesor leerProfesor(int id);
    
    //Read all profesor from database
    public List<Profesor> leerAllProfesores();
    
    //Delete profesor from database
    public void deleteProfesor(int id);
    
    //Update profesor from database
    public void updateProfesor(String nombre, int asignatura, int activo, int colegio, int id); 
    
    //Read all asignaturas
    public List<Asignatura> leerAllAsignaturas();
}
