//
//  KisiKayitInteractor.swift
//  PhoneBook
//
//  Created by Serhat on 2.08.2023.
//

import Foundation

class KisiKayitInteractor: PresenterToInteractorKisiKayitProtocol{
    func kisiEkle(kisi_ad: String, kisi_tel: String) {
        print("Kişi Kayıt: \(kisi_ad) - \(kisi_tel)")
    }
}
