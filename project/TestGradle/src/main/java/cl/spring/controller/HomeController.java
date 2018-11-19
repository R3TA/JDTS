/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Martin
 */
@Controller   
public class HomeController {

@RequestMapping(path="/")
	public ModelAndView welcomePage() {
		return new ModelAndView("welcome");
	}       
}
