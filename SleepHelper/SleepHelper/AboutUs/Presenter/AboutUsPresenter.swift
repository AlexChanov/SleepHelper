//
//  AboutUsPresenter.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import Foundation

protocol AboutUsPresenterProtocol: class {
	func showAddView()
}

final class AboutUsPresenter: AboutUsPresenterProtocol {
	func showAddView() {
		router?.showAddView()
	}
	

		private weak var view: AboutUsViewProtocol?
		private let router: AboutUsRouterProtocol?

		required init(view: AboutUsViewProtocol, router: AboutUsRouterProtocol) {
				self.view = view
				self.router = router
		}
}
