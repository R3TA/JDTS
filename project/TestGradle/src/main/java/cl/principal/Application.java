/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.principal;

import java.sql.SQLException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;

/**
 *
 * @author Martin
 */
@ComponentScan("cl.spring")
@SpringBootApplication
public class Application {
    public static void main(String[] args) throws SQLException {
            SpringApplication.run(Application.class, args);
            //System.out.println("");
            
    }
}