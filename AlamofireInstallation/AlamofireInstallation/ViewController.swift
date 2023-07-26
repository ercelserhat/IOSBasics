//
//  ViewController.swift
//  AlamofireInstallation
//
//  Created by Serhat on 26.07.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //tumKisiler()
        aramaYap()
    }
    
    func tumKisiler(){
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php", method: .get).response{ response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let gelenListe = cevap.kisiler{
                        for k in gelenListe{
                            print("***********************")
                            print("Kişi id: \(k.kisi_id)")
                            print("Kişi ad: \(k.kisi_ad)")
                            print("Kişi tel: \(k.kisi_tel)")
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func aramaYap(){
        let params: Parameters = ["kisi_ad" : "TEST"]
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php", method: .post, parameters: params).response{ response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let gelenListe = cevap.kisiler{
                        for k in gelenListe{
                            print("***********************")
                            print("Kişi id: \(k.kisi_id)")
                            print("Kişi ad: \(k.kisi_ad)")
                            print("Kişi tel: \(k.kisi_tel)")
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
