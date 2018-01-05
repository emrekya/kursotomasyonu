package com.sirketadi.kursotomasyonu;

import java.sql.ResultSet;
import java.util.HashMap;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import Properties.Ogrenci;
import Utils.DB;

@Controller
public class YoklamaController {

	@RequestMapping(value = "/yoklamaal", method = RequestMethod.GET)
	public String yoklamaal(Model model, HttpServletRequest req) {

		SinifController snf = new SinifController();
		model.addAttribute("lsSiniflar", snf.tamSinifListesi());
		return GirisController.denetim(req, "admin/yoklamaal");
	}

	@ResponseBody
	@RequestMapping(value = "/yoklamasinifgetir", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String yoklamasinifgetir(String SinifAdi) {
		DB db=new DB();
		try {
			String yoklamaAlindimi="select count(*) as sonuc  from yoklamasinif where sinifid='"+SinifAdi+"' and tarih=DATE(now());";
			ResultSet rs = db.baglan().executeQuery(yoklamaAlindimi);
			rs.next();
			int sonuc=rs.getInt("sonuc");
			if(sonuc==1) {
				return "hata";
			}
		} catch (Exception e) {
			System.err.println("Vt sýnýf yoklama okuma hatasý:" + e);
		} finally {
			db.kapat();
		}
		
		
		String query = "select * from ogrenci left join siniflar on siniflar.sinifid=ogrenci.ogrsinifadi"
				+ " where ogrsinifadi = '" + SinifAdi + "%'";
		OgrenciController OgrCont = new OgrenciController();
		List<Ogrenci> lsOgrenci = OgrCont.ogrListesi(query);
		StringBuilder st = new StringBuilder();
		int i = 0;
		for (Ogrenci ogr : lsOgrenci) {
			i++;
			st.append("<tr>");
			st.append("<td>" + i + "</td>");
			st.append("<td>" + ogr.getOgrTC() + "</td>");
			st.append("<td>" + ogr.getOgrAdi() + "</td>");
			st.append("<td>" + ogr.getOgrSoyadi() + "</td>");
			st.append("<td><input type='radio' name='" + ogr.getOgrID() + "' value='geldi' checked></td>");
			st.append("<td><input type='radio' name='" + ogr.getOgrID() + "' value='gelmedi'></td>");
			st.append("<td><input type='radio' name='" + ogr.getOgrID() + "' value='raporlu'></td>");
			st.append("<td><input type='radio' name='" + ogr.getOgrID() + "' value='izinli'></td>");
			st.append("</tr>");
		}

		return st.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/yoklamasinifgetir2", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String yoklamasinifgeti2r(String SinifAdi) {
		String query = "select * from ogrenci left join siniflar on siniflar.sinifid=ogrenci.ogrsinifadi"
				+ " where ogrsinifadi = '" + SinifAdi + "%'";
		OgrenciController OgrCont = new OgrenciController();
		List<Ogrenci> lsOgrenci = OgrCont.ogrListesi(query);
		StringBuilder st = new StringBuilder();
		int i = 0;
		for (Ogrenci ogr : lsOgrenci) {
			i++;
			st.append("<tr>");
			st.append("<td>" + i + "</td>");
			st.append("<td>" + ogr.getOgrTC() + "</td>");
			st.append("<td>" + ogr.getOgrAdi() + "</td>");
			st.append("<td>" + ogr.getOgrSoyadi() + "</td>");
			st.append("<td><input type='radio' name='" + ogr.getOgrID() + "' value='geldi' checked></td>");
			st.append("<td><input type='radio' name='" + ogr.getOgrID() + "' value='gelmedi'></td>");
			st.append("<td><input type='radio' name='" + ogr.getOgrID() + "' value='raporlu'></td>");
			st.append("<td><input type='radio' name='" + ogr.getOgrID() + "' value='izinli'></td>");
			st.append("</tr>");
		}

		return st.toString();
	}
	
	@RequestMapping(value = "/yoklamakaydet/{sinifId}", method = RequestMethod.GET)
	public String yoklamakaydet(@RequestParam HashMap<String, String> secimler,
			@PathVariable(value = "sinifId") String sinifId, Model model, HttpServletRequest req) {
		DB db = new DB();
		for (String id : secimler.keySet()) {
			try {
				String query = "INSERT INTO `yoklama` (`yoklamaid`, `ogrenciid`, `gelmedigitarih`, `gelmemesebebi`) VALUES (NULL, '"
						+ id + "', now(), '" + secimler.get(id) + "');";
				int kaydet = db.baglan().executeUpdate(query);
				if (kaydet > 0) {
					System.out.println("kayýt baþarýlý");
				} else {
					System.out.println("kayýt hatasý");
				}

			} catch (Exception e) {
				System.err.println("Vt yoklama yazma hatasý:" + e);
			} finally {
				db.kapat();
			}
		}
		try {
			String query = "INSERT INTO `yoklamasinif` (`id`, `sinifid`, `tarih`) VALUES (NULL, '" + sinifId
					+ "', now());";
			int kaydet = db.baglan().executeUpdate(query);
			if (kaydet > 0) {
				System.out.println("sýnýf yoklama kayýt baþarýlý");
			} else {
				System.out.println("sýnýf yoklama kayýt hatasý");
			}
		} catch (Exception e) {
			System.err.println("Vt sýnýf yoklama yazma hatasý:" + e);
		} finally {
			db.kapat();
		}
		return GirisController.denetim(req, "redirect:/yoklamaal");
	}
}
