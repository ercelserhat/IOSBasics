//
//  KisiEkleViewController.swift
//  KisilerApp
//
//  Created by Serhat on 12.07.2023.
//

import UIKit
import Alamofire

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
        let params: Parameters = ["kisi_ad" : kisi_ad, "kisi_tel" : kisi_tel]
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php", method: .post, parameters: params).response{ response in
            if let data = response.data{
                do{
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String : Any]{
                        print(json)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
