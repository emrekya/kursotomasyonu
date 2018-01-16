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

import Properties.Siniflar;
import Utils.DB;

@Controller
public class SinifController {

	@RequestMapping(value = "/sinifekle", method = RequestMethod.GET)
	public String sinifekle(HttpServletRequest req) {
		return GirisController.denetim(req, "admin/sinifekle");
	}
	
	@RequestMapping(value = "/siniflistesi", method = RequestMethod.GET)
	public String siniflistesi(Model model,  HttpServletRequest req) {
		
		model.addAttribute("lsSiniflar", tamSinifListesi()); 
				
		return GirisController.denetim(req, "admin/siniflistesi");
	}
		
	public List<Siniflar> tamSinifListesi() {
		int i=0;
		String query = "select * from siniflar";
		List<Siniflar> lsSiniflar = new ArrayList<Siniflar>();
		DB db = new DB();
		try {
			ResultSet rs = db.baglan().executeQuery(query);
			while(rs.next()) {
				i++;
				Siniflar sinif = new Siniflar();
				sinif.setSinifSira(""+i);
				sinif.setSinifId(rs.getString("sinifid"));
				sinif.setSinifAdi(rs.getString("sinifadi"));
				sinif.setOgrenciSayisi(rs.getString("ogrencisayisi"));
				sinif.setSinifSeviye(rs.getString("sinifseviye"));
				lsSiniflar.add(sinif);
				
			}
		} catch (Exception e) {
			System.err.println("vt sinif hatasý");
		}
		return lsSiniflar;
	}
	@ResponseBody
	@RequestMapping(value = "/sinifkaydet", method = RequestMethod.POST)
	public String sinifkaydet(Siniflar sinif) {
		String query="INSERT INTO `siniflar` (`sinifid`, `sinifadi`, `ogrencisayisi`,`sinifseviye`) VALUES (NULL, '"+sinif.getSinifAdi()+"', '"+sinif.getOgrenciSayisi()+"','"+sinif.getSinifSeviye()+"');";
		System.out.println(query);
		DB db = new DB();
		try {
		int  ekle =	db.baglan().executeUpdate(query);
			if(ekle>0) {
				return "Kayýt baþarýlý";
			}else {
				return "Kayýt Hatasý";
			}
		} catch (Exception e) {
			return "Kayýt vt hatasý";
			
		}
		
	}
	@RequestMapping(value = "/sinifdetay/{id}", method = RequestMethod.GET)
	public String sinifdetay(@PathVariable(value="id") String id, Model model, HttpServletRequest req) {
		DB db = new DB();
		Siniflar sinif = new Siniflar();
		
		String query="select * from siniflar "
				
				+ "where sinifid="+id;
		try {
			ResultSet rs=db.baglan().executeQuery(query);
				rs.next();
				
				sinif.setSinifId(rs.getString("sinifid"));
				sinif.setSinifAdi(rs.getString("sinifadi"));
				sinif.setOgrenciSayisi(rs.getString("ogrencisayisi"));
	}catch (Exception e) {
		System.err.println("vt drs güncelle hatasý  "+e );
	}
		OgrenciController oc = new OgrenciController();
		String ogrlistQuery="select * from ogrenci left join siniflar on siniflar.sinifid=ogrenci.ogrsinifadi where ogrsinifadi="+id;
		model.addAttribute("lsOgrenci", oc.ogrListesi(ogrlistQuery));
		model.addAttribute("snfDetay", sinif);	
		return GirisController.denetim(req, "admin/sinifdetay");
	}
	
	@RequestMapping(value = "/sinifguncelleme/{id}", method = RequestMethod.GET)
	public String sinifguncelleme(@PathVariable(value="id") String id, Model model, HttpServletRequest req) {
		DB db = new DB();
		String query="select * from siniflar where sinifid="+id;
		try {
			ResultSet rs=db.baglan().executeQuery(query);
				rs.next();
				Siniflar sinif = new Siniflar();
				sinif.setSinifId(rs.getString("sinifid"));
				sinif.setSinifAdi(rs.getString("sinifadi"));
				sinif.setOgrenciSayisi(rs.getString("ogrencisayisi"));
			

		model.addAttribute("snfDuzenle", sinif);		
		
	}catch (Exception e) {
		System.err.println("vt drs güncelle hatasý  "+e );
	}
		return GirisController.denetim(req, "admin/sinifguncelleme");
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/sinifguncellekaydet", method = RequestMethod.POST)
	public String dersguncellekaydet(Siniflar sinif) {
		DB db = new DB();
		String query = "UPDATE `siniflar` SET `sinifadi` =  '"+sinif.getSinifAdi()+"', `ogrencisayisi` = '"+sinif.getOgrenciSayisi()+"'  WHERE `siniflar`.`sinifid` = '"+sinif.getSinifId()+"'; ";

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
	
}
	
