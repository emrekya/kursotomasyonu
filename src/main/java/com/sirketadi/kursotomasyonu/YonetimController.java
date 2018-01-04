package com.sirketadi.kursotomasyonu;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class YonetimController {
	
	@RequestMapping(value = "/yonetim", method = RequestMethod.GET)
	public String yonetim(HttpServletRequest req) {
		
		
		return GirisController.denetim(req, "admin/yonetim");
	}

}
