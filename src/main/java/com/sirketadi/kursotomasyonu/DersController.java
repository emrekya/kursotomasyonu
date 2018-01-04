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

import Properties.Dersler;
import Properties.Ogrenci;
import Utils.DB;


@Controller
public class DersController {

	@RequestMapping(value = "/dersekle", method = RequestMethod.GET)
	public String dersekle(HttpServletRequest req) {
		return GirisController.denetim(req, "admin/dersekle");
	}
	
	@RequestMapping(value = "/derslistesi", method = RequestMethod.GET)
	public String derslistesi(Model model, HttpServletRequest req) {
		int i=0;
		String query = "select * from dersler";
		List<Dersler> lsDersler = new ArrayList<Dersler>();
		DB db = new DB();
		try {
			ResultSet rs = db.baglan().executeQuery(query);
			while(rs.next()) {
				i++;
				Dersler ders = new Dersler();
				ders.setDersSira(""+i);
				ders.setDersId(rs.getString("dersid"));
				ders.setDersAdi(rs.getString("dersadi"));
				ders.setDersIcerigi(rs.getString("dersicerigi"));
			
				lsDersler.add(ders);
				
			}
		} catch (Exception e) {
			System.err.println("vt ders hatasý");
		}
		model.addAttribute("lsDersler", lsDersler);
				
		return GirisController.denetim(req, "admin/derslistesi");
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/derskaydet", method = RequestMethod.POST)
	public String derskaydet(Dersler ders) {
		String query="INSERT INTO `dersler` (`dersid`, `dersadi`, `dersicerigi`) VALUES (NULL, '"+ders.getDersAdi()+"', '"+ders.getDersIcerigi()+"');";
		
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
	@RequestMapping(value = "/dersguncelleme/{id}", method = RequestMethod.GET)
	public String dersguncelleme(@PathVariable(value="id") String id, Model model, HttpServletRequest req) {
		DB db = new DB();
		String query="select * from dersler where dersid="+id;
		try {
			ResultSet rs=db.baglan().executeQuery(query);
				rs.next();
				Dersler drs = new Dersler();
				drs.setDersId(rs.getString("dersid"));
				drs.setDersAdi(rs.getString("dersadi"));
				drs.setDersIcerigi(rs.getString("dersicerigi"));


		model.addAttribute("drsDuzenle", drs);		
		
	}catch (Exception e) {
		System.err.println("vt drs güncelle hatasý  "+e );
	}
		return GirisController.denetim(req, "admin/dersguncelleme");
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/dersguncellekaydet", method = RequestMethod.POST)
	public String dersguncellekaydet(Dersler dersler) {
		DB db = new DB();
		String query = "UPDATE `dersler` SET `dersadi` =  '"+dersler.getDersAdi()+"', `dersicerigi` = '"+dersler.getDersIcerigi()+"'  WHERE `dersler`.`dersid` = '"+dersler.getDersId()+"'; ";

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