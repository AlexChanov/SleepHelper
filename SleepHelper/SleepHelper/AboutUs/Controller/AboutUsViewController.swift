//
//  AboutUsViewController.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit

protocol AboutUsViewProtocol: class {

}

final class AboutUsViewController: UIViewController, AboutUsViewProtocol{
	
	var presenter: AboutUsPresenterProtocol?

		override func viewDidLoad() {
				super.viewDidLoad()
				view.backgroundColor = .red
		}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
	}
}
