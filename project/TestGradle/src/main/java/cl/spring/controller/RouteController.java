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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author Martin
 */
@Controller    // This means that this class is a Controller
@RequestMapping(path="/mantenedor")
public class RouteController {
    //private ColegioDAO colegio;
    
    //Ruta de bienvenida   
    @RequestMapping(path="/welcome")
	public ModelAndView welcomePage() {
		return new ModelAndView("welcome");
	}       
    
    //Ruta con mantenedor de colegio       
    @RequestMapping(path="/colegio")
    public ModelAndView listColegio(ModelAndView model) throws IOException{       
        ColegioDAO colegio = new ColegioDAO();
        List<Colegio> listColegio = colegio.leerAllColegio();
        model.addObject("listColegio", listColegio);
        model.setViewName("colegio");
        return model;
    }
    
    //Ruta con respuesta luego de insertar un colegio
    @GetMapping(path="/colegio/add") // Map ONLY GET Requests
	public @ResponseBody String addColegio (@RequestParam String nombre
			, @RequestParam String direccion) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request

		Colegio colegio = new Colegio();
                ColegioDAO colegiodao = new ColegioDAO();
		colegio.setNombre(nombre);
		colegio.setDireccion(direccion);
                colegiodao.insertarColegio(colegio);
		//userRepository.save(n);
		return "Saved";
	}
        
    //Ruta con formulario para editar un colegio   
    @GetMapping(path="/colegio/editcolegio") // Map ONLY GET Requests
	public ModelAndView editColegio (@RequestParam int id, ModelAndView model) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request
                
                ColegioDAO colegiodao = new ColegioDAO();
                Colegio c = colegiodao.leerColegio(id);
                List<Colegio> colegio = new ArrayList<>();
                colegio.add(c);
                model.addObject("colegio", colegio);
                model.setViewName("editcolegio");
		//userRepository.save(n);
		return model;
	}
    
    //Ruta con respuesta luego de actualizar un colegio    
    @GetMapping(path="/colegio/edited") // Map ONLY GET Requests
	public @ResponseBody String editedColegio (@RequestParam String nombre
			, @RequestParam String direccion, @RequestParam int id) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request

		Colegio colegio = new Colegio();
                ColegioDAO colegiodao = new ColegioDAO();
		colegio.setNombre(nombre);
		colegio.setDireccion(direccion);
                colegiodao.updateColegio(nombre,direccion,id);
		//userRepository.save(n);
		return "Updated";
	}
        
    //Ruta con respuesta luego de eliminar un colegio     
    @GetMapping(path="/colegio/delete") // Map ONLY GET Requests
	public @ResponseBody String deletedColegio (@RequestParam int id) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request

                ColegioDAO colegiodao = new ColegioDAO();
                colegiodao.deleteColegio(id);
		//userRepository.save(n);
		return "Deleted";
	}
      
    //Rutas de profesor
    //Ruta con mantenedor de profesor  
    @RequestMapping(path="/profesor")
    public ModelAndView listProfesor(ModelAndView model) throws IOException{       
        ProfesorDAO profesor = new ProfesorDAO();
        ColegioDAO colegio = new ColegioDAO();
        List<Colegio> listColegio = colegio.leerAllColegio();
        List<Profesor> listProfesor = profesor.leerAllProfesores();
        List<Asignatura> listAsignatura = profesor.leerAllAsignaturas();
        model.addObject("listColegio", listColegio);
        model.addObject("listProfesor", listProfesor);
        model.addObject("listAsignatura",listAsignatura);
        model.setViewName("profesor");
        return model;
    }
    //Ruta con respuesta luego de insertar un profesor
    @GetMapping(path="/profesor/add") // Map ONLY GET Requests
	public @ResponseBody String addProfesor (@RequestParam String nombre,@RequestParam String fechanacimiento,
			@RequestParam int activo, @RequestParam int colegio, @RequestParam int asignatura) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request

		Profesor profesor = new Profesor();
                ProfesorDAO profesordao = new ProfesorDAO();
		profesor.setNombre(nombre);
                profesor.setFechaNacimiento(fechanacimiento);
                profesor.setActivo(activo);
                profesor.setColegio(colegio);
		profesor.setAsignatura(asignatura);
                profesordao.insertarProfesor(profesor);
		//userRepository.save(n);
		return "Saved";
	}
        
    //Ruta con formulario para editar un profesor   
    @GetMapping(path="/profesor/editprofesor") // Map ONLY GET Requests
	public ModelAndView editProfesor (@RequestParam int id, ModelAndView model) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request
                
                ProfesorDAO profesordao = new ProfesorDAO();
                ColegioDAO colegio = new ColegioDAO();
                Profesor c = profesordao.leerProfesor(id);
                List<Profesor> profesor = new ArrayList<>();
                profesor.add(c);
                model.addObject("profesor", profesor);
                model.setViewName("editprofesor");
                List<Colegio> listColegio = colegio.leerAllColegio();
                List<Asignatura> listAsignatura = profesordao.leerAllAsignaturas();
                model.addObject("listColegio", listColegio);
                model.addObject("listAsignatura",listAsignatura);

		return model;
	}
    
    //Ruta con respuesta luego de actualizar un profesor    
    @GetMapping(path="/profesor/edited") // Map ONLY GET Requests
	public @ResponseBody String editedProfesor (@RequestParam String nombre,
			@RequestParam int activo, @RequestParam int colegio, @RequestParam int asignatura, @RequestParam int id) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request

		Profesor profesor = new Profesor();
                ProfesorDAO profesordao = new ProfesorDAO();
                profesordao.updateProfesor(nombre,asignatura,activo,colegio,id);
		//userRepository.save(n);
		return "Updated";
	}
        
    //Ruta con respuesta luego de eliminar un colegio     
    @GetMapping(path="/profesor/delete") // Map ONLY GET Requests
	public @ResponseBody String deletedProfesor (@RequestParam int id) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request

                ProfesorDAO profesordao = new ProfesorDAO();
                profesordao.deleteProfesor(id);
		//userRepository.save(n);
		return "Deleted";
	}    
    
}
