//
//  SettingsViewController.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit

protocol SettingsViewProtocol: class {

}

final class SettingsViewController: UIViewController, SettingsViewProtocol{
	
	var presenter: SettingsPresenterProtocol?

		override func viewDidLoad() {
				super.viewDidLoad()
				view.backgroundColor = .red
		}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
	}
}
