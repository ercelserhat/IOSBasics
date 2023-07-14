//
//  ViewController.swift
//  SQLite
//
//  Created by Serhat on 14.07.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        veritabaniKopyala()
        
        //Kisilerdao().kisiEkle(kisi_ad: "Mehmet", kisi_yas: 35)
        //Kisilerdao().kisiSil(kisi_id: 2)
        //Kisilerdao().kisiGuncelle(kisi_id: 3, kisi_ad: "Ahmet", kisi_yas: 30)
        //let sonuc = Kisilerdao().kisiKontrol(kisi_ad: "Ahmet")
        //print("Sonuç: \(sonuc)")
        
        let gelenListe = Kisilerdao().tumKisileriAl()
        for k in gelenListe{
            print("ID: \(k.kisi_id), AD: \(k.kisi_ad), YAŞ: \(k.kisi_yas)")
        }
        
        print("Arama Sonucu:")
        let aramaSonucu = Kisilerdao().aramaYap(kisi_ad: "hat")
        for k in aramaSonucu{
            print("ID: \(k.kisi_id), AD: \(k.kisi_ad), YAŞ: \(k.kisi_yas)")
        }
    }
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "kisilergiris", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("kisilergiris.sqlite")
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten mevcut.")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{
                print(error)
            }
        }
    }


}

