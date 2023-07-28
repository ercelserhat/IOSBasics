//
//  ViewController.swift
//  FirebaseProject
//
//  Created by Serhat on 27.07.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var ref: DatabaseReference?

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        //kisiEkle()
        //kisiSil()
        //kisiGuncelle()
        //tumKisiler()
        //kisiEqualSorgu()
        //kisiLimitSorgu()
        kisiDegerAraligiSorgu()
    }
    
    func kisiEkle(){
        let yeniKisi = Kisiler(kisi_ad: "Ahmet", kisi_yas: 31)
        let dict: [String : Any] = ["kisi_ad" : yeniKisi.kisi_ad, "kisi_yas" : yeniKisi.kisi_yas]
        let newRef = ref?.child("kisiler").childByAutoId()
        newRef?.setValue(dict)
    }
    
    func kisiSil(){
        ref?.child("kisiler").child("-NaO7Fxs1Zc9YugvW1w0").removeValue()
    }
    
    func kisiGuncelle(){
        let dict: [String : Any] = ["kisi_ad" : "YENİ AD", "kisi_yas" : 50]
        ref?.child("kisiler").child("-NaO72sDE3QVq76HREMC").updateChildValues(dict)
    }
    
    func tumKisiler(){
        ref?.child("kisiler").observe(.value, with: { snapshot in
            if let gelenVeriButunu = snapshot.value as? [String : AnyObject]{
                for gelenSatirVerisi in gelenVeriButunu{
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary{
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_yas = sozluk["kisi_yas"] as? Int ?? 0
                        
                        print("Key: \(key)")
                        print("Ad: \(kisi_ad)")
                        print("Yaş: \(kisi_yas)")
                        print("----------------------")
                    }
                }
            }
        })
    }
    
    func kisiEqualSorgu(){
        let sorgu = ref?.child("kisiler").queryOrdered(byChild: "kisi_ad").queryEqual(toValue: "Serhat")
        sorgu?.observe(.value, with: { snapshot in
            if let gelenVeriButunu = snapshot.value as? [String : AnyObject]{
                for gelenSatirVerisi in gelenVeriButunu{
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary{
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_yas = sozluk["kisi_yas"] as? Int ?? 0
                        
                        print("Key: \(key)")
                        print("Ad: \(kisi_ad)")
                        print("Yaş: \(kisi_yas)")
                        print("----------------------")
                    }
                }
            }
        })
    }
    
    func kisiLimitSorgu(){
        let sorgu = ref?.child("kisiler").queryLimited(toFirst: 1)
        sorgu?.observe(.value, with: { snapshot in
            if let gelenVeriButunu = snapshot.value as? [String : AnyObject]{
                for gelenSatirVerisi in gelenVeriButunu{
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary{
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_yas = sozluk["kisi_yas"] as? Int ?? 0
                        
                        print("Key: \(key)")
                        print("Ad: \(kisi_ad)")
                        print("Yaş: \(kisi_yas)")
                        print("----------------------")
                    }
                }
            }
        })
    }
    
    func kisiDegerAraligiSorgu(){
        let sorgu = ref?.child("kisiler").queryOrdered(byChild: "kisi_yas").queryStarting(atValue: 20).queryEnding(atValue: 40)
        sorgu?.observe(.value, with: { snapshot in
            if let gelenVeriButunu = snapshot.value as? [String : AnyObject]{
                for gelenSatirVerisi in gelenVeriButunu{
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary{
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_yas = sozluk["kisi_yas"] as? Int ?? 0
                        
                        print("Key: \(key)")
                        print("Ad: \(kisi_ad)")
                        print("Yaş: \(kisi_yas)")
                        print("----------------------")
                    }
                }
            }
        })
    }
}

