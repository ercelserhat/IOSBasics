//
//  ViewController.swift
//  WorkingWithFile
//
//  Created by Serhat on 11.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldGirdi: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnYaz(_ sender: Any) {
        let mesaj = textFieldGirdi.text!
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            do{
                try mesaj.write(to: dosyaYolu, atomically: false, encoding: String.Encoding.utf8)
                textFieldGirdi.text = ""
            }catch{
                print("Dosya yazılırken hata oluştu.")
            }
        }
    }
    
    @IBAction func btnOku(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            do{
                textFieldGirdi.text = try String(contentsOf: dosyaYolu, encoding: String.Encoding.utf8)
            }catch{
                print("Dosya okunurken hata oluştu.")
            }
        }
    }
    
    @IBAction func btnSil(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let dosyaYolu = dir.appendingPathComponent("dosyam.txt")
            if FileManager.default.fileExists(atPath: dosyaYolu.path){
                do{
                    try FileManager.default.removeItem(at: dosyaYolu)
                    textFieldGirdi.text = ""
                }catch{
                    print("Dosya silinirken hata oluştu.")
                }
            }
        }
    }
    
    @IBAction func btnResimKaydet(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let dosyaYolu = dir.appendingPathComponent("resmim.jpg")
            let resim = UIImage(named: "wallpaper")
            do{
                try  resim!.jpegData(compressionQuality: 0.5)?.write(to: dosyaYolu)
            }catch{
                print("Resim yazılırken hata oluştu.")
            }
        }
    }
    
    @IBAction func btnResimGoster(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let dosyaYolu = dir.appendingPathComponent("resmim.jpg")
            self.imageView.image = UIImage(contentsOfFile: dosyaYolu.path)
        }
    }
    
    @IBAction func btnResimSil(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let dosyaYolu = dir.appendingPathComponent("resmim.jpg")
            if FileManager.default.fileExists(atPath: dosyaYolu.path){
                do{
                    try FileManager.default.removeItem(at: dosyaYolu)
                }catch{
                    print("Resim silinirken hata oluştu.")
                }
            }
        }
    }
}

