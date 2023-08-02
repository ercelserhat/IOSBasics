//
//  AnasayfaRouter.swift
//  PhoneBook
//
//  Created by Serhat on 2.08.2023.
//

import Foundation

class AnasayfaRouter: PresenterToRouterAnasayfaProtocol{
    static func createModule(ref: AnasayfaVC) {
        let presenter = AnasayfaPresenter()
        ref.anasayfaPresenterNesnesi = presenter
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor = AnasayfaInteractor()
        ref.anasayfaPresenterNesnesi?.anasayfaView = ref
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor?.anasayfaPresenter = presenter
    }
    
}
