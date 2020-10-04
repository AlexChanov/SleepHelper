//
//  .swift
//  SleepHelper
//
//  Created by Чанов Алексей Михайлович on 03.10.2020.
//

import Foundation

protocol MainPresenterProtocol: class {
	func showAddView()
}

final class MainPresenter: MainPresenterProtocol {
	func showAddView() {
		router?.showAddView()
	}
	

    private weak var view: MainViewProtocol?
    private let router: MainRouterProtocol?

    required init(view: MainViewProtocol, router: MainRouterProtocol) {
        self.view = view
        self.router = router
    }
}
