
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
import Properties.Personel;
import Utils.DB;

@Controller
public class PersonelController {
	DB db = new DB();

	@RequestMapping(value = "/personelekleme", method = RequestMethod.GET)
	public String home(HttpServletRequest req, Model model) {

		String[] path = PersonelController.class.getProtectionDomain().getCodeSource().getLocation().getPath()
				.split("KursOtomasyon");
		String imgPath = path[0] + "KursOtomasyon/resources/dist/img/";
		model.addAttribute("imgPath", imgPath.substring(1));

		return GirisController.yetkiDenetim(req, "/personelekleme");

	}

	// silme işlemi
	@RequestMapping(value = "/personelsilme/{id}", method = RequestMethod.GET)
	public String aracsil(@PathVariable(value = "id") String id, Model model) {
		try {
			DB db = new DB();
			String q = "delete from personel where perid ='" + id + "'";
			int sil = db.baglan().executeUpdate(q);
			if (sil > 0) {
				return "redirect:/personellistesi";
			}
		} catch (Exception e) {
			System.err.println("Silme Hatası : " + e);
		}

		return "redirect:/kullanici";
	}

	@ResponseBody
	@RequestMapping(value = "/personelkaydet", method = RequestMethod.POST)
	public String personelkaydet(Personel personel, HttpServletRequest req) {
		String yetki = "" + req.getSession().getAttribute("gorev");
		String personelGorev = "";
		if (yetki.equals("Admin")) {
			personelGorev = "2";
		} else if (yetki.equals("Müdür")) {
			personelGorev = "3";
		} else if (yetki.equals("Müdür Yardımcısı")) {
			personelGorev = "4";
		} else {
			return "Kayıt yapma Yetkiniz yok";
		}
		String query = "INSERT INTO `personel` (`perid`, `pertc`, `peradi`, `persoyadi`, `perdogumtarihi`, `pertelefon`, `peremail`, `peradres`, `perogrenimdurumu`, `perbitirdigiokul`, `perbrans`, `perbankaadi`, `periban`,`permaas`, `pergorev`,`persifre`,`peraktiflik`) VALUES (NULL, '"
				+ personel.getPerTC() + "', '" + personel.getPerAdi() + "', '" + personel.getPerSoyadi() + "', '"
				+ personel.getPerDogumTarihi() + "', '" + personel.getPerTelefon() + "', '" + personel.getPerEMail()
				+ "', '" + personel.getPerAdres() + "', '" + personel.getPerOgrenimDurumu() + "', '"
				+ personel.getPerBitirdigiOkul() + "', '" + personel.getPerBrans() + "', '" + personel.getPerBankaAdi()
				+ "', '" + personel.getPerIBAN() + "','" + personel.getPerMaas() + "','" + personelGorev + "','"
				+ personel.getPerSifre() + "',true);";
		System.out.println(query);
		try {
			int ekle = db.baglan().executeUpdate(query);
			if (ekle > 0) {
				return "true";
			} else {
				return "false";
			}
		} catch (Exception e) {
			return "Vt Kayıt Hatası : " + e;
		} finally {
			db.kapat();
		}

	}

	@RequestMapping(value = "/personellistesi", method = RequestMethod.GET)
	public String personellistesi(HttpServletRequest req, Model model) {
		String query = "Select * from personel";
		model.addAttribute("personelListesi", perListesi(query));

		return GirisController.yetkiDenetim(req, "/personellistesi");

	}

	@ResponseBody
	@RequestMapping(value = "/personeltcara", method = RequestMethod.POST)
	public String personeltcara(String personelTC) {

		String query = "select * from personel where pertc like '" + personelTC + "%'";

		List<Personel> lsPersonel = perListesi(query);
		StringBuilder st = new StringBuilder();
		for (Personel per : lsPersonel) {
			st.append("<tr>");
			st.append("<td>" + "</td>");
			st.append("<td>" + per.getPerTC() + "</td>");
			st.append("<td>" + per.getPerAdi() + "</td>");
			st.append("<td>" + per.getPerSoyadi() + "</td>");
			st.append("<td>" + per.getPerTelefon() + "</td>");
			st.append("<td>" + per.getPerBrans() + "</td>");
			st.append("<td>" + per.getPerGorev() + "</td>");

			st.append("</tr>");

			// st.append("<tr> <td></td> <td>324567865</td> <td>sdfg</td> <td>dsfg</td>
			// <td>345354345</td> <td>sdfdsfsdfe45</td> <td>sdfsdfsd</td> <td>ilkokul</td>
			// </tr>");
		}

		return personelaramalistesi(query);
	}

