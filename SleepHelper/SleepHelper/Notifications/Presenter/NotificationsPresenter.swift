//
//  NotificationsPresenter.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import Foundation

protocol NotificationsPresenterProtocol: class {
	func showAddView()
}

final class NotificationsPresenter: NotificationsPresenterProtocol {
	func showAddView() {
		router?.showAddView()
	}
	

		private weak var view: NotificationsViewProtocol?
		private let router: NotificationsRouterProtocol?

		required init(view: NotificationsViewProtocol, router: NotificationsRouterProtocol) {
				self.view = view
				self.router = router
		}
}
