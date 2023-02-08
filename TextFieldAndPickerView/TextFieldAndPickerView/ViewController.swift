//
//  ViewController.swift
//  TextFieldAndPickerView
//
//  Created by Serhat on 8.02.2023.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    

    @IBOutlet weak var textFieldUlkeSec: UITextField!
    
    var pickerView:UIPickerView?
    
    var ulkeler:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        ulkeler = ["Türkiye", "Almanya", "Japonya", "Rusya", "İtalya"]
       
        pickerView = UIPickerView()
        pickerView?.dataSource = self
        pickerView?.delegate = self
        
        textFieldUlkeSec.inputView = pickerView
        
    }
    
    //Kaç sütun?
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Kaç tane veri?
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ulkeler.count
    }
    
    //Verileri yazdıran metod
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ulkeler[row]
    }
    
    //seçilen index
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textFieldUlkeSec.text = ulkeler[row]
    }

}

