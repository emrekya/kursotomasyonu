package com.sirketadi.kursotomasyonu;

import java.sql.ResultSet;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Utils.DB;

@Controller
public class GirisController {

	@RequestMapping(value = "/giris", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "admin/giris";
	}

	@RequestMapping(value = "/girisyap", method = RequestMethod.POST)
	public String girisyap(Model model, String tcKimlik, String sifre, HttpServletRequest req) {
		String query = "select * from personel " +
				"where pertc='" + tcKimlik + "' && persifre='" + sifre + "'";
		DB db = new DB();
		try {

			ResultSet rs = db.baglan().executeQuery(query);
			rs.next();
			String perid = rs.getString("perid");
			String pergorev = rs.getString("pergorev");
			String tc = rs.getString("pertc");
			String resimadi = rs.getString("perresimadi");
			String kuladi = rs.getString("peradi");
			String kulsoyadi = rs.getString("persoyadi");
			String brans = rs.getString("perbrans");
			if (perid != null) {
				req.getSession().setAttribute("kullanici", perid);
				req.getSession().setAttribute("gorev", pergorev);
				req.getSession().setAttribute("kuladi", kuladi);
				req.getSession().setAttribute("kulsoyadi", kulsoyadi);
				req.getSession().setAttribute("brans", brans);
				req.getSession().setAttribute("tc", tc);
				req.getSession().setAttribute("resimadi", resimadi);
				return "redirect:/yonetim";
			}
		} catch (Exception e) {
			System.out.println("Giriþ Vt Hatasý" + e);
		} finally {
			db.kapat();
		}
		model.addAttribute("durum", "Kullanýcý Adý yada Þifre Hatalý");
		return "admin/giris";

	}

	public static String denetim(HttpServletRequest req, String sayfa) {

		// cerez denetimi yapýlýyor
		/*
		 * Cookie[] cDizi = req.getCookies(); for(int i =0; i <cDizi.length; i++) {
		 * if(cDizi[i].getName().equals("kulcerez")) { //çerez var String kuladata =
		 * cDizi[i].getValue(); req.getSession().setAttribute("kulid", kuladata); break;
		 * } }
		 */

		boolean durum = req.getSession().getAttribute("kullanici") != null;
		if (durum == false) {
			return "redirect:/giris";
		}
		return sayfa;
	}

	public static String yetkiDenetim(HttpServletRequest req, String sayfa) {
		String yetki = "" + req.getSession().getAttribute("gorev");
		if (yetki.equals("Admin")) {
			return GirisController.denetim(req, "admin" + sayfa);
		} else if (yetki.equals("Müdür")) {
			return GirisController.denetim(req, "admin" + sayfa);
		} else if (yetki.equals("Müdür Yardýmcýsý")) {
			return GirisController.denetim(req, "admin" + sayfa);
		} else {
			return GirisController.denetim(req, "redirect:/yonetim");
		}
	}
	
	@RequestMapping(value = "/cikisyap", method = RequestMethod.GET)
	public String cikisyap(HttpServletRequest req) {
		req.getSession().invalidate();
		return "redirect:/giris";
	}
}
