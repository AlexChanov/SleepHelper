//
//  TimezonePresenter.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import Foundation

protocol TimezonePresenterProtocol: class {
	func showAddView()
}

final class TimezonePresenter: TimezonePresenterProtocol {
	func showAddView() {
		router?.showAddView()
	}
	

		private weak var view: TimezoneViewProtocol?
		private let router: TimezoneRouterProtocol?

		required init(view: TimezoneViewProtocol, router: TimezoneRouterProtocol) {
				self.view = view
				self.router = router
		}
}
