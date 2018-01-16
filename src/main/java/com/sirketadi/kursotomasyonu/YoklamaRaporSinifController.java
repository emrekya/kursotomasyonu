package com.sirketadi.kursotomasyonu;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class YoklamaRaporSinifController {
	
	@RequestMapping(value = "/yoklamaraporsiniflistesi", method = RequestMethod.GET)
	public String yoklamaraporsiniflistesi(Model model, HttpServletRequest req) {
		SinifController snf = new SinifController();
		model.addAttribute("lsSiniflar", snf.tamSinifListesi());
		return GirisController.denetim(req, "admin/yoklamaraporsiniflistesi");
	}
}
