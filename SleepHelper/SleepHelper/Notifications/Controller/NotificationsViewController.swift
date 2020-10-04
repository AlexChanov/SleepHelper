//
//  NotificationsViewController.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit
import SwiftUI

protocol NotificationsViewProtocol: class {

}

final class NotificationsViewController: UIViewController, NotificationsViewProtocol{
	
	var presenter: NotificationsPresenterProtocol?
	let swiftuiController = UIHostingController(rootView: NotificationsView())

	
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

struct NotificationsView: View {
	@State private var notificationSettings = [
		("notifications", false),
		("alarm", false),
		("reminders", false)
	]

	var body: some View {
		VStack(alignment: .leading) {
			HStack {
				Text("Notifications")
				Spacer()
				Toggle("", isOn: $notificationSettings[0].1)
			}
			.padding(.vertical)
			HStack {
				Text("Alarm")
				Spacer()
				Toggle("", isOn: $notificationSettings[1].1)
			}
			.padding(.vertical)
			HStack {
				Text("Reminders")
				Spacer()
				Toggle("", isOn: $notificationSettings[2].1)
			}
			.padding(.vertical)
			Spacer()
		}
		.padding(24)
		.foregroundColor(.textColor)
		.toggleStyle(SwitchToggleStyle(tint: .blue))
	}
}

struct NotificationsPreview: PreviewProvider {
	static var previews: some View {
		NotificationsView()
	}
}
