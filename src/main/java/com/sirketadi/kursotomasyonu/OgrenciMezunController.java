package com.sirketadi.kursotomasyonu;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import Properties.Ogrenci;
import Utils.DB;

@Controller
public class OgrenciMezunController {
	
	@RequestMapping(value = "/ogrencimezundetay/{id}", method = RequestMethod.GET)
	public String ogrencimezundetay(@PathVariable(value = "id") String id, Model model, HttpServletRequest req) {
		
		String query = "select * from ogrencimezun where ogrid=" + id;

		List<Ogrenci> ol = ogrListesiMezun(query);
		Ogrenci ogr = ol.get(0);
		model.addAttribute("ogrDetay", ogr);

		return GirisController.denetim(req, "admin/ogrencimezundetay");
	}
	
	public List<Ogrenci> ogrListesiMezun(String query) {
		System.out.println(query);
		int i = 0;
		List<Ogrenci> lsOgrenci = new ArrayList<Ogrenci>();
		DB db = new DB();
		try {
			ResultSet rs = db.baglan().executeQuery(query);
			while (rs.next()) {
				Ogrenci ogr = new Ogrenci();
				i++;
				ogr.setOgrSira("" + i);
				ogr.setOgrID(rs.getString("ogrid"));
				ogr.setOgrTC(rs.getString("ogrtc"));
				ogr.setOgrAdi(rs.getString("ogradi"));
				ogr.setOgrSoyadi(rs.getString("ogrsoyadi"));
				ogr.setOgrDogumTarihi(rs.getString("ogrtarih"));
				ogr.setOgrTelefon(rs.getString("ogrtelefon"));
				ogr.setOgrEMail(rs.getString("ogrmail"));
				ogr.setOgrDurumu(rs.getString("ogrdurumu"));
				ogr.setOgrOkul(rs.getString("ogrokul"));
				ogr.setOgrBolum(rs.getString("ogrbolum"));
				ogr.setOgrDurumu(rs.getString("ogrdurumu"));
				ogr.setOgrAdres(rs.getString("ogradres"));
				ogr.setOgrKayitTarihi(rs.getString("ogrkayittarihi"));
				ogr.setOgrMezunTarihi(rs.getString("ogrmezuntarihi"));
				ogr.setOgrResimAdi(rs.getString("ogrresim"));
				ogr.setOgrSinifAdi(rs.getString("ogrsinifadi"));
				lsOgrenci.add(ogr);

			}
		} catch (Exception e) {
			System.err.println("Vt MEzun sÖðr Listeleme Hatasý");
		}
		return lsOgrenci;
	}

	
	@RequestMapping(value = "/ogrencimezunlar", method = RequestMethod.GET)
	public String ogrencimezunlar(Model model, HttpServletRequest req) {
		String query = "select * from ogrencimezun";
		SinifController snf = new SinifController();
		model.addAttribute("lsSiniflar", snf.tamSinifListesi());
		model.addAttribute("lsOgrenci", ogrListesiMezun(query));
		return GirisController.denetim(req, "admin/ogrencimezunlar");
	}
	public String ogrencimezunaramalistesi(String query) {
		System.out.println(query);
		List<Ogrenci> lsOgrenci = ogrListesiMezun(query);
		StringBuilder st = new StringBuilder();
		int i = 0;
		for (Ogrenci ogr : lsOgrenci) {
			st.append("<tr>");
			st.append("<td>" + i + "</td>");
			st.append("<td>" + ogr.getOgrTC() + "</td>");
			st.append("<td>" + ogr.getOgrAdi() + "</td>");
			st.append("<td>" + ogr.getOgrSoyadi() + "</td>");
			st.append("<td>" + ogr.getOgrDogumTarihi() + "</td>");
			st.append("<td>" + ogr.getOgrTelefon() + "</td>");
			st.append("<td>" + ogr.getOgrDurumu() + "</td>");
			st.append("<td>" + ogr.getOgrSinifAdi() + "</td>");
			st.append("<td><a href='ogrencimezundetay/" + ogr.getOgrID() + "' class='btn btn-warning'>Detay</a></td>");
			st.append("</tr>");
		}

		return st.toString();
	}

	
	@ResponseBody
	@RequestMapping(value = "/ogrencimezuntcara", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String ogrencimezuntcara(String ogrenciTC) {
		String query = "select * from ogrencimezun "
				+ "where ogrtc like '" + ogrenciTC + "%'";
		return ogrencimezunaramalistesi(query);
	}

	@ResponseBody
	@RequestMapping(value = "/ogrencimezunadiara", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String ogrencimezunadiara(String ogrenciAdi) {
		String query = "select * from ogrencimezun "
				+ " where ogradi like '" + ogrenciAdi + "%'";
		return ogrencimezunaramalistesi(query);
	}

	@ResponseBody
	@RequestMapping(value = "/ogrencimezunsinifara", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String ogrencimezunsinifara(String SinifAdi) {
		String query = "select * from ogrencimezun "
				+ " where ogrsinifadi = '" + SinifAdi + "%'";
		return ogrencimezunaramalistesi(query);
	}
}
