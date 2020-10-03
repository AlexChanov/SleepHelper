//
//  OffsetViewController.swift
//  
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit

protocol OffsetViewProtocol: class {

}

final class OffsetViewController: UIViewController, OffsetViewProtocol{
	
	var presenter: OffsetPresenterProtocol?

		override func viewDidLoad() {
				super.viewDidLoad()
				view.backgroundColor = .red
		}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
	}
}
