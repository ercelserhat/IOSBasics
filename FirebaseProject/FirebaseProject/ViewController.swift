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
        kisiGuncelle()
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
}

