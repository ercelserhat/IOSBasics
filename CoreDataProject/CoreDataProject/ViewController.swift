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
        //veriKaydet()
        //veriOkuma()
        //veriSil()
        //veriGuncelle()
        //veriOkuma()
        //veriOkumaSiralama()
        veriOkumaFiltreleme()
    }
    
    //CoreData - Save Data
    func veriKaydet(){
        let kisi = Kisiler(context: context)
        kisi.kisi_ad = "Serap"
        kisi.kisi_yas = 23
        
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
    
    //CoreData - Delete Data
    func veriSil(){
        let kisi = kisilerListe[1]
        context.delete(kisi)
        appDelegate.saveContext()
    }
    
    //CoreData - Update
    func veriGuncelle(){
        let kisi = kisilerListe[1]
        kisi.kisi_ad = "YENİ KİŞİ"
        kisi.kisi_yas = 99
        appDelegate.saveContext()
    }
    
    //Sorting
    func veriOkumaSiralama(){
        
        let fetchRequest: NSFetchRequest<Kisiler> = Kisiler.fetchRequest()
        let sort = NSSortDescriptor(key: #keyPath(Kisiler.kisi_yas), ascending: true)
        fetchRequest.sortDescriptors = [sort]
        do{
            kisilerListe = try context.fetch(fetchRequest)
        }catch{
            print("Veri okunurken hata oluştu.")
        }
        
        for kisi  in kisilerListe{
            print("Ad: \(kisi.kisi_ad!) - Yaş: \(kisi.kisi_yas)")
        }
    }
    
    //Filtering (Predicate)
    func veriOkumaFiltreleme(){
        let fetchRequest: NSFetchRequest<Kisiler> = Kisiler.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "kisi_yas == %i", 23)
        do{
            kisilerListe = try context.fetch(fetchRequest)
        }catch{
            print("Veri okunurken hata oluştu.")
        }
        
        for kisi  in kisilerListe{
            print("Ad: \(kisi.kisi_ad!) - Yaş: \(kisi.kisi_yas)")
        }
    }
}
