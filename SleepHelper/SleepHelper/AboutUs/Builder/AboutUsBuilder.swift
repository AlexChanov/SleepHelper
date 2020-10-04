//
//  AboutUsBuilder.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit

final class AboutUsBuilder {

		public func createAboutUsModule() -> UIViewController {
				let view = AboutUsViewController()
				let router = AboutUsRouter(controller: view)
				let presenter = AboutUsPresenter(view: view, router: router)
				view.presenter = presenter

				return view
		}
}
