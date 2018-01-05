package com.sirketadi.kursotomasyonu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import Properties.Ogrenci;
import Properties.Siniflar;
import Utils.DB;

@Controller
public class OgrenciController {

	@RequestMapping(value = "/ogrenciekle", method = RequestMethod.GET)
	public String eklme(Model model, HttpServletRequest req) {

		SinifController snf = new SinifController();
		model.addAttribute("lsSiniflar", snf.tamSinifListesi());
		return GirisController.denetim(req, "admin/ogrenciekle");
	}

	public List<Ogrenci> ogrListesi(String query) {
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
				ogr.setOgrSinifAdi(rs.getString("siniflar.sinifadi"));
				ogr.setOgrOkul(rs.getString("ogrokul"));
				ogr.setOgrBolum(rs.getString("ogrbolum"));
				ogr.setOgrDurumu(rs.getString("ogrdurumu"));
				ogr.setOgrAdres(rs.getString("ogradres"));
				ogr.setOgrKayitTarihi(rs.getString("ogrkayittarihi"));
				ogr.setOgrMezunTarihi(rs.getString("ogrmezuntarihi"));
				ogr.setOgrResimAdi(rs.getString("ogrresim"));

				lsOgrenci.add(ogr);

			}
		} catch (Exception e) {
			System.err.println("Vt Öðr Listeleme Hatasý");
		}
		return lsOgrenci;
	}

	@RequestMapping(value = "/ogrencilistesi", method = RequestMethod.GET)
	public String listele(Model model, HttpServletRequest req) {
		String query = "select * from ogrenci " + "left join siniflar on siniflar.sinifid=ogrenci.ogrsinifadi";
		SinifController snf = new SinifController();
		model.addAttribute("lsSiniflar", snf.tamSinifListesi());
		model.addAttribute("lsOgrenci", ogrListesi(query));
		return GirisController.denetim(req, "admin/ogrencilistesi");
	}

	@RequestMapping(value = "/ogrenciguncelleme", method = RequestMethod.GET)
	public String guncelle(Model model, HttpServletRequest req) {
		String query = "select * from siniflar";
		List<Siniflar> lsSiniflar = new ArrayList<Siniflar>();
		DB db = new DB();
		try {
			ResultSet rs = db.baglan().executeQuery(query);
			while (rs.next()) {
				Siniflar sinif = new Siniflar();
				sinif.setSinifId(rs.getString("sinifid"));
				sinif.setSinifAdi(rs.getString("sinifadi"));
				lsSiniflar.add(sinif);

			}
		} catch (Exception e) {
			System.err.println("vt sinif hatasý");
		}
		model.addAttribute("lsSiniflar", lsSiniflar);

		return GirisController.denetim(req, "admin/ogrenciguncelleme");
	}

	@RequestMapping(value = "/ogrencidetay/{id}", method = RequestMethod.GET)
	public String ogrencidetay(@PathVariable(value = "id") String id, Model model, HttpServletRequest req) {

		String query = "select * from ogrenci left join siniflar on siniflar.sinifid=ogrenci.ogrsinifadi where ogrid="
				+ id;

		List<Ogrenci> ol = ogrListesi(query);
		System.out.println(ol.get(0).getOgrAdi());
		Ogrenci ogr = ol.get(0);
		model.addAttribute("ogrDetay", ogr);

		return GirisController.denetim(req, "admin/ogrencidetay");
	}

	@ResponseBody
	@RequestMapping(value = "/ogrencikaydet", method = RequestMethod.POST)
	public String ogrencikaydet(Ogrenci ogrenci) {
		DB db = new DB();
		String query = "INSERT INTO `ogrenci`  (`ogrid`, `ogrtc`, `ogradi`, `ogrsoyadi`, `ogrtarih`, `ogrtelefon`, `ogrmail`, `ogrokul`,`ogrbolum`,`ogrdurumu`, `ogradres` ,`ogrsinifadi`,`ogrkayittarihi`) VALUES (NULL, '"
				+ ogrenci.getOgrTC() + "', '" + ogrenci.getOgrAdi() + "', '" + ogrenci.getOgrSoyadi() + "', '"
				+ ogrenci.getOgrDogumTarihi() + "', '" + ogrenci.getOgrTelefon() + "', '" + ogrenci.getOgrEMail()
				+ "', '" + ogrenci.getOgrOkul() + "', '" + ogrenci.getOgrBolum() + "', '" + ogrenci.getOgrDurumu()
				+ "', '" + ogrenci.getOgrAdres() + "', '" + ogrenci.getOgrSinifAdi() + "','"
				+ ogrenci.getOgrKayitTarihi() + "')";

		System.out.println(query);
		try {

			int ekle = db.baglan().executeUpdate(query);
			if (ekle > 0) {
				return "true";
			} else {
				return "false";
			}
		} catch (Exception e) {
			return "false" + e;
		} finally {
			db.kapat();
		}

	}

	public String ogrenciaramalistesi(String query) {
		List<Ogrenci> lsOgrenci = ogrListesi(query);
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
			st.append("<td>" + ogr.getOgrEMail() + "</td>");
			st.append("<td>" + ogr.getOgrDurumu() + "</td>");
			st.append("<td>" + ogr.getOgrSinifAdi() + "</td>");
			st.append("<td><a href='ogrencidetay/" + ogr.getOgrID() + "' class='btn btn-warning'>Detay</a></td>");
			st.append(
					"<td><a href='ogrenciguncelleme/" + ogr.getOgrID() + "' class='btn btn-warning'>Düzenle</a></td>");
			st.append("</tr>");

		}

		return st.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/ogrencitcara", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String ogrencitcara(String ogrenciTC) {
		String query = "select * from ogrenci  left join siniflar on siniflar.sinifid=ogrenci.ogrsinifadi "
				+ "where ogrtc like '" + ogrenciTC + "%'";
		return ogrenciaramalistesi(query);
	}

	@ResponseBody
	@RequestMapping(value = "/ogrenciadiara", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String ogrenciadiara(String ogrenciAdi) {
		String query = "select * from ogrenci left join siniflar on siniflar.sinifid=ogrenci.ogrsinifadi"
				+ " where ogradi like '" + ogrenciAdi + "%'";
		return ogrenciaramalistesi(query);
	}

	@ResponseBody
	@RequestMapping(value = "/ogrencisinifara", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String ogrencisinifara(String SinifAdi) {
		String query = "select * from ogrenci left join siniflar on siniflar.sinifid=ogrenci.ogrsinifadi"
				+ " where ogrsinifadi = '" + SinifAdi + "%'";
		return ogrenciaramalistesi(query);
	}

	@RequestMapping(value = "/ogrenciguncelleme/{id}", method = RequestMethod.GET)
	public String ogrenciguncelleme(@PathVariable(value = "id") String id, Model model, HttpServletRequest req) {
		String query = "select * from ogrenci left join siniflar on siniflar.sinifid=ogrenci.ogrsinifadi where ogrid="
				+ id;

		List<Ogrenci> ol = ogrListesi(query);
		Ogrenci ogr = ol.get(0);
		model.addAttribute("ogrDetay", ogr);

		SinifController snf = new SinifController();
		model.addAttribute("lsSiniflar", snf.tamSinifListesi());
		return GirisController.denetim(req, "admin/ogrenciguncelleme");
	}

	@ResponseBody
	@RequestMapping(value = "/ogrenciguncellekaydet", method = RequestMethod.POST)
	public String ogrenciguncellekaydet(Ogrenci ogrenci) {
		DB db = new DB();
		String query = "UPDATE `ogrenci` SET `ogrtelefon` = '" + ogrenci.getOgrTelefon() + "', `ogrmail` = '"
				+ ogrenci.getOgrEMail() + "', `ogrokul` = '" + ogrenci.getOgrOkul() + "', `ogrbolum` = '"
				+ ogrenci.getOgrBolum() + "', `ogrdurumu` = '" + ogrenci.getOgrDurumu() + "', `ogradres` = '"
				+ ogrenci.getOgrAdres() + "', `ogrsinifadi` = '" + ogrenci.getOgrSinifAdi()
				+ "' WHERE `ogrenci`.`ogrid` = '" + ogrenci.getOgrID() + "';";

		System.out.println(query);
		try {

			int guncelle = db.baglan().executeUpdate(query);
			if (guncelle > 0) {
				return "Guncelleme Basarili";
			} else {
				return "Guncelleme Hatasi";
			}
		} catch (Exception e) {
			return "Vt Guncelleme Hatasi : " + e;
		} finally {
			db.kapat();
		}

	}

	@RequestMapping(value = "/ogrencimezun", method = RequestMethod.GET)
	public String ogrencimezun(Model model, HttpServletRequest req) {
		String query = "select * from ogrenci " + "left join siniflar on siniflar.sinifid=ogrenci.ogrsinifadi";
		SinifController snf = new SinifController();
		model.addAttribute("lsSiniflar", snf.tamSinifListesi());
		model.addAttribute("lsOgrenci", ogrListesi(query));

		return GirisController.denetim(req, "admin/ogrencimezun");
	}

	
	public void ogrenciMezunOldu(String id) {
		String query = "select * from ogrenci left join siniflar on siniflar.sinifid=ogrenci.ogrsinifadi where ogrid="
				+ id;
		List<Ogrenci> ol = ogrListesi(query);

		Ogrenci ogr = ol.get(0);
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();
		System.out.println(dateFormat.format(date));
		DB db = new DB();
		String querymezunekle = "INSERT INTO `ogrencimezun`  (`ogrid`, `ogrtc`, `ogradi`, `ogrsoyadi`, `ogrtarih`, `ogrtelefon`, `ogrmail`, `ogrokul`,`ogrbolum`,`ogrdurumu`, `ogradres` ,`ogrsinifadi`,`ogrkayittarihi`,`ogrmezuntarihi`,`ogrresim`) VALUES (NULL, '"
				+ ogr.getOgrTC() + "', '" + ogr.getOgrAdi() + "', '" + ogr.getOgrSoyadi() + "', '"
				+ ogr.getOgrDogumTarihi() + "', '" + ogr.getOgrTelefon() + "', '" + ogr.getOgrEMail() + "', '"
				+ ogr.getOgrOkul() + "', '" + ogr.getOgrBolum() + "', '" + ogr.getOgrDurumu() + "', '"
				+ ogr.getOgrAdres() + "', '" + ogr.getOgrSinifAdi() + "','" + ogr.getOgrKayitTarihi() + "','"
				+ dateFormat.format(date) + "'," + ogr.getOgrResimAdi() + ")";
		System.out.println(querymezunekle);
		try {
			int ekle = db.baglan().executeUpdate(querymezunekle);
			if (ekle > 0) {
				db.kapat();
				String queryMezunSil = "delete from ogrenci where ogrid=" + id;
				int sil = db.baglan().executeUpdate(queryMezunSil);
				if (sil > 0) {
					System.err.println("iþlem tamamlandý");
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			db.kapat();
		}
	}
	
	@RequestMapping(value = "/ogrencimezunet/{id}", method = RequestMethod.GET)
	public String ogrencimezunet(@PathVariable(value = "id") String id, Model model, HttpServletRequest req) {
		ogrenciMezunOldu(id);
		return GirisController.denetim(req, "redirect:/ogrencimezun");
	}

	@RequestMapping(value = "/ogrencisecimmezun", method = RequestMethod.POST)
	public String ogrencimezunet(@RequestParam("mezunoldu") String[] secimler,Model model, HttpServletRequest req) {
			for (String id : secimler) {
				ogrenciMezunOldu(id);
			} 
		return GirisController.denetim(req, "redirect:/ogrencimezun");
	}
	
	
	public String ogrencimezunolacakaramalistesi(String query) {
		System.out.println(query);
		List<Ogrenci> lsOgrenci = ogrListesi(query);
		StringBuilder st = new StringBuilder();
		int i = 0;
		for (Ogrenci ogr : lsOgrenci) {
			st.append("<tr>");
			st.append("<td><input type='checkbox' name='mezunoldu' value='"+  ogr.getOgrID() + "'></td>");
			st.append("<td>" + i + "</td>");
			st.append("<td>" + ogr.getOgrTC() + "</td>");
			st.append("<td>" + ogr.getOgrAdi() + "</td>");
			st.append("<td>" + ogr.getOgrSoyadi() + "</td>");
			st.append("<td>" + ogr.getOgrDogumTarihi() + "</td>");
			st.append("<td>" + ogr.getOgrTelefon() + "</td>");
			st.append("<td>" + ogr.getOgrDurumu() + "</td>");
			st.append("<td>" + ogr.getOgrSinifAdi() + "</td>");
			st.append("<td><a href='ogrencidetay/" + ogr.getOgrID() + "' class='btn btn-warning'>Detay</a></td>");
			st.append("<td><a href='ogrencimezunet/"+ ogr.getOgrID()+ "' class='btn btn-success'>Mezun Et</a></td>");
			st.append("</tr>");

		}

		return st.toString();
	}

	
	@ResponseBody
	@RequestMapping(value = "/ogrencimezunolacaktcara", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String ogrencimezunolacaktcara(String ogrenciTC) {
		String query = "select * from ogrenci  left join siniflar on siniflar.sinifid=ogrenci.ogrsinifadi "
				+ "where ogrtc like '" + ogrenciTC + "%'";
		return ogrencimezunolacakaramalistesi(query);
	}

	@ResponseBody
	@RequestMapping(value = "/ogrencimezunolacakadiara", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String ogrencimezunolacakadiara(String ogrenciAdi) {
		String query = "select * from ogrenci left join siniflar on siniflar.sinifid=ogrenci.ogrsinifadi"
				+ " where ogradi like '" + ogrenciAdi + "%'";
		return ogrencimezunolacakaramalistesi(query);
	}

	@ResponseBody
	@RequestMapping(value = "/ogrencimezunolacaksinifara", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String ogrencimezunolacaksinifara(String SinifAdi) {
		String query = "select * from ogrenci left join siniflar on siniflar.sinifid=ogrenci.ogrsinifadi"
				+ " where ogrsinifadi = '" + SinifAdi + "%'";
		return ogrencimezunolacakaramalistesi(query);
	}
	
	
	
}
