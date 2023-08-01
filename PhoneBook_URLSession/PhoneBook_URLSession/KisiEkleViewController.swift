//
//  KisiEkleViewController.swift
//  KisilerApp
//
//  Created by Serhat on 12.07.2023.
//

import UIKit

class KisiEkleViewController: UIViewController {
    
    @IBOutlet weak var kisiAdiTextField: UITextField!
    @IBOutlet weak var kisiTelTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func kisiEkleButton(_ sender: Any) {
        if let ad = kisiAdiTextField.text, let tel = kisiTelTextField.text{
            kisiEkle(kisi_ad: ad, kisi_tel: tel)
        }
    }
    
    func kisiEkle(kisi_ad: String, kisi_tel: String){
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_ad=\(kisi_ad)&kisi_tel=\(kisi_tel)"
        request.httpBody = postString.data(using: .utf8)
        URLSession.shared.dataTask(with: request){ data, response, error in
            if error != nil || data == nil{
                print("Hata")
                return
            }
            do{
                if let json = try JSONSerialization.jsonObject(with: data!) as? [String : Any]{
                    print(json)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}
