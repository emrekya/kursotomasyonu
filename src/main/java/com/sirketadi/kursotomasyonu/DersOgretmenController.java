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

import Properties.Dersler;
import Properties.Personel;
import Utils.DB;

@Controller
public class DersOgretmenController {
	@RequestMapping(value = "/dersogretmeniata/{id}", method = RequestMethod.GET)
	public String dersogretmeniata(@PathVariable(value = "id") String id, Model model, HttpServletRequest req) {
		
		PersonelController pCont = new PersonelController();
		String query = "Select * from personel where pergorev!='Admin';";
		List<Personel> personelListesi = pCont.perListesi(query);
		List<String> DersOgretmenID = dersOgretmenleri(id);
		
		for (String perid : DersOgretmenID) {
			for (int i = 0; i < personelListesi.size(); i++) {
				if(perid.equals(personelListesi.get(i).getPerID())) {
					Personel pr = personelListesi.get(i);					
					pr.setPerDersOgretmeni(true);
					System.out.println(personelListesi.get(i).getPerAdi());
					personelListesi.set(i, pr);
				}
				
			}
		}
		 
		model.addAttribute("OgretmenListesi",personelListesi);
		model.addAttribute("DersBilgisi", dersBilgisi(id));
		return GirisController.denetim(req, "admin/dersogretmeniata");
	}

	public List<String> dersOgretmenleri(String dersId){
		String querydersOgretmenleri="select * from dersogretmenleri where dersid='"+dersId+"'";
		DB db = new DB();
		List<String> ogretmenId = new ArrayList<String>();
		try {
			ResultSet rs = db.baglan().executeQuery(querydersOgretmenleri);
			while(rs.next()) {
				ogretmenId.add(rs.getString("perid"));
			}
		} catch (Exception e) {
			System.err.println("vt Ders Öðretmenleri Bulma hatasý  " + e);
		}
		return ogretmenId;
	}
	
	public Dersler dersBilgisi(String id) {
		DB db = new DB();
		String query = "select * from dersler where dersid=" + id;
		Dersler drs = new Dersler();
		try {
			ResultSet rs = db.baglan().executeQuery(query);
			rs.next();

			drs.setDersId(rs.getString("dersid"));
			drs.setDersAdi(rs.getString("dersadi"));
			drs.setDersIcerigi(rs.getString("dersicerigi"));
		} catch (Exception e) {
			System.err.println("vt drs Bilgisi hatasý  " + e);
		}
		return drs;
	}

	@RequestMapping(value = "/dersogretmenikaydet/{dersid}/{perid}", method = RequestMethod.GET)
	public String dersogretmenikaydet(@PathVariable(value = "dersid") String dersid,
			@PathVariable(value = "perid") String perid, Model model, HttpServletRequest req) {
		DB db = new DB();
		int islem = 0;
		String queryislem = "Select count(*) as sayi from dersogretmenleri where dersid='" + dersid + "' and perid='"
				+ perid + "';";
		try {
			ResultSet rs = db.baglan().executeQuery(queryislem);
			rs.next();
			islem = rs.getInt("sayi");
		} catch (Exception e) {
			System.err.println("vt Ders Öðretmeni Bilgisi hatasý  " + e);
		}

		if (islem ==0) {
			String query = "INSERT INTO `dersogretmenleri` (`dersperid`, `dersid`, `perid`) VALUES (NULL, '" + dersid
					+ "', '" + perid + "');";
			try {
				db.baglan().executeUpdate(query);
			} catch (Exception e) {
				System.err.println("Vt ders öðretmeni ekleme hatasý: " + e);
			}
		}else if(islem ==1) {
			String querysil="delete from dersogretmenleri where dersid='" + dersid + "' and perid='"+ perid + "';";
			try {
				db.baglan().executeUpdate(querysil);
			} catch (Exception e) {
				System.err.println("Vt ders öðretmeni silme hatasý");
			}
		}else {
			System.err.println("Beklenmeyen hata oluþtu  iþlem sonucu:"+islem);
		}
		return "redirect:/dersogretmeniata/" + dersid;
	}

}
