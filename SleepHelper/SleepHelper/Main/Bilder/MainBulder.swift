//
//  MainBulder.swift
//  SleepHelper
//
//  Created by Чанов Алексей Михайлович on 03.10.2020.
//

import UIKit

final class MainBuilder { 

    public func createMainModule() -> UIViewController {
        let view = MainViewController()
        let router = MainRouter(controller: view)
        let presenter = MainPresenter(view: view, router: router)
        view.presenter = presenter

        return view
    }
}