	@ResponseBody
	@RequestMapping(value = "/personeladiara", method = RequestMethod.POST)
	public String personeladiara(String personelAdi) {

		String query = "select * from personel where peradi like '" + personelAdi + "%'";
		List<Personel> lsPersonel = perListesi(query);
		StringBuilder st = new StringBuilder();

		for (Personel per : lsPersonel) {
			st.append("<tr>");
			st.append("<td>" + per.getPerSira() + "</td>");
			st.append("<td>" + per.getPerTC() + "</td>");
			st.append("<td>" + per.getPerAdi() + "</td>");
			st.append("<td>" + per.getPerSoyadi() + "</td>");
			st.append("<td>" + per.getPerTelefon() + "</td>");
			st.append("<td>" + per.getPerBrans() + "</td>");
			st.append("<td>" + per.getPerGorev() + "</td>");

			st.append("</tr>");

			// st.append("<tr> <td></td> <td>324567865</td> <td>sdfg</td> <td>dsfg</td>
			// <td>345354345</td> <td>sdfdsfsdfe45</td> <td>sdfsdfsd</td> <td>ilkokul</td>
			// </tr>");
		}

		return personelaramalistesi(query);
	}

	private List<Personel> perListesi(String query) {
		List<Personel> lsPersonel = new ArrayList<Personel>();
		DB db = new DB();

		try {
			ResultSet rs = db.baglan().executeQuery(query);
			int i = 0;
			while (rs.next()) {
				Personel per = new Personel();
				i++;
				per.setPerSira("" + i);
				per.setPerID(rs.getString("perid"));
				per.setPerTC(rs.getString("pertc"));
				per.setPerAdi(rs.getString("peradi"));
				per.setPerSoyadi(rs.getString("persoyadi"));
				per.setPerDogumTarihi(rs.getString("perdogumtarihi"));
				per.setPerTelefon(rs.getString("pertelefon"));
				per.setPerEMail(rs.getString("peremail"));
				per.setPerAdres(rs.getString("peradres"));
				per.setPerOgrenimDurumu(rs.getString("perogrenimdurumu"));
				per.setPerBitirdigiOkul(rs.getString("perbitirdigiokul"));
				per.setPerBrans(rs.getString("perbrans"));
				per.setPerBankaAdi(rs.getString("perbankaadi"));
				per.setPerIBAN(rs.getString("periban"));
				per.setPerMaas(rs.getString("permaas"));
				per.setPerGorev(rs.getString("pergorev"));
				per.setPerSifre(rs.getString("persifre"));
				per.setPerResimAdi(rs.getString("perresimadi"));
				per.setPerAktiflik(rs.getString("peraktiflik"));
				lsPersonel.add(per);
			}
		} catch (Exception e) {
			System.err.println("Vt Per Listeleme Hatası");
		}
		return lsPersonel;
	}

	@RequestMapping(value = "/personeldetay/{id}", method = RequestMethod.GET)
	public String personeldetay(@PathVariable(value = "id") String id, Model model, HttpServletRequest req) {

		String query = "select * from personel where perid=" + id;
		DB db = new DB();
		Personel per = new Personel();
		try {
			ResultSet rs = db.baglan().executeQuery(query);
			rs.next();

			per.setPerID(rs.getString("perid"));
			per.setPerTC(rs.getString("pertc"));
			per.setPerAdi(rs.getString("peradi"));
			per.setPerSoyadi(rs.getString("persoyadi"));
			per.setPerDogumTarihi(rs.getString("perdogumtarihi"));
			per.setPerTelefon(rs.getString("pertelefon"));
			per.setPerEMail(rs.getString("peremail"));
			per.setPerAdres(rs.getString("peradres"));
			per.setPerOgrenimDurumu(rs.getString("perogrenimdurumu"));
			per.setPerBitirdigiOkul(rs.getString("perbitirdigiokul"));
			per.setPerBrans(rs.getString("perbrans"));
			per.setPerBankaAdi(rs.getString("perbankaadi"));
			per.setPerIBAN(rs.getString("periban"));
			per.setPerMaas(rs.getString("permaas"));
			per.setPerGorev(rs.getString("pergorev"));
			per.setPerSifre(rs.getString("persifre"));
			per.setPerResimAdi(rs.getString("perresimadi"));

		} catch (Exception e) {
			System.err.println("Vt Per detay Hatası");
		}
		model.addAttribute("perduzenle", per);

		return GirisController.yetkiDenetim(req, "/personeldetay");
	}

