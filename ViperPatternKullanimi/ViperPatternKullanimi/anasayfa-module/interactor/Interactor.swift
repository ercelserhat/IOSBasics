//
//  Interactor.swift
//  ViperPatternKullanimi
//
//  Created by Serhat on 2.08.2023.
//

import Foundation

class Interactor: PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?
    
    func topla(sayi1: String, sayi2: String) {
        if let s1 = Int(sayi1), let s2 = Int(sayi2){
            let toplam = s1 + s2
            presenter?.presenteraVeriGonder(sonuc: String(toplam))
        }
    }
    
    func carp(sayi1: String, sayi2: String) {
        if let s1 = Int(sayi1), let s2 = Int(sayi2){
            let carpim = s1 * s2
            presenter?.presenteraVeriGonder(sonuc: String(carpim))
        }
    }
}
