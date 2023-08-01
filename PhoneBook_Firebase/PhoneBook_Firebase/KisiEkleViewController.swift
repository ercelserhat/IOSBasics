//
//  KisiEkleViewController.swift
//  KisilerApp
//
//  Created by Serhat on 12.07.2023.
//

import UIKit
import Firebase

class KisiEkleViewController: UIViewController {
    
    @IBOutlet weak var kisiAdiTextField: UITextField!
    @IBOutlet weak var kisiTelTextField: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    @IBAction func kisiEkleButton(_ sender: Any) {
        if let ad = kisiAdiTextField.text, let tel = kisiTelTextField.text{
            kisiEkle(kisi_ad: ad, kisi_tel: tel)
        }
    }
    
    func kisiEkle(kisi_ad: String, kisi_tel: String){
        let dict: [String : Any] = ["kisi_id" : "", "kisi_ad" : kisi_ad, "kisi_tel" : kisi_tel]
        let newRef = ref.child("kisiler").childByAutoId()
        newRef.setValue(dict)
    }
}