	@RequestMapping(value = "/personelguncelleme/{id}", method = RequestMethod.GET)
	public String personelguncelleme(@PathVariable(value = "id") String id, Model model, HttpServletRequest req) {

		String query = "select * from personel where perid=" + id;
		DB db = new DB();
		Personel per = new Personel();
		try {
			ResultSet rs = db.baglan().executeQuery(query);
			rs.next();

			per.setPerID(rs.getString("perid"));
			per.setPerTC(rs.getString("pertc"));
			per.setPerAdi(rs.getString("peradi"));
			per.setPerSoyadi(rs.getString("persoyadi"));
			per.setPerDogumTarihi(rs.getString("perdogumtarihi"));
			per.setPerTelefon(rs.getString("pertelefon"));
			per.setPerEMail(rs.getString("peremail"));
			per.setPerAdres(rs.getString("peradres"));
			per.setPerOgrenimDurumu(rs.getString("perogrenimdurumu"));
			per.setPerBitirdigiOkul(rs.getString("perbitirdigiokul"));
			per.setPerBrans(rs.getString("perbrans"));
			per.setPerBankaAdi(rs.getString("perbankaadi"));
			per.setPerIBAN(rs.getString("periban"));
			per.setPerMaas(rs.getString("permaas"));
			per.setPerGorev(rs.getString("pergorev"));
			per.setPerSifre(rs.getString("persifre"));
			per.setPerResimAdi(rs.getString("perresimadi"));

		} catch (Exception e) {
			System.err.println("Vt Per Listeleme Hatası");
		}
		model.addAttribute("perduzenle", per);

		return GirisController.yetkiDenetim(req, "/personelguncelleme");
	}

