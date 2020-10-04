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
	@State var workoutPressed = false
	let days = ["MON", "TUE", "WED", "THU", "FRI", "SUT", "SUN", ]
	@State private var selectedDays: Set<String> = []
	@State private var duration = 0.0
	@State private var picker = Date()
	
	var body: some View {
		VStack {
//			HStack {
//				Button(action: {
//					workoutPressed = false
//				}) {
//					HStack {
//						Spacer()
//						Text("Sleep Schedule")
//							.padding(11)
//						Spacer()
//					}
//				}
//				.buttonShadow(pressed: !workoutPressed)
//				.foregroundColor(Color.textColor)
//				Button(action: {
//					workoutPressed = true
//				}) {
//					HStack {
//						Spacer()
//						Text("Workouts")
//							.padding(11)
//						Spacer()
//					}
//				}
//				.buttonShadow(pressed: workoutPressed)
//				.foregroundColor(Color.textColor)
//			}
//			.padding(.vertical, 16)
//			if !workoutPressed {
				VStack(alignment: .leading) {
					VStack {
						HStack {
							Text("Sleep duration")
								.foregroundColor(.textColor)
							Spacer()
							Text(Helper.durationString(duration: duration))
								.foregroundColor(.textColor)
						}
						Slider(value: $duration, in: 0...12, step: 0.5)
					}
//					VStack(alignment: .leading) {
//						Text("Bedtime")
//							.foregroundColor(.textColor)
//						Button(action: {
//							workoutPressed = true
//						}) {
//							HStack {
//								Text("8 hrs")
//									.padding(11)
//								Spacer()
//							}
//							.frame(height: 55)
//						}
//						.buttonLongShadow()
//						.foregroundColor(Color.textColor)
//					}
					.padding(.vertical, 8)
					VStack(alignment: .leading) {
						Text("Wake up")
							.foregroundColor(.textColor)
						HStack {
						DatePicker("", selection: $picker, displayedComponents: .hourAndMinute)
							.fixedSize()
							.colorMultiply(.gray)
//						Spacer()
						}
//						Button(action: {
//							workoutPressed = true
//						}) {
//							HStack {
//								Text("6:15 AM")
//									.padding(11)
//								Spacer()
//							}
//							.frame(height: 55)
//						}
//						.buttonLongShadow()
//						.foregroundColor(Color.textColor)
					}
					.padding(.vertical, 8)
					RecomendationView(
						title: "Recommendations for nightly sleep", text: "Healthy adults need between 7 and 9 hours of sleep per night. Sleep powers the mind, restores the body, and fortifies virtually every system in the body.")
				}
//			}
//			else {
//				VStack() {
//					HStack {
//						Text("Training schedule")
//							.foregroundColor(.textColor)
//						Spacer()
//					}
//					HStack {
//						ForEach(days, id: \.self) { day in
//							Button(action: {
//								if !selectedDays.contains(day) {
//									selectedDays.insert(day)
//								} else {
//									selectedDays.remove(day)
//								}
//							}) {
//								Text(day)
//									.font(.system(size: 13))
//									.frame(width: 40, height: 28)
//							}
//							.buttonShadow(pressed: selectedDays.contains(day))
//							.foregroundColor(Color.textColor)
//						}
//					}
//					.padding(.vertical)
//					VStack {
//						Slider(value: $duration, in: 0...5, step: 0.25)
//						HStack {
//							Text("Duration")
//								.foregroundColor(.textColor)
//							Spacer()
//							Text(Helper.durationString(duration: duration))
//								.foregroundColor(.textColor)
//						}
//					}
//					.padding(.vertical)
//					RecomendationView(
//						title: "Strength training at any time of day may improve sleep", text: "Those who pump iron in the a.m. tend to fall asleep faster than those who work out later in the day.")
//				}
//			}
			Spacer()
		}
		.padding(24)
		.background(Color("BackgroundColor"))
	}
}

struct ProfilePreview: PreviewProvider {
	static var previews: some View {
		ProfileSwiftUIView()
	}
}
