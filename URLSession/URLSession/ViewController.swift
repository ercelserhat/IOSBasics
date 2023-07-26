//
//  ViewController.swift
//  URLSession
//
//  Created by Serhat on 26.07.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //kisiEkle()
        //kisiSil()
        //kisiGuncelle()
        //tumKisiler()
        aramaYap()
    }

    func kisiEkle(){
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_ad=TESTad&kisi_tel=TESTtel"
        request.httpBody = postString.data(using: .utf8)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil || data == nil{
                print("Hata")
                return
            }
            do{
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]{
                    print(json)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func kisiSil(){
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_id=15149"
        request.httpBody = postString.data(using: .utf8)
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            if error != nil || data == nil{
                print("Hata")
                return
            }
            do{
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]{
                    print(json)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func kisiGuncelle(){
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/update_kisiler.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_id=15148&kisi_ad=TESTTESTTEST&kisi_tel=0000000000000"
        request.httpBody = postString.data(using: .utf8)
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            if error != nil || data == nil{
                print("Hata")
                return
            }
            do{
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]{
                    print(json)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func tumKisiler(){
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!
        URLSession.shared.dataTask(with: url){ (data, response, error) in
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
    
    func aramaYap(){
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_ad=TEST"
        request.httpBody = postString.data(using: .utf8)
        URLSession.shared.dataTask(with: request){ (data, response, error) in
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

