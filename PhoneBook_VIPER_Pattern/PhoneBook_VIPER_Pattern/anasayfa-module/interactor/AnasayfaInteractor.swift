//
//  AnasayfaInteractor.swift
//  PhoneBook
//
//  Created by Serhat on 2.08.2023.
//

import Foundation

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol{
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    let db: FMDatabase?
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func tumKisileriAl() {
        var liste = [Kisiler]()
        db?.open()
        do{
            let rs = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            while rs.next(){
                let kisi = Kisiler(kisi_id: Int(rs.string(forColumn: "kisi_id")!)!, kisi_ad: rs.string(forColumn: "kisi_ad")!, kisi_tel: rs.string(forColumn: "kisi_tel")!)
                liste.append(kisi)
            }
            anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func kisiAra(aramaKelimesi: String) {
        var liste = [Kisiler]()
        db?.open()
        do{
            let rs = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad like '%\(aramaKelimesi)%'", values: nil)
            while rs.next(){
                let kisi = Kisiler(kisi_id: Int(rs.string(forColumn: "kisi_id")!)!, kisi_ad: rs.string(forColumn: "kisi_ad")!, kisi_tel: rs.string(forColumn: "kisi_tel")!)
                liste.append(kisi)
            }
            anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func kisiSil(kisi_id: Int) {
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [kisi_id])
            tumKisileriAl()
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
