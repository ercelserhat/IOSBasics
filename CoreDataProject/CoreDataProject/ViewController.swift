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

    override func viewDidLoad() {
        
        let context = appDelegate.persistentContainer.viewContext
        
        super.viewDidLoad()
    }
}
