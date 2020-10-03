//
//  NotificationsBuilder.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit

final class NotificationsBuilder {

		public func createNotificationsModule() -> UIViewController {
				let view = NotificationsViewController()
				let router = NotificationsRouter(controller: view)
				let presenter = NotificationsPresenter(view: view, router: router)
				view.presenter = presenter

				return view
		}
}
