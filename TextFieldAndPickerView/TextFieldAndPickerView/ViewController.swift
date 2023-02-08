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
        
        let toolBar = UIToolbar()
        toolBar.tintColor = UIColor.red
        toolBar.sizeToFit()
        
        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(ViewController.tamamTikla))
        
        let boslukButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let iptalButton = UIBarButtonItem(title: "İptal", style: .plain, target: self, action: #selector(self.iptalTikla))
        
        toolBar.setItems([iptalButton, boslukButton, tamamButton], animated: true)
        
        textFieldUlkeSec.inputAccessoryView = toolBar
        
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
    
    @objc func tamamTikla(){
        view.endEditing(true)
    }
    
    @objc func iptalTikla(){
        textFieldUlkeSec.text = ""
        textFieldUlkeSec.placeholder = "Ülke Seç"
        view.endEditing(true)
    }

}

