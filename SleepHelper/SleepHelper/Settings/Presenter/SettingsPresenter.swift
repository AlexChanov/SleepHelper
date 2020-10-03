//
//  SettingsPresenter.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import Foundation

protocol SettingsPresenterProtocol: class {
	func showAddView()
}

final class SettingsPresenter: SettingsPresenterProtocol {
	func showAddView() {
		router?.showAddView()
	}
	

		private weak var view: SettingsViewProtocol?
		private let router: SettingsRouterProtocol?

		required init(view: SettingsViewProtocol, router: SettingsRouterProtocol) {
				self.view = view
				self.router = router
		}
}
