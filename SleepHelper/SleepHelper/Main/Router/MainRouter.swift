//
//  MainRouter.swift
//  SleepHelper
//
//  Created by Чанов Алексей Михайлович on 03.10.2020.
//

import UIKit

protocol MainRouterProtocol: class {

    func showSettings()
	
		func showAddView()
}

final class MainRouter: MainRouterProtocol {

    let controller: UIViewController?

    required init(controller: UIViewController) {
        self.controller = controller
    }

    func showSettings() {}
	
		func showAddView() {
			let timezoneBuilder = TimezoneBuilder()
			let timezoneController = timezoneBuilder.createTimezoneModule()
			controller?.present(timezoneController, animated: true, completion: {})
		}
}
