//
//  NotificationsViewController.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit

protocol NotificationsViewProtocol: class {

}

final class NotificationsViewController: UIViewController, NotificationsViewProtocol{
	
	var presenter: NotificationsPresenterProtocol?

		override func viewDidLoad() {
				super.viewDidLoad()
				view.backgroundColor = .red
		}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
	}
}
