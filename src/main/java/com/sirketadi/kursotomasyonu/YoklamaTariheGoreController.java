package com.sirketadi.kursotomasyonu;

import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import Properties.Ogrenci;
import Properties.Yoklama;
import Utils.DB;

@Controller
public class YoklamaTariheGoreController {
	@RequestMapping(value = "/yoklamatarihegore", method = RequestMethod.GET)
	public String yoklamatarihegore(Model model, HttpServletRequest req) {

		SinifController snf = new SinifController();
		model.addAttribute("lsSiniflar", snf.tamSinifListesi());
		return GirisController.denetim(req, "admin/yoklamatarihegore");
	}

	@ResponseBody
	@RequestMapping(value = "/yoklamasinifgetirtarih", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String yoklamasinifgetirtarih(String SinifAdi, String tarih) {
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy/MM/dd");
		Date yTarih = null;
		try {
			yTarih = format.parse(tarih);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String query = "select * from ogrenci left join siniflar on siniflar.sinifid=ogrenci.ogrsinifadi"
				+ " where ogrsinifadi = '" + SinifAdi + "%'";
		OgrenciController OgrCont = new OgrenciController();
		List<Ogrenci> lsOgrenci = OgrCont.ogrListesi(query);
		List<Yoklama> lsYoklama = new ArrayList<Yoklama>();
		int i = 0;
		for (Ogrenci ogr : lsOgrenci) {
			i++;
			Yoklama ogrYoklama = new Yoklama();
			ogrYoklama.setSira("" + i);
			ogrYoklama.setOgrId(ogr.getOgrID());
			ogrYoklama.setOgrTC(ogr.getOgrTC());
			ogrYoklama.setOgrAdi(ogr.getOgrAdi());
			ogrYoklama.setOgrSoyadi(ogr.getOgrSoyadi());
			lsYoklama.add(ogrYoklama);
		}

		DB db = new DB();
		try {
			String yoklamaAlindimi = "select count(*) as sonuc  from yoklamasinif where sinifid='" + SinifAdi
					+ "' and tarih='" + format2.format(yTarih) + "';";
			ResultSet rs = db.baglan().executeQuery(yoklamaAlindimi);
			System.out.println(yoklamaAlindimi);
			rs.next();
			int sonuc = rs.getInt("sonuc");
			System.out.println(sonuc);
			if (sonuc == 1) {
				String yoklamaQuery = "select * from ogrenci as o " + "left JOIN yoklama as y on o.ogrid=y.ogrenciid "
						+ "where o.ogrsinifadi='"+SinifAdi+"' and y.gelmedigitarih='" + format2.format(yTarih) + "'";
				System.out.println(yoklamaQuery);
				ResultSet rsyoklama = db.baglan().executeQuery(yoklamaQuery);
				while (rsyoklama.next()) {
					String gelmemeSebebi = rsyoklama.getString("y.gelmemesebebi");
					System.out.println(gelmemeSebebi);
					for (int j = 0; j < lsYoklama.size(); j++) {
						if (lsYoklama.get(j).getOgrId().equals(rsyoklama.getString("o.ogrid"))) {
							Yoklama yYoklama = lsYoklama.get(j);
							if (gelmemeSebebi.equals("izinli")) {
								yYoklama.setOgrIzinli(1);
							} else if (gelmemeSebebi.equals("raporlu")) {
								yYoklama.setOgrRaporlu(1);
							} else if (gelmemeSebebi.equals("gelmedi")) {
								yYoklama.setOgrGelmedi(1);
							}
						}

					}

				}
			}
		} catch (Exception e) {
			System.err.println("Vt sýnýf yoklama okuma hatasý:" + e);
		} finally {
			db.kapat();
		}
		
		for (Yoklama yoklama : lsYoklama) {
			System.out.println(yoklama.getOgrTC()+yoklama.getOgrAdi()+yoklama.getOgrGelmedi()+yoklama.getOgrIzinli()+yoklama.getOgrRaporlu());
		}
		
		return SinifAdi + " " + format2.format(yTarih);

	}

}
