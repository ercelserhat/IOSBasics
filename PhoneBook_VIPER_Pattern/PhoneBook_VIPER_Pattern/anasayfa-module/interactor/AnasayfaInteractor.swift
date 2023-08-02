//
//  AnasayfaInteractor.swift
//  PhoneBook
//
//  Created by Serhat on 2.08.2023.
//

import Foundation

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol{
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumKisileriAl() {
        var liste = [Kisiler]()
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Serhat", kisi_tel: "11111")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Serap", kisi_tel: "222")
        liste.append(k1)
        liste.append(k2)
        anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
    }
    
    func kisiAra(aramaKelimesi: String) {
        print("Arama Sonucu: \(aramaKelimesi)")
    }
    
    func kisiSil(kisi_id: Int) {
        print("\(kisi_id) silindi!")
    }
}
