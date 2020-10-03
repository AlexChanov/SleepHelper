//
//  ProfileViewController.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit
import SwiftUI

protocol ProfileViewProtocol: class {

}

final class ProfileViewController: UIViewController, ProfileViewProtocol{
	
	var presenter: ProfilePresenterProtocol?
	let sleepingButton = UIButton(type: .system)
	let trainingsButton = UIButton(type: .system)
	let swiftuiController = UIHostingController(rootView: HelloWorld())

		override func viewDidLoad() {
				super.viewDidLoad()
//				view.backgroundColor = .backgroundColor
			swiftuiController.view.translatesAutoresizingMaskIntoConstraints = false
			swiftuiController.view.frame = view.bounds
			view.addSubview(swiftuiController.view)
		}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
	}
}

struct HelloWorld: View {
	var body: some View {
		Text("Hello world")
	}
}
