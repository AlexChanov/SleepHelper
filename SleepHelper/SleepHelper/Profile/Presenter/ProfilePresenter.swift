//
//  ProfilePresenter.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import Foundation

protocol ProfilePresenterProtocol: class {
	func showAddView()
}

final class ProfilePresenter: ProfilePresenterProtocol {
	func showAddView() {
		router?.showAddView()
	}
	

		private weak var view: ProfileViewProtocol?
		private let router: ProfileRouterProtocol?

		required init(view: ProfileViewProtocol, router: ProfileRouterProtocol) {
				self.view = view
				self.router = router
		}
}
