//
//  ViewController.swift
//  DateAndTimePicker
//
//  Created by Serhat on 5.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var saat: UITextField!
    @IBOutlet weak var tarih: UITextField!
    
    var datePicker:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        
        tarih.inputView = datePicker
        
        datePicker?.addTarget(self, action: #selector(self.tarihGoster(datepicker:)), for: .valueChanged)
        
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(self.dokunmaAlgilamaMetod))
        view.addGestureRecognizer(dokunmaAlgilama)
    }
    
    @objc func tarihGoster(datepicker:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let alinanTarih = dateFormatter.string(from: datepicker.date)
        print(alinanTarih)
        tarih.text = alinanTarih
        //view.endEditing(true)
    }
    
    @objc func dokunmaAlgilamaMetod(){
        view.endEditing(true)
    }

}

