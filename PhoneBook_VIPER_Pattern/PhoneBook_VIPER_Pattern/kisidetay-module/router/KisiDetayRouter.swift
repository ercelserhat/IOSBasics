//
//  KisiDetayRouter.swift
//  PhoneBook
//
//  Created by Serhat on 2.08.2023.
//

import Foundation

class KisiDetayRouter: PresenterToRouterKisiDetayProtocol{
    static func createModule(ref: KisiDetayVC) {
        ref.kisiDetayPresenterNesnesi = KisiDetayPresenter()
        ref.kisiDetayPresenterNesnesi?.kisiDetayInteractor = KisiDetayInteractor()
    }
}
