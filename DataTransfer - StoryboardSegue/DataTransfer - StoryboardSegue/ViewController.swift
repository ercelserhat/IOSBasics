//
//  ViewController.swift
//  DataTransfer - StoryboardSegue
//
//  Created by Serhat on 22.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var girdiAlani: UITextField!
    
    @IBAction func gonderB(_ sender: Any) {
    }
    
    @IBAction func gonderC(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let gidecekMesaj = girdiAlani.text!
        
        if segue.identifier == "gofromAtoB"{
            print("A'dan B'ye geçiş.")
            let gidilecekVC = segue.destination as! ViewControllerB
            gidilecekVC.mesajB = gidecekMesaj
        }
        if segue.identifier == "gofromAtoC"{
            print("A'dan C'ye geçiş.")
            let gidilecekVC = segue.destination as! ViewControllerC
            gidilecekVC.mesajC = gidecekMesaj
        }
    }
}

