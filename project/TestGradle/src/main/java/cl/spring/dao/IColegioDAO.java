/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.spring.dao;

import cl.spring.model.Colegio;
import java.util.List;


/**
 *
 * @author Martin
 */
public interface IColegioDAO {
    //Insert colegio in database
    public void insertarColegio(Colegio colegio);
           
    //Read colegio from database
    public Colegio leerColegio(int id);
    
    //Read all colegio from database
    public List<Colegio> leerAllColegio();
    
    //Delete colegio from database
    public void deleteColegio(int id);
    
    //Update colegio from database
    public void updateColegio(String nombre, String direccion, int id); 
}
