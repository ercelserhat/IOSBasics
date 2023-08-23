//
//  KisiKayitInteractor.swift
//  PhoneBook
//
//  Created by Serhat on 2.08.2023.
//

import Foundation


class KisiKayitInteractor: PresenterToInteractorKisiKayitProtocol{
    
    let db: FMDatabase?
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func kisiEkle(kisi_ad: String, kisi_tel: String) {
        db?.open()
        do{
            try db?.executeUpdate("INSERT INTO kisiler (kisi_ad, kisi_tel) VALUES (?, ?)", values: [kisi_ad, kisi_tel])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
