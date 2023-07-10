//
//  ViewController.swift
//  UserDefaultsLoginApp
//
//  Created by Serhat on 11.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfieldKullaniciAdi: UITextField!
    
    @IBOutlet weak var textFieldSifre: UITextField!
    
    let userDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let kullaniciAdi = userDefaults.string(forKey: "kullaniciAdi") ?? "bos"
        let sifre = userDefaults.string(forKey: "sifre") ?? "bos"
        
        if kullaniciAdi != "bos" && sifre != "bos"{
            performSegue(withIdentifier: "toAnasayfa", sender: nil)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }

    @IBAction func btnGiris(_ sender: Any) {
        if let kullaniciAdi = textfieldKullaniciAdi.text, let sifre = textFieldSifre.text{
            if kullaniciAdi == "admin" && sifre == "123456"{
                userDefaults.set(kullaniciAdi, forKey: "kullaniciAdi")
                userDefaults.set(sifre, forKey: "sifre")
                performSegue(withIdentifier: "toAnasayfa", sender: nil)
            }else{
                print("Hatalı Giriş!")
            }
        }
    }
}
