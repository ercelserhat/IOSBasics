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
    
    var timePicker:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        
        tarih.inputView = datePicker
        
        datePicker?.addTarget(self, action: #selector(self.tarihGoster(datepicker:)), for: .valueChanged)
        
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(self.dokunmaAlgilamaMetod))
        view.addGestureRecognizer(dokunmaAlgilama)
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        saat.inputView = timePicker
        
        timePicker?.addTarget(self, action: #selector(self.saatGoster(timepicker:)), for: .valueChanged)
    }
    
    @objc func tarihGoster(datepicker:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let alinanTarih = dateFormatter.string(from: datepicker.date)
        print(alinanTarih)
        tarih.text = alinanTarih
        //view.endEditing(true)
    }
    
    @objc func saatGoster(timepicker:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        let alinanSaat = dateFormatter.string(from: timepicker.date)
        print(alinanSaat)
        saat.text = alinanSaat
    }
    
    @objc func dokunmaAlgilamaMetod(){
        view.endEditing(true)
    }

}

