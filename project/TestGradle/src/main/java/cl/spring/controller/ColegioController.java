/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.spring.controller;

import cl.spring.dao.ColegioDAO;
import cl.spring.model.Colegio;
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
public class ColegioController {   
    @Autowired
    public ColegioDAO colegiodao;
    
    //Ruta con mantenedor de colegio       
    @RequestMapping(path="/colegio")
    public ModelAndView listColegio(ModelAndView model) throws IOException{       
        List<Colegio> listColegio = colegiodao.leerAllColegio();
        JSONArray jsonarray = new JSONArray(listColegio);
        model.addObject("listColegio", jsonarray);
        model.setViewName("colegio");
        return model;
    }
    
    //Ruta con respuesta luego de insertar un colegio
    @RequestMapping(path="/colegio/add", method=RequestMethod.POST)
	public @ResponseBody String addColegio (@RequestParam String nombre
			, @RequestParam String direccion) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request

		Colegio colegio = new Colegio();
		colegio.setNombre(nombre);
		colegio.setDireccion(direccion);
                colegiodao.insertarColegio(colegio);
		return "Saved";
	}
        
    //Ruta con formulario para editar un colegio   
    @GetMapping(path="/colegio/editcolegio") // Map ONLY GET Requests
	public ModelAndView editColegio (@RequestParam int id, ModelAndView model) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request
                
                Colegio c = colegiodao.leerColegio(id);
                List<Colegio> colegio = new ArrayList<>();
                colegio.add(c);
                model.addObject("colegio", colegio);
                model.setViewName("editcolegio");
		return model;
	}
    
    //Ruta con respuesta luego de actualizar un colegio    
    @RequestMapping(path="/colegio/edited",method=RequestMethod.POST)
	public @ResponseBody String editedColegio (@RequestParam String nombre
			, @RequestParam String direccion, @RequestParam int id) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request

		Colegio colegio = new Colegio();
		colegio.setNombre(nombre);
		colegio.setDireccion(direccion);
                colegiodao.updateColegio(nombre,direccion,id);
		return "Updated";
	}
        
    //Ruta con respuesta luego de eliminar un colegio     
    @GetMapping(path="/colegio/delete") // Map ONLY GET Requests
	public @ResponseBody String deletedColegio (@RequestParam int id) {
		// @ResponseBody means the returned String is the response, not a view name
		// @RequestParam means it is a parameter from the GET or POST request

                colegiodao.deleteColegio(id);
		return "Deleted";
        }    
}
