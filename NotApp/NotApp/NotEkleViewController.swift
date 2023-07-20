//
//  NotEkleViewController.swift
//  NotApp
//
//  Created by Serhat on 19.07.2023.
//

import UIKit

class NotEkleViewController: UIViewController {

    @IBOutlet weak var textFieldDersAdi: UITextField!
    @IBOutlet weak var textFieldNot1: UITextField!
    @IBOutlet weak var textFieldNot2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func notEkle(_ sender: Any) {
        if let ad = textFieldDersAdi.text, let not1 = textFieldNot1.text, let not2 = textFieldNot2.text{
            if let n1 = Int(not1), let n2 = Int(not2){
                Notlardao().notEkle(ders_adi: ad, not1: Int(n1), not2: Int(n2))
            }
        }
        navigationController?.popViewController(animated: true)
    }
}
