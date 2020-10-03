//
//  OffsetPresenter.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import Foundation

protocol OffsetPresenterProtocol: class {
	func showAddView()
}

final class OffsetPresenter: OffsetPresenterProtocol {
	func showAddView() {
		router?.showAddView()
	}
	

		private weak var view: OffsetViewProtocol?
		private let router: OffsetRouterProtocol?

		required init(view: OffsetViewProtocol, router: OffsetRouterProtocol) {
				self.view = view
				self.router = router
		}
}
