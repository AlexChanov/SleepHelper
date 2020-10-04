//
//  TimezoneBuilder.swift
//  
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit

final class TimezoneBuilder {

		public func createTimezoneModule() -> UIViewController {
				let view = TimezoneViewController()
				let router = TimezoneRouter(controller: view)
				let presenter = TimezonePresenter(view: view, router: router)
				view.presenter = presenter

				return view
		}
}
