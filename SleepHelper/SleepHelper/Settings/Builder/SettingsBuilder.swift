//
//  SettingsBuilder.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit

final class SettingsBuilder {

		public func createSettingsModule() -> UIViewController {
				let view = SettingsViewController()
				let router = SettingsRouter(controller: view)
				let presenter = SettingsPresenter(view: view, router: router)
				view.presenter = presenter

				return view
		}
}
