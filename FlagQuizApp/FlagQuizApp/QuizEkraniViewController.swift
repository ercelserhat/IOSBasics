//
//  QuizEkraniViewController.swift
//  FlagQuizApp
//
//  Created by Serhat on 17.07.2023.
//

import UIKit

class QuizEkraniViewController: UIViewController {

    @IBOutlet weak var labelDogru: UILabel!
    @IBOutlet weak var labelYanlis: UILabel!
    @IBOutlet weak var labelSoruSayisi: UILabel!
    @IBOutlet weak var imageViewBayrak: UIImageView!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    var sorular = [Bayraklar]()
    var yanlisSecenekler = [Bayraklar]()
    var dogruSoru: Bayraklar?
    var soruSayac = 0
    var dogruSayac = 0
    var yanlisSayac = 0
    
    var secenekler = [Bayraklar]()
    var seceneklerKaristirmaListesi = Set<Bayraklar>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sorular = Bayraklardao().rastgele5Getir()
        soruYukle()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gidilecekVC = segue.destination as! SonucEkraniViewController
        gidilecekVC.dogruSayisi = dogruSayac
    }
    
    func soruYukle(){
        labelSoruSayisi.text = "\(soruSayac + 1). SORU"
        labelDogru.text = "Doğru: \(dogruSayac)"
        labelYanlis.text = "Yanlış: \(yanlisSayac)"
        
        dogruSoru = sorular[soruSayac]
        imageViewBayrak.image = UIImage(named: dogruSoru?.bayrak_resim ?? "turkiye")
        yanlisSecenekler = Bayraklardao().rastgele3YanlisSecenekGetir(bayrak_id: dogruSoru?.bayrak_id ?? 1)
        seceneklerKaristirmaListesi.removeAll()
        seceneklerKaristirmaListesi.insert(dogruSoru!)
        seceneklerKaristirmaListesi.insert(yanlisSecenekler[0])
        seceneklerKaristirmaListesi.insert(yanlisSecenekler[1])
        seceneklerKaristirmaListesi.insert(yanlisSecenekler[2])
        
        secenekler.removeAll()
        for s in seceneklerKaristirmaListesi{
            secenekler.append(s)
        }
        
        buttonA.setTitle(secenekler[0].bayrak_ad, for: .normal)
        buttonB.setTitle(secenekler[1].bayrak_ad, for: .normal)
        buttonC.setTitle(secenekler[2].bayrak_ad, for: .normal)
        buttonD.setTitle(secenekler[3].bayrak_ad, for: .normal)
    }
    
    func dogruKontrol(button: UIButton){
        let buttonYazi = button.titleLabel?.text
        let dogruCevap = dogruSoru?.bayrak_ad
        print("Button yazı: \(buttonYazi!)")
        print("Doğru cevap: \(dogruCevap!)")
        
        if dogruCevap == buttonYazi{
            dogruSayac += 1
        }else{
            yanlisSayac += 1
        }
        
        labelDogru.text = "Doğru: \(dogruSayac)"
        labelYanlis.text = "Yanlış: \(yanlisSayac)"
    }
    
    func soruSayacKontrol(){
        soruSayac += 1
        if soruSayac != 5{
            soruYukle()
        }else{
            performSegue(withIdentifier: "toSonucEkrani", sender: nil)
        }
    }
    
    @IBAction func buttonAtikla(_ sender: Any) {
        dogruKontrol(button: buttonA)
        soruSayacKontrol()
    }
    
    @IBAction func buttonBtikla(_ sender: Any) {
        dogruKontrol(button: buttonB)
        soruSayacKontrol()
    }
    
    @IBAction func buttonCtikla(_ sender: Any) {
        dogruKontrol(button: buttonC)
        soruSayacKontrol()
    }
    
    @IBAction func buttonDtikla(_ sender: Any) {
        dogruKontrol(button: buttonD)
        soruSayacKontrol()
    }
}
