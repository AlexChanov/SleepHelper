//
//  RecommendationsViewController.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit

protocol RecommendationsViewProtocol: class {

}

final class RecommendationsViewController: UIViewController, RecommendationsViewProtocol{
	
	var presenter: RecommendationsPresenterProtocol?

		override func viewDidLoad() {
				super.viewDidLoad()
				view.backgroundColor = .red
		}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
	}
}
