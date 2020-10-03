//
//  RecommendationsBuilder.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit

final class RecommendationsBuilder {

		public func createRecommendationsModule() -> UIViewController {
				let view = RecommendationsViewController()
				let router = RecommendationsRouter(controller: view)
				let presenter = RecommendationsPresenter(view: view, router: router)
				view.presenter = presenter

				return view
		}
}
