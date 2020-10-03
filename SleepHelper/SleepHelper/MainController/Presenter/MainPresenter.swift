//
//  .swift
//  SleepHelper
//
//  Created by Чанов Алексей Михайлович on 03.10.2020.
//

import Foundation

protocol MainPresenterProtocol: class {

}

final class MainPresenter: MainPresenterProtocol {

    private weak var view: MainViewProtocol?
    private let router: MainRouterProtocol?

    required init(view: MainViewProtocol, router: MainRouterProtocol) {
        self.view = view
        self.router = router
    }
}
