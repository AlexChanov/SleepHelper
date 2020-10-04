//
//  ViewController.swift
//  SleepHelper
//
//  Created by Чанов Алексей Михайлович on 03.10.2020.
//

import UIKit

protocol MainViewProtocol: class {

}

final class MainViewController: UIViewController, MainViewProtocol{

	@objc
	@IBAction func addButtonAction(_ sender: Any) {
		presenter?.showAddView()
	}
	
	@objc func newScreen() {
		presenter?.showAddView()
	}
	
	let addButton = UIButton(type: .system)
	
	var presenter: MainPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
			view.addSubview(addButton)
    }
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		addButton.addTarget(self, action: #selector(newScreen), for: .touchUpInside)
		addButton.frame.size = CGSize(width: 50, height: 50)
		addButton.center = view.center
		addButton.backgroundColor = .blue
	}
}

