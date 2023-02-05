//
//  ViewController.swift
//  PickerView
//
//  Created by Serhat on 5.02.2023.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var pickerview: UIPickerView!
    
    var ulkeler:[String] = [String]()
    
    var secilenUlke:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ulkeler = ["Türkiye", "Almanya", "Japonya", "Rusya", "İtalya"]
        
        pickerview.delegate = self
        pickerview.dataSource = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ulkeler.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ulkeler[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelSonuc.text = ulkeler[row]
        secilenUlke = ulkeler[row]
    }
    
    @IBAction func btnGoster(_ sender: Any) {
        print(secilenUlke!)
    }
    
}

