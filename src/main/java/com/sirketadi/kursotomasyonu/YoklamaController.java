package com.sirketadi.kursotomasyonu;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import Properties.Yoklama;
import Properties.YoklamaDetay;
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
		DB db = new DB();
		try {
			String yoklamaAlindimi = "select count(*) as sonuc  from yoklamasinif where sinifid='" + SinifAdi
					+ "' and tarih=DATE(now());";
			ResultSet rs = db.baglan().executeQuery(yoklamaAlindimi);
			rs.next();
			int sonuc = rs.getInt("sonuc");
			if (sonuc == 1) {
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

	public List<Yoklama> ogrenciListesi(String query) {
		DB db = new DB();
		List<Yoklama> yoklamaListesi = new ArrayList<Yoklama>();
		try {
			int ogrid = -1;
			int sira = 0;
			boolean yeniOgr = true;
			String gelmemeSebebi = null;
			Yoklama yklm = new Yoklama();
			ResultSet rs = db.baglan().executeQuery(query);
			while (rs.next()) {

				if (ogrid != rs.getInt("ogrid") || ogrid < 0) {
					yklm.setOgrToplam(yklm.getOgrGelmedi() + yklm.getOgrRaporlu() + yklm.getOgrIzinli());
					yoklamaListesi.add(yklm);
					yklm = new Yoklama();
					yeniOgr = true;

				} else if (ogrid == rs.getInt("ogrid")) {
					yeniOgr = false;
				}
				ogrid = rs.getInt("ogrid");
				gelmemeSebebi = (rs.getString("gelmemesebebi"));
				if (yeniOgr) {
					sira++;
					yklm.setSira("" + sira);
					yklm.setOgrId(rs.getString("ogrid"));
					yklm.setOgrTC(rs.getString("ogrtc"));
					yklm.setOgrAdi(rs.getString("ogradi"));
					yklm.setOgrSoyadi(rs.getString("ogrsoyadi"));

					if (gelmemeSebebi != null) {
						if (gelmemeSebebi.equals("gelmedi")) {
							yklm.setOgrGelmedi(rs.getInt("sayi"));
						} else if (gelmemeSebebi.equals("raporlu")) {
							yklm.setOgrRaporlu(rs.getInt("sayi"));
						} else if (gelmemeSebebi.equals("izinli")) {
							yklm.setOgrIzinli(rs.getInt("sayi"));
						}
					}
				} else {

					if (gelmemeSebebi.equals("gelmedi")) {
						yklm.setOgrGelmedi(rs.getInt("sayi"));
					} else if (gelmemeSebebi.equals("raporlu")) {
						yklm.setOgrRaporlu(rs.getInt("sayi"));
					} else if (gelmemeSebebi.equals("izinli")) {
						yklm.setOgrIzinli(rs.getInt("sayi"));
					}
				}
			}
		} catch (Exception e) {
			System.err.println("Vt sýnýf yoklama okuma hatasý:" + e);
		} finally {
			db.kapat();
		}
		yoklamaListesi.remove(0);
		return yoklamaListesi;
	}

	@RequestMapping(value = "/yoklamaraporogrencilistesi", method = RequestMethod.GET)
	public String yoklamaraporogrencilistesi(Model model, HttpServletRequest req) {
		String query = "Select ogr.ogrid,ogr.ogrtc,ogr.ogradi,ogr.ogrsoyadi,yok.gelmemesebebi,count(ogr.ogrid) as sayi from ogrenci as ogr left JOIN yoklama as yok on ogr.ogrid=yok.ogrenciid GROUP BY ogr.ogrid,yok.gelmemesebebi;";

		model.addAttribute("yoklamaListesi", ogrenciListesi(query));
		return GirisController.denetim(req, "admin/yoklamaraporogrencilistesi");
	}

	public String aramaTablosuOlustur(String query) {
		List<Yoklama> yoklamaListesi = ogrenciListesi(query);
		StringBuilder yoklamaSonuclari = new StringBuilder();
		for (Yoklama yoklama : yoklamaListesi) {
			yoklamaSonuclari.append("<tr>");
			yoklamaSonuclari.append("<td>" + yoklama.getSira() + "</td>");
			yoklamaSonuclari.append("<td>" + yoklama.getOgrTC() + "</td>");
			yoklamaSonuclari.append("<td>" + yoklama.getOgrAdi() + "</td>");
			yoklamaSonuclari.append("<td>" + yoklama.getOgrSoyadi() + "</td>");
			yoklamaSonuclari.append("<td>" + yoklama.getOgrGelmedi() + "</td>");
			yoklamaSonuclari.append("<td>" + yoklama.getOgrRaporlu() + "</td>");
			yoklamaSonuclari.append("<td>" + yoklama.getOgrIzinli() + "</td>");
			yoklamaSonuclari.append("<td>" + yoklama.getOgrToplam() + "</td>");
			yoklamaSonuclari.append(
					"<td><a href='yoklamaogrencidetay/" + yoklama.getOgrId() + "' class='btn btn-info'>Detay</a></td>");
			yoklamaSonuclari.append("</tr>");
		}
		return yoklamaSonuclari.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/ogrencitcararapor", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String ogrencitcararapor(String ogrenciTC) {
		String query = "Select ogr.ogrid,ogr.ogrtc,ogr.ogradi,ogr.ogrsoyadi,yok.gelmemesebebi,count(ogr.ogrid) as sayi from ogrenci as ogr left JOIN yoklama as yok on ogr.ogrid=yok.ogrenciid "
				+ "where ogr.ogrtc like '" + ogrenciTC + "%' GROUP BY ogr.ogrid,yok.gelmemesebebi";
		return aramaTablosuOlustur(query);
	}

	@ResponseBody
	@RequestMapping(value = "/ogrenciadiararapor", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String ogrenciadiararapor(String ogrenciAdi) {
		String query = "Select ogr.ogrid,ogr.ogrtc,ogr.ogradi,ogr.ogrsoyadi,yok.gelmemesebebi,count(ogr.ogrid) as sayi from ogrenci as ogr left JOIN yoklama as yok on ogr.ogrid=yok.ogrenciid "
				+ " where ogr.ogradi like '" + ogrenciAdi + "%' GROUP BY ogr.ogrid,yok.gelmemesebebi";
		return aramaTablosuOlustur(query);
	}

	
	@RequestMapping(value = "/yoklamaogrencidetay/{id}", method = RequestMethod.GET)
	public String yoklamaogrencidetay(Model model, HttpServletRequest req,@PathVariable(value = "id") String id) {
		String query = "select * from ogrenci left join siniflar on siniflar.sinifid=ogrenci.ogrsinifadi where ogrid="
				+ id;
		OgrenciController oC = new OgrenciController(); 
		List<Ogrenci> ol = oC.ogrListesi(query);
		System.out.println(ol.get(0).getOgrAdi());
		Ogrenci ogr = ol.get(0);
		model.addAttribute("ogrDetay", ogr);
		
		String query2="Select * from yoklama where ogrenciid="+id;
	    String pattern = "dd/MM/yyyy";
	    SimpleDateFormat tarihformat = new SimpleDateFormat(pattern);
		DB db= new DB();
		List<YoklamaDetay> dListe = new ArrayList<YoklamaDetay>();
		try {
			ResultSet rs = db.baglan().executeQuery(query2);
			while(rs.next()) {
				YoklamaDetay yd = new YoklamaDetay();
				Date glmTarih=rs.getDate("gelmedigitarih");
				yd.setgTarih(""+tarihformat.format(glmTarih));
				yd.setgSebep(rs.getString("gelmemesebebi"));
				dListe.add(yd);
			}
		} catch (Exception e) {
			System.err.println("Vt devamsizlik okuma hatasi:"+e);
		}
		model.addAttribute("devamsizlikListesi", dListe);
		return GirisController.denetim(req, "admin/yoklamaogrencidetay");
	}
}
