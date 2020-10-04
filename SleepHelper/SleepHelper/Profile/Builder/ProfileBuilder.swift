//
//  ProfileBuilder.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit

final class ProfileBuilder {

		public func createProfileModule() -> UIViewController {
				let view = ProfileViewController()
				let router = ProfileRouter(controller: view)
				let presenter = ProfilePresenter(view: view, router: router)
				view.presenter = presenter

				return view
		}
}
