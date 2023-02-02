//
//  ViewController.swift
//  SwitchAndSegmentedControl
//
//  Created by Serhat on 3.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var mySwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            print("Segmented Açık Seçildi.")
        }
        if sender.selectedSegmentIndex == 1{
            print("Segmented Kapalı Seçildi.")
        }
    }
    @IBAction func btnDurum(_ sender: Any) {
        print("Switch Durum: \(mySwitch.isOn)")
        print("Segmented Durum: \(segmentedControl.selectedSegmentIndex)")
    }
    
    @IBAction func switchKonumDegistir(_ sender: UISwitch) {
        if sender.isOn{
            print("Switch Açık")
        }else{
            print("Switch Kapalı")
        }
    }
}

