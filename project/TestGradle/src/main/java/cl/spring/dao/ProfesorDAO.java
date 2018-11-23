/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.spring.dao;

import cl.spring.model.Asignatura;
import cl.spring.model.Profesor;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Martin
 */
@Repository
public class ProfesorDAO implements IProfesorDAO{
    @Autowired
    private JdbcTemplate jdbcTemplate;

    //Insert colegio in database
    @Override
    public void insertarProfesor(Profesor profesor){

        String query = "INSERT INTO profesor(nombre,fechaNacimiento,asignatura,activo,colegio) VALUES(?,?,?,?,?)";
        jdbcTemplate.update(query,profesor.getNombre(),profesor.getFechaNacimiento(),profesor.getAsignatura(),profesor.getActivo(),profesor.getColegio());  
    }
           
    //Read colegio from database
    @Override
    public Profesor leerProfesor(int id){
        String query = "SELECT *FROM profesor WHERE id="+id;
        return jdbcTemplate.query(query, new ResultSetExtractor<Profesor>() {
            @Override
            public Profesor extractData(ResultSet rs) throws SQLException, DataAccessException {
                if(rs.next()){
                    Profesor profesor = new Profesor();
                    profesor.setId(rs.getInt("id"));
                    profesor.setNombre(rs.getString("nombre"));
                    profesor.setFechaNacimiento(rs.getString("fechaNacimiento"));
                    profesor.setAsignatura(rs.getInt("asignatura"));
                    profesor.setActivo(rs.getInt("activo"));
                    profesor.setColegio(rs.getInt("colegio"));
                    
                    return profesor;
                }
                return null;
            }
        });       
    }
    
    //Read all profesor from database
    @Override
    public List<Profesor> leerAllProfesores(){
        String query = "SELECT *FROM profesor";
        List<Profesor> lista = jdbcTemplate.query(query, new RowMapper<Profesor>() {
            @Override
            public Profesor mapRow(ResultSet rs, int rowNum) throws SQLException {
                Profesor profesor = new Profesor();
                profesor.setId(rs.getInt("id"));
                profesor.setNombre(rs.getString("nombre"));
                profesor.setAsignatura(rs.getInt("asignatura"));
                profesor.setColegio(rs.getInt("colegio"));
                return profesor;
            }
        });
        
        return lista;       
    }
    
    //Delete profesor from database
    @Override
    public void deleteProfesor(int id){
        String query = "DELETE FROM profesor WHERE id = ?";
        jdbcTemplate.update(query,id);
    }
    
    //Update profesor from database
    @Override
    public void updateProfesor(String nombre, int asignatura, int activo, int colegio, int id){           
        String query = "UPDATE profesor SET nombre = ?, asignatura = ?, activo = ?, colegio = ? WHERE id = ?";
        jdbcTemplate.update(query,nombre,asignatura,activo,colegio,id);  
    }
         
    @Override
    public List<Asignatura> leerAllAsignaturas(){
        String query = "SELECT * FROM asignatura";
        List<Asignatura> lista = jdbcTemplate.query(query, new RowMapper<Asignatura>() {
            @Override
            public Asignatura mapRow(ResultSet rs, int rowNum) throws SQLException {
                Asignatura asignatura = new Asignatura();
                asignatura.setId(rs.getInt("id"));
                asignatura.setNombre(rs.getString("nombre"));
                return asignatura;
            }
        });
        
        return lista;       
    }
    
}
