//
//  ProfileViewController.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit

protocol ProfileViewProtocol: class {

}

final class ProfileViewController: UIViewController, ProfileViewProtocol{
	
	var presenter: ProfilePresenterProtocol?

		override func viewDidLoad() {
				super.viewDidLoad()
				view.backgroundColor = .red
		}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
	}
}
