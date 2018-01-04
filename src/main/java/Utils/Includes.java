package Utils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Includes {

	// css dosyalarýnýn olduðu bölüm
	@RequestMapping(value = "/css", method = RequestMethod.GET)
	public String cssCagir() {
		return "inc/css";
	}

	// js dosyalarýnýn olduðu bölüm
	@RequestMapping(value = "/js", method = RequestMethod.GET)
	public String jsCagir() {
		return "inc/js";
	}

	// header dosyalarýnýn olduðu bölüm
	@RequestMapping(value = "header", method = RequestMethod.GET)
	public String headerCagir() {
		return "inc/header";
	}

	// menu dosyalarýnýn olduðu bölüm
	@RequestMapping(value = "menu", method = RequestMethod.GET)
	public String menuCagir() {
		return "inc/menu";
	}

	// footer dosyalarýnýn olduðu bölüm
	@RequestMapping(value = "footer", method = RequestMethod.GET)
	public String footerCagir() {
		return "inc/footer";
	}
}
