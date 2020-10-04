//
//  TimezoneViewController.swift
//  
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit

protocol TimezoneViewProtocol: class {

}

final class TimezoneViewController: UIViewController, TimezoneViewProtocol{
	
	var presenter: TimezonePresenterProtocol?

		override func viewDidLoad() {
				super.viewDidLoad()
				view.backgroundColor = .red
		}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
	}
}
