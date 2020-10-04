//
//  RecommendationsViewController.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 03.10.2020.
//

import UIKit
import SwiftUI

protocol RecommendationsViewProtocol: class {

}

final class RecommendationsViewController: UIViewController, RecommendationsViewProtocol{
	
	var presenter: RecommendationsPresenterProtocol?
	let swiftuiController = UIHostingController(rootView: RecomendationsView())

	
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

struct RecomendationsView: View {

	var body: some View {
		VStack(alignment: .leading) {
			RecomendationView(title: "Don’t Forget to Take Your Pills", text: "Melatonin is a hormone that regulates your circadian cycle of sleep and wakefulness. Levels of melatonin naturally rise at night, making you feel sleepier.")
			RecomendationView(title: "The Blue Light Effect", text: "Electronic devices emit an artificial blue light that can suppress the release of the body’s sleep-inducing hormone, melatonin.")
			RecomendationView(title: "The Right Amount of Sleep", text: "Although too little sleep has been linked to weight gain, too much sleep can have a similar effect, as you are expending less energy overall during the course of the day.")
			Spacer()
		}
		.padding(24)
	}
}

struct RecomendationsPreview: PreviewProvider {
	static var previews: some View {
		RecomendationsView()
	}
}

