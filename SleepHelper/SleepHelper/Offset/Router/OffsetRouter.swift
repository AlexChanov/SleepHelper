//
//  OffsetRouter.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit

protocol OffsetRouterProtocol: class {

		func showSettings()
	
		func showAddView()
}

final class OffsetRouter: OffsetRouterProtocol {

		let controller: UIViewController?

		required init(controller: UIViewController) {
				self.controller = controller
		}

		func showSettings() {}
	
		func showAddView() {}
}
