/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.spring.dao;

import cl.spring.model.Colegio;
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
public class ColegioDAO implements IColegioDAO{    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    //Insert colegio in database
    @Override
    public void insertarColegio(Colegio colegio){           
        String query = "INSERT INTO colegio(nombre,direccion) VALUES (?,?)";
        jdbcTemplate.update(query,colegio.getNombre(),colegio.getDireccion());  
    }
           
    //Read colegio from database
    @Override
    public Colegio leerColegio(int id){
        String query = "SELECT *FROM colegio WHERE id="+id;
 
        return jdbcTemplate.query(query, new ResultSetExtractor<Colegio>() {
            @Override
            public Colegio extractData(ResultSet rs) throws SQLException, DataAccessException {
                if(rs.next()){
                    Colegio colegio = new Colegio();
                    colegio.setId(rs.getInt("id"));
                    colegio.setNombre(rs.getString("nombre"));
                    colegio.setDireccion(rs.getString("direccion"));
                    return colegio;
                }
                return null;
            }
        });       
    }
    
    //Read all colegio from database
    @Override
    public List<Colegio> leerAllColegio(){
        String query = "SELECT *FROM colegio";
        List<Colegio> lista = jdbcTemplate.query(query, new RowMapper<Colegio>() {
            @Override
            public Colegio mapRow(ResultSet rs, int rowNum) throws SQLException {
                Colegio colegio = new Colegio();
                colegio.setId(rs.getInt("id"));
                colegio.setNombre(rs.getString("nombre"));
                colegio.setDireccion(rs.getString("direccion"));
                return colegio;
            }
        });
        
        return lista;       
    }
    
    //Delete user from database
    @Override
    public void deleteColegio(int id){
        String query = "DELETE FROM colegio WHERE id = ?";
        jdbcTemplate.update(query,id);
    }
    
    //Update colegio from database
    @Override
    public void updateColegio(String nombre, String direccion, int id){           
        String query = "UPDATE colegio SET nombre = ?,direccion = ? WHERE id = ?";
        jdbcTemplate.update(query,nombre,direccion,id);  
    }

}
