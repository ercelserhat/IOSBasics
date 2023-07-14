//
//  Kisilerdao.swift
//  SQLite
//
//  Created by Serhat on 14.07.2023.
//

import Foundation

class Kisilerdao{
    let db: FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("kisilergiris.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func kisiEkle(kisi_ad: String, kisi_yas: Int){
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO kisiler (kisi_ad, kisi_yas) VALUES (?, ?)", values: [kisi_ad, kisi_yas])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
