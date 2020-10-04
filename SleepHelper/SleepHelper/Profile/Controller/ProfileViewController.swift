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
	let swiftuiController = UIHostingController(rootView: ProfileSwiftUIView())

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

struct ProfileSwiftUIView: View {
	@State var workoutPressed = true
	let days = ["MON", "TUE", "WED", "THU", "FRI", "SUT", "SUN", ]
	@State private var selectedDays: Set<String> = []
	var body: some View {
		VStack {
			HStack {
				Button(action: {
					workoutPressed = false
				}) {
					HStack {
						Spacer()
						Text("Sleep Schedule")
							.padding(11)
						Spacer()
					}
				}
				.buttonShadow(pressed: !workoutPressed)
					.foregroundColor(Color.textColor)
				Button(action: {
					workoutPressed = true
				}) {
					HStack {
						Spacer()
						Text("Workouts")
							.padding(11)
						Spacer()
					}
				}
				.buttonShadow(pressed: workoutPressed)
					.foregroundColor(Color.textColor)
			}
			.padding(.vertical, 16)
			if !workoutPressed {
			VStack(alignment: .leading) {
				VStack(alignment: .leading) {
					Text("Bedtime")
						.foregroundColor(.textColor)
					Button(action: {
						workoutPressed = true
					}) {
						HStack {
							Text("8 hrs")
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
					Text("Wake up")
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
				HStack(alignment: .top) {
				Circle()
					.frame(width: 48, height: 48)
				VStack(alignment: .leading) {
					Text("Annie")
						.foregroundColor(.textSecondColor)
					Text("Recommendations")
						.foregroundColor(.textColor)
					Text("Healthy")
						.foregroundColor(.textSecondColor)
				}
			}
				.padding(.vertical, 16)
			}
			} else {
				VStack() {
					HStack {
						Text("Training schedule")
						Spacer()
					}
					HStack {
						ForEach(days, id: \.self) { day in
							Button(action: {
								if !selectedDays.contains(day) {
								selectedDays.insert(day)
								} else {
									selectedDays.remove(day)
								}
							}) {
								Text(day)
									.font(.system(size: 13))
									.frame(width: 40, height: 28)
							}
							.buttonShadow(pressed: selectedDays.contains(day))
								.foregroundColor(Color.textColor)
						}
					}
					.padding(.vertical)
				}
			}
			Spacer()
		}
		.padding()
		.background(Color("BackgroundColor"))
	}
}
struct ProfilePreview: PreviewProvider {
	static var previews: some View {
		ProfileSwiftUIView()
	}
}
