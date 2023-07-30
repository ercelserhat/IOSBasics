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

        // Do any additional setup after loading the view.
    }
    @IBAction func notEkle(_ sender: Any) {
        if let ad = textFieldDersAdi.text, let not1 = textFieldNot1.text, let not2 = textFieldNot2.text{
            if let n1 = Int(not1), let n2 = Int(not2){
                notEkle(ders_adi: ad, not1: n1, not2: n2)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    func notEkle(ders_adi: String, not1: Int, not2: Int){
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/notlar/insert_not.php")!)
        request.httpMethod = "POST"
        let postString = "ders_adi=\(ders_adi)&not1=\(not1)&not2=\(not2)"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            if error != nil || data == nil{
                print("Hata")
                return
            }
            do{
                if let json = try JSONSerialization.jsonObject(with: data!) as? [String : Any]{
                    print(json)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}
