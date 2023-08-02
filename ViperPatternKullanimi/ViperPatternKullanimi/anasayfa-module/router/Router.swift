//
//  Router.swift
//  ViperPatternKullanimi
//
//  Created by Serhat on 2.08.2023.
//

import Foundation

class Router: PresenterToRouterProtocool{
    static func createModule(ref: ViewController) {
        let presenter = Presenter()
        
        //View katmanı değişkenleri
        ref.presenterNesnesi = presenter
        
        //Presenter katmanı değişkenleri
        ref.presenterNesnesi?.interactor = Interactor()
        ref.presenterNesnesi?.view = ref
        
        //Interactor katmanı değişkenleri
        ref.presenterNesnesi?.interactor?.presenter = presenter
    }
    
    
}
