//
//  ViewController.swift
//  CoreDataProject
//
//  Created by Serhat on 12.07.2023.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext
    
    var kisilerListe = [Kisiler]()

    override func viewDidLoad() {
        super.viewDidLoad()
        veriKaydet()
        veriOkuma()
    }
    
    //CoreData - Save Data
    func veriKaydet(){
        let kisi = Kisiler(context: context)
        kisi.kisi_ad = "Serhat"
        kisi.kisi_yas = 31
        
        appDelegate.saveContext()
    }
    
    //CoreData - Read Data
    func veriOkuma(){
        do{
            kisilerListe = try context.fetch(Kisiler.fetchRequest())
        }catch{
            print("Veri okunurken hata oluştu.")
        }
        
        for kisi  in kisilerListe{
            print("Ad: \(kisi.kisi_ad!) - Yaş: \(kisi.kisi_yas)")
        }
    }
}
