//
//  ProfileViewController.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit
import SwiftUI
import RealmSwift

protocol ProfileViewProtocol: class {
	
}

final class ProfileViewController: UIViewController, ProfileViewProtocol{
	
	var presenter: ProfilePresenterProtocol?
	
	lazy var swiftuiController = UIHostingController(
		rootView: ProfileSwiftUIView(
			duration: data().1 ?? 0,
			picker: data().0 ?? Date(),
			doneCompletion: { date, duration in
				self.presenter?.done(date: date, duration: duration)
				
			}, backCompletion: { self.presenter?.back() }
			))
	
	func data() -> (Date?, Double?) {
		let config = Realm.Configuration(schemaVersion: 1)
		
		do {
			let realm = try Realm(configuration: config)
			let result = realm.objects(ProfileModel.self)
			print(result)
			return (result.last?.timeAwake, result.last?.duration)
		} catch {
			print(error.localizedDescription)
		}
		return (Date(), 0)
	}
	
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
	@State var duration = 0.0
	@State var picker = Date()
	let doneCompletion: (Date, Double)->Void
	let backCompletion: ()->Void
//	init(doneCompletion: @escaping ()->(),
//			 backCompletion: @escaping ()->()) {
//		self.doneCompletion = doneCompletion
//		self.backCompletion = backCompletion
//	}
	
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
			
			HStack{
				Image(systemName: "arrow.left")
					.padding(.trailing, 27)
					.onTapGesture{
						backCompletion()
					}
				Text("Profile")
					.font(.system(size: 36))
					.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
				Spacer()
				Text("Done")
					.font(.system(size: 17))
					.onTapGesture{
						doneCompletion(picker, duration)
					}
			}
			.foregroundColor(.textColor)
			.padding(.top)
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
				.padding(.top)
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
		.edgesIgnoringSafeArea(.top)
	}
}

//struct ProfilePreview: PreviewProvider {
//	static var previews: some View {
//		ProfileSwiftUIView()
//	}
//}
