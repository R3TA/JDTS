/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.spring.controller;

import cl.spring.dao.ColegioDAO;
import cl.spring.dao.ProfesorDAO;
import cl.spring.model.Asignatura;
import cl.spring.model.Colegio;
import cl.spring.model.Profesor;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Martin
 */
@Controller
@RequestMapping(path="/mantenedor")
public class ProfesorController {
   @Autowired
   private ProfesorDAO profesordao;
   
   @Autowired
   private ColegioDAO colegiodao;
   //Rutas de profesor
    //Ruta con mantenedor de profesor  
    @RequestMapping(path="/profesor")
    public ModelAndView listProfesor(ModelAndView model) throws IOException{       
        List<Colegio> listColegio = colegiodao.leerAllColegio();
        List<Profesor> listProfesor = profesordao.leerAllProfesores();
        List<Asignatura> listAsignatura = profesordao.leerAllAsignaturas();
        JSONArray jsonarray = new JSONArray(listProfesor);
        model.addObject("listColegio", listColegio);
        model.addObject("listProfesor", jsonarray);
        model.addObject("listAsignatura",listAsignatura);
        model.setViewName("profesor");
        return model;
    }
    //Ruta con respuesta luego de insertar un profesor
    @RequestMapping(path="/profesor/add", method=RequestMethod.POST)
	public @ResponseBody String addProfesor(@RequestParam String nombre,@RequestParam String fechanacimiento,
			@RequestParam int activo, @RequestParam int colegio, @RequestParam int asignatura) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request

		Profesor profesor = new Profesor();
		profesor.setNombre(nombre);
                profesor.setFechaNacimiento(fechanacimiento);
                profesor.setActivo(activo);
                profesor.setColegio(colegio);
		profesor.setAsignatura(asignatura);
                profesordao.insertarProfesor(profesor);
                return "Saved";
	}
        
    //Ruta con formulario para editar un profesor   
    @GetMapping(path="/profesor/editprofesor") // Map ONLY GET Requests
	public ModelAndView editProfesor (@RequestParam int id, ModelAndView model) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request
                
                Profesor c = profesordao.leerProfesor(id);
                List<Profesor> profesor = new ArrayList<>();
                profesor.add(c);
                model.addObject("profesor", profesor);
                model.setViewName("editprofesor");
                List<Colegio> listColegio = colegiodao.leerAllColegio();
                List<Asignatura> listAsignatura = profesordao.leerAllAsignaturas();
                model.addObject("listColegio", listColegio);
                model.addObject("listAsignatura",listAsignatura);

		return model;
	}
    
    //Ruta con respuesta luego de actualizar un profesor    
    @RequestMapping(path="/profesor/edited",method=RequestMethod.POST)
	public @ResponseBody String editedProfesor (@RequestParam String nombre,
			@RequestParam int activo, @RequestParam int colegio, @RequestParam int asignatura, @RequestParam int id) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request

                profesordao.updateProfesor(nombre,asignatura,activo,colegio,id);
		return "Updated";
	}
        
    //Ruta con respuesta luego de eliminar un colegio     
    @GetMapping(path="/profesor/delete") // Map ONLY GET Requests
	public @ResponseBody String deletedProfesor (@RequestParam int id) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request

                profesordao.deleteProfesor(id);
		return "Deleted";
	}    
    
}
