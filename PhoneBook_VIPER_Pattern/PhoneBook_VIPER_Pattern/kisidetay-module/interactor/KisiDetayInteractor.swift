//
//  KisiDetayInteractor.swift
//  PhoneBook
//
//  Created by Serhat on 2.08.2023.
//

import Foundation

class KisiDetayInteractor: PresenterToInteractorKisiDetayProtocol{
    func kisiGuncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String) {
        print("Kişi Güncelle: \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
    }
}
