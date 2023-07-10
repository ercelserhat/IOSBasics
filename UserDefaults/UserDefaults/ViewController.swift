//
//  ViewController.swift
//  UserDefaults
//
//  Created by Serhat on 10.07.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        
        //Veri Kaydetme
        userDefaults.set("Serhat", forKey: "isim")
        userDefaults.set(31, forKey: "yas")
        userDefaults.set(3.14, forKey: "pi")
        userDefaults.set(true, forKey: "medeniDurum")
        
        let isimListesi = ["Serhat", "Seda", "Serap"]
        userDefaults.set(isimListesi, forKey: "liste")
        
        let sehirListesi: [String:String] = ["34":"İstanbul", "06":"Ankara", "23":"Elazığ"]
        userDefaults.set(sehirListesi, forKey: "sozluk")
        
        
        //Veri Okuma
        let isim = userDefaults.string(forKey: "isim") ?? "İsim Yok"
        let yas = userDefaults.integer(forKey: "yas")
        let pi = userDefaults.double(forKey: "pi")
        let medeniDurum = userDefaults.bool(forKey: "medeniDurum")
        
        print(isim, yas, pi, medeniDurum) //Serhat 31 3.14 true
        
        let liste = userDefaults.array(forKey: "liste") as? [String] ?? [String]()
        print(liste[0]) //Serhat
        
        let dict = userDefaults.dictionary(forKey: "sozluk") as? [String:String] ?? [String:String]()
        print(dict["06"]!) //Ankara
        
        
        //Veri Silmek
        userDefaults.removeObject(forKey: "isim")
        let ad = userDefaults.string(forKey: "isim") ?? "İsim Yok"
        print(ad) //İsim Yok
        
        
        //Veri Güncellemek
        userDefaults.set("Yeni isim", forKey: "isim")
        let guncelIsim = userDefaults.string(forKey: "isim") ?? "İsim Yok"
        print(guncelIsim) //Yeni isim
    }


}

