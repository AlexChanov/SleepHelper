//
//  RecommendationsPresenter.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import Foundation

protocol RecommendationsPresenterProtocol: class {
	func showAddView()
}

final class RecommendationsPresenter: RecommendationsPresenterProtocol {
	func showAddView() {
		router?.showAddView()
	}
	

		private weak var view: RecommendationsViewProtocol?
		private let router: RecommendationsRouterProtocol?

		required init(view: RecommendationsViewProtocol, router: RecommendationsRouterProtocol) {
				self.view = view
				self.router = router
		}
}
