//
//  OffsetBuilder.swift
//  
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit

final class OffsetBuilder {

		public func createOffsetModule() -> UIViewController {
				let view = OffsetViewController()
//				let router = MainRouter(controller: view)
//				let presenter = MainPresenter(view: view, router: router)
//				view.presenter = presenter

				return view
		}
}
