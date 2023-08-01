//
//  KisiGuncelleViewController.swift
//  KisilerApp
//
//  Created by Serhat on 12.07.2023.
//

import UIKit
import Firebase

class KisiGuncelleViewController: UIViewController {

    @IBOutlet weak var kisiAdiTextField: UITextField!
    @IBOutlet weak var kisiTelTextField: UITextField!
    
    var ref: DatabaseReference!
    
    var kisi: Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        if let k = kisi{
            kisiAdiTextField.text = k.kisi_ad
            kisiTelTextField.text = k.kisi_tel
        }
    }
    
    @IBAction func kisiGuncelleButton(_ sender: Any) {
        if let k = kisi, let ad = kisiAdiTextField.text, let tel = kisiTelTextField.text{
            kisiGuncelle(kisi_id: k.kisi_id, kisi_ad: ad, kisi_tel: tel)
        }
    }
    
    func kisiGuncelle(kisi_id: String, kisi_ad: String, kisi_tel: String){
        ref.child("kisiler").child(kisi_id).updateChildValues(["kisi_ad" : kisi_ad, "kisi_tel" : kisi_tel])
    }
}
