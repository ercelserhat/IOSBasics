//
//  KisiKayitRouter.swift
//  PhoneBook
//
//  Created by Serhat on 2.08.2023.
//

import Foundation

class KisiKayitRouter: PresenterToRouterKisiKayitProtocol{
    static func createModule(ref: KisiKayitVC) {
        ref.kisiKayitPresenterNesnesi = KisiKayitPresenter()
        ref.kisiKayitPresenterNesnesi?.kisiKayitInteractor = KisiKayitInteractor()
    }
}
