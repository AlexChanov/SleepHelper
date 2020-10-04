//
//  SettingsViewController.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit
import SwiftUI

protocol SettingsViewProtocol: class {
	
}

final class SettingsViewController: UIViewController, SettingsViewProtocol{
	
	var presenter: SettingsPresenterProtocol?
	let swiftuiController = UIHostingController(rootView: SettingsView())

	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .backgroundColor
		swiftuiController.view.translatesAutoresizingMaskIntoConstraints = true
		swiftuiController.view.frame = view.bounds
		view.addSubview(swiftuiController.view)
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
	}
}

struct SettingsView: View {

	var body: some View {
		VStack(alignment: .leading) {
			HStack {
				Image(systemName: "sun.haze")
					.resizable()
					.scaledToFit()
					.frame(width: 25, height: 25)
				Text("Recomendations")
				Spacer()
			}
			.padding(.vertical)
			HStack {
				Image(systemName: "bell")
					.resizable()
					.scaledToFit()
					.frame(width: 25, height: 25)
				Text("Notifications")
			}
			.padding(.vertical)
			HStack {
				Image(systemName: "person.2.square.stack")
					.resizable()
					.scaledToFit()
					.frame(width: 25, height: 25)
				Text("About Us")
			}
			.padding(.vertical)
			Spacer()
		}
		.padding(24)
		.foregroundColor(.textColor)
	}
}

struct SettingsPreview: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}
