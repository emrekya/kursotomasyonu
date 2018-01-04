package com.sirketadi.kursotomasyonu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AnasayfaController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String anasayfa() {
		return "anasayfa";
	}
	
}
