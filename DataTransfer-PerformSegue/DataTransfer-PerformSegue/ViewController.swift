//
//  ViewController.swift
//  DataTransfer-PerformSegue
//
//  Created by Serhat on 25.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var girdiAlani: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func gonderB(_ sender: Any) {
        let alinanVeri = girdiAlani.text!
        performSegue(withIdentifier: "aToB", sender: alinanVeri)
    }
    
    @IBAction func gonderC(_ sender: Any) {
        let alinanVeri = girdiAlani.text!
        performSegue(withIdentifier: "aToC", sender: alinanVeri)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "aToB"{
            print("A'dan B'ye geçiş oldu.")
            if let veri = sender as? String{
                let gidilecekVC = segue.destination as! ViewControllerB
                gidilecekVC.mesajB = veri
            }
        }
        if segue.identifier == "aToC"{
            print("A'dan C'ye geçiş oldu.")
            if let veri = sender as? String{
                let gidilecekVC = segue.destination as! ViewControllerC
                gidilecekVC.mesajC = veri
            }
        }
    }
}

