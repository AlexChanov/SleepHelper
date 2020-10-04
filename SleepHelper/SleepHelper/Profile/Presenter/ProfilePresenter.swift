//
//  ProfilePresenter.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import Foundation
import RealmSwift


protocol ProfilePresenterProtocol: class {
	func back()
	func done(date: Date, duration: Double)
}

final class ProfilePresenter: ProfilePresenterProtocol {
	
	func back() {
		router?.showAddView()
	}
	
	func done(date: Date, duration: Double) {
		
		let config = Realm.Configuration(schemaVersion: 1)
		// delete previous
		do {
			let realm = try Realm(configuration: config)
			
			let result = realm.objects(ProfileModel.self)
			for i in result {
				try realm.write({
					print("rewrite")
					i.timeAwake = date
					i.duration = duration
					
				})
				return
			}
			let newdata = ProfileModel()
				newdata.timeAwake = date
				newdata.duration = duration
			try realm.write(
				{
					realm.add(newdata)
					print("write new")
				}
			)
		} catch {
			print(error.localizedDescription)
		}
	}
	

		private weak var view: ProfileViewProtocol?
		private let router: ProfileRouterProtocol?

		required init(view: ProfileViewProtocol, router: ProfileRouterProtocol) {
				self.view = view
				self.router = router
		}
}

class ProfileModel: Object {
	@objc dynamic var timeAwake = Date()
	@objc dynamic var duration = 0.0
}
