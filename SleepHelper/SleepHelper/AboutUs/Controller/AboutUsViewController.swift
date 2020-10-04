//
//  AboutUsViewController.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit
import SwiftUI

protocol AboutUsViewProtocol: class {

}

final class AboutUsViewController: UIViewController, AboutUsViewProtocol{
	
	var presenter: AboutUsPresenterProtocol?
	let swiftuiController = UIHostingController(rootView: AboutUsView())

	
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

struct AboutUsView: View {
	@State private var notificationSettings = [
		("notifications", false),
		("alarm", false),
		("reminders", false)
	]

	var body: some View {
		VStack(alignment: .leading) {
			HStack {
				Image("AboutUs")
					.resizable()
					.scaledToFit()
					.frame(width: 48, height: 48)
				Text("3 Comma Club")
					.font(.system(size: 14))
			}
			.padding(.vertical)
			.foregroundColor(.textColor)

			Text("Our Story")
				.padding(.bottom)
				.font(.system(size: 24))
				.foregroundColor(.textColor)

			Text("We created the Sleep App to help astronauts and people on long flights adjust their sleep schedule. We keep it simple to make it easy to use even in the most difficult conditions. It has simple tips and tricks to help people to getting quality sleep and choose the right time for traning.")
				.padding(.vertical)
				.font(.system(size: 13))
				.lineSpacing(13)
				.foregroundColor(.textSecondColor)
			Spacer()
		}
		.padding(24)
	}
}

struct AboutUsPreview: PreviewProvider {
	static var previews: some View {
		AboutUsView()
	}
}
