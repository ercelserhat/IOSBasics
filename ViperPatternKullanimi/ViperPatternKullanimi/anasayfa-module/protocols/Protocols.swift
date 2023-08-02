//
//  Protocols.swift
//  ViperPatternKullanimi
//
//  Created by Serhat on 2.08.2023.
//

import Foundation

//Ana Protokoller
protocol PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol? {get set}
    
    func topla(sayi1: String, sayi2: String)
    func carp(sayi1: String, sayi2: String)
}

protocol ViewToPresenterProtocol{
    var interactor: PresenterToInteractorProtocol? {get set}
    var view: PresenterToViewProtocol? {get set}
    
    func toplamaYap(sayi1: String, sayi2: String)
    func carpmaYap(sayi1: String, sayi2: String)
}

//Taşıyıcı Protokoller
protocol InteractorToPresenterProtocol{
    func presenteraVeriGonder(sonuc: String)
}

protocol PresenterToViewProtocol{
    func vieweVeriGonder(sonuc: String)
}

protocol PresenterToRouterProtocool{
    static func createModule(ref: ViewController)
}
