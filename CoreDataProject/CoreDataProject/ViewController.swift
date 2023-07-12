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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //CoreData - Save Data
    func veriKaydet(){
        let kisi = Kisiler(context: context)
        kisi.kisi_ad = "Serhat"
        kisi.kisi_yas = 31
        
        appDelegate.saveContext()
    }
}
