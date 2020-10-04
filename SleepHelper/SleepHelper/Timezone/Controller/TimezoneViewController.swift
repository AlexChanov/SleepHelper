//
//  TimezoneViewController.swift
//  
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit
import SwiftUI

protocol TimezoneViewProtocol: class {

}

final class TimezoneViewController: UIViewController, TimezoneViewProtocol{
	
	var presenter: TimezonePresenterProtocol?
	let swiftuiController = UIHostingController(rootView: TimezoneView())
	
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

struct TimezoneView: View {
	@State var workoutPressed = true
	let days = ["MON", "TUE", "WED", "THU", "FRI", "SUT", "SUN", ]
	@State private var selectedDays: Set<String> = []
	@State private var duration = 0.0
	var body: some View {
		VStack {
			VStack(alignment: .leading) {
				Text("Departure")
					.foregroundColor(.textColor)
				Button(action: {
					workoutPressed = true
				}) {
					HStack {
						Text("6:15 AM")
							.padding(11)
						Spacer()
					}
					.frame(height: 55)
				}
				.buttonLongShadow()
				.foregroundColor(Color.textColor)
			}
				.padding(.vertical, 8)
			VStack(alignment: .leading) {
				Text("Arrival")
					.foregroundColor(.textColor)
				Button(action: {
					workoutPressed = true
				}) {
					HStack {
						Text("6:15 AM")
							.padding(11)
						Spacer()
					}
					.frame(height: 55)
				}
				.buttonLongShadow()
				.foregroundColor(Color.textColor)
			}
			.padding(.vertical, 8)
			VStack {
				Slider(value: $duration, in: -12...12, step: 0.5)
				HStack {
					Spacer()
					Text(Helper.durationString(duration: duration))
						.foregroundColor(.textColor)
				}
			}
			.padding(.vertical, 32)
			Spacer()
		}
		.padding(24)
		.background(Color("BackgroundColor"))
	}
}

struct TimezonePreview: PreviewProvider {
	static var previews: some View {
		TimezoneView()
	}
}