	@ResponseBody
	@RequestMapping(value = "/personelguncellekaydet", method = RequestMethod.POST)
	public String personelguncellekaydet(Personel personel) {
		DB db = new DB();
		String query = "UPDATE `personel` SET `peradi` =  '" + personel.getPerAdi() + "', `persoyadi` = '"
				+ personel.getPerSoyadi() + "', `perdogumtarihi` = '" + personel.getPerDogumTarihi()
				+ "', `pertelefon` = '" + personel.getPerTelefon() + "', `peremail` = '" + personel.getPerEMail()
				+ "', `peradres` = '" + personel.getPerAdres() + "', `perogrenimdurumu` = '"
				+ personel.getPerOgrenimDurumu() + "', `perbitirdigiokul` = '" + personel.getPerBitirdigiOkul()
				+ "', `perbrans` = '" + personel.getPerBrans() + "', `perbankaadi` = '" + personel.getPerBankaAdi()
				+ "', `periban` = '" + personel.getPerIBAN() + "', `permaas` = '" + personel.getPerMaas()
				+ "', `pergorev` = '4', `persifre` = '" + personel.getPerSifre() + "' WHERE `personel`.`perid` = '"
				+ personel.getPerID() + "'";
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

	@RequestMapping(value = "/personelbilgisi", method = RequestMethod.GET)
	public String personelbilgisi(Model model, HttpServletRequest req) {
		String kullaniciid = "" + req.getSession().getAttribute("kullanici");
		String query = "select * from personel where perid=" + kullaniciid;
		DB db = new DB();
		Personel per = new Personel();
		try {
			ResultSet rs = db.baglan().executeQuery(query);
			rs.next();

			per.setPerID(rs.getString("perid"));
			per.setPerTC(rs.getString("pertc"));
			per.setPerAdi(rs.getString("peradi"));
			per.setPerSoyadi(rs.getString("persoyadi"));
			per.setPerDogumTarihi(rs.getString("perdogumtarihi"));
			per.setPerTelefon(rs.getString("pertelefon"));
			per.setPerEMail(rs.getString("peremail"));
			per.setPerAdres(rs.getString("peradres"));
			per.setPerOgrenimDurumu(rs.getString("perogrenimdurumu"));
			per.setPerBitirdigiOkul(rs.getString("perbitirdigiokul"));
			per.setPerBrans(rs.getString("perbrans"));
			per.setPerBankaAdi(rs.getString("perbankaadi"));
			per.setPerIBAN(rs.getString("periban"));
			per.setPerMaas(rs.getString("permaas"));
			per.setPerGorev(rs.getString("pergorev"));
			per.setPerSifre(rs.getString("persifre"));
			per.setPerResimAdi(rs.getString("perresimadi"));

		} catch (Exception e) {
			System.err.println("Vt Per Listeleme Hatası");
		}
		model.addAttribute("perduzenle", per);
		System.out.println("sdasdasd");
		return GirisController.denetim(req, "admin/personelbilgisi");
	}

	@ResponseBody
	@RequestMapping(value = "/personelbilgisiguncelle", method = RequestMethod.POST)
	public String personelbilgisiguncelle(Personel personel, HttpServletRequest req) {
		String kullaniciid = "" + req.getSession().getAttribute("kullanici");
		DB db = new DB();
		String query = "UPDATE `personel` SET `pertelefon` = '" + personel.getPerTelefon() + "', `peremail` = '"
				+ personel.getPerEMail() + "', `peradres` = '" + personel.getPerAdres() + "',`persifre` = '"
				+ personel.getPerSifre() + "' WHERE `personel`.`perid` = " + kullaniciid;
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

	@ResponseBody
	@RequestMapping(value = "/resimGuncelle", method = RequestMethod.POST)
	public String resimGuncelle(HttpServletRequest req) {
		return "geldim";

	}

	@RequestMapping(value = "/personeldurumaktif/{id}", method = RequestMethod.GET)
	public String personeldurumaktif(HttpServletRequest req, @PathVariable(value = "id") String id) {
		DB db = new DB();
		String query = "UPDATE `personel` SET `peraktiflik` = false where perid=" + id;
		System.out.println(query);
		try {

			int aktiflik = db.baglan().executeUpdate(query);

		} catch (Exception e) {

		} finally {
			db.kapat();
		}
		return "redirect:/personellistesi";
	}

	@RequestMapping(value = "/personeldurumpasif/{id}", method = RequestMethod.GET)
	public String personeldurumpasif(HttpServletRequest req, @PathVariable(value = "id") String id) {
		DB db = new DB();
		String query = "UPDATE `personel` SET `peraktiflik` = true where perid=" + id;
		System.out.println(query);
		try {

			int aktiflik = db.baglan().executeUpdate(query);
		} catch (Exception e) {

		} finally {
			db.kapat();
		}
		return "redirect:/personellistesi";

	}

	public String personelaramalistesi(String query) {
		List<Personel> lsPersonel = perListesi(query);
		StringBuilder st = new StringBuilder();
		int i = 0;
		for (Personel per : lsPersonel) {
			st.append("<tr>");
			st.append("<td>" + i + "</td>");
			st.append("<td>" + per.getPerSira() + "</td>");
			st.append("<td>" + per.getPerTC() + "</td>");
			st.append("<td>" + per.getPerAdi() + "</td>");
			st.append("<td>" + per.getPerSoyadi() + "</td>");
			st.append("<td>" + per.getPerTelefon() + "</td>");
			st.append("<td>" + per.getPerBrans() + "</td>");
			st.append("<td>" + per.getPerGorev() + "</td>");
			st.append("<td><a href='personeldetay/" + per.getPerID() + "' class='btn btn-warning'>Detay</a></td>");
			st.append("<td><a href='personelguncelleme/" + per.getPerID() + "' class='btn btn-warning'>Düzenle</a></td>");
			
			
			st.append("</tr>");

		}

		return st.toString();
	}

}
