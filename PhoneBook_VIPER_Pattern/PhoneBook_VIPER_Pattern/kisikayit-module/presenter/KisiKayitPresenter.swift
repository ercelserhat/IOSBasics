//
//  KisiKayitPresenter.swift
//  PhoneBook
//
//  Created by Serhat on 2.08.2023.
//

import Foundation

class KisiKayitPresenter: ViewToPresenterKisiKayitProtocol{
    var kisiKayitInteractor: PresenterToInteractorKisiKayitProtocol?
    
    func ekle(kisi_ad: String, kisi_tel: String) {
        kisiKayitInteractor?.kisiEkle(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
}
