//
//  RecomendationView.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 04.10.2020.
//

import SwiftUI

struct RecomendationView: View {
	var title: String
	var text: String
	var body: some View {
		HStack(alignment: .top) {
			Image("RecomendationAvatar")
				.resizable()
				.scaledToFit()
				.frame(width: 48, height: 48)
				.cornerRadius(20)
				.overlay(
					RoundedRectangle(cornerRadius: 20)
						.stroke(lineWidth: 2)
				)
			VStack(alignment: .leading) {
				Text("Annie Lynch")
					.foregroundColor(.textSecondColor)
					.font(.system(size: 11))
				Text(title)
					.foregroundColor(.textColor)
					.fontWeight(.semibold)
					.padding(.vertical, 2)
					.font(.system(size: 14))
				Text(text)
					.foregroundColor(.textSecondColor)
					.font(.system(size: 13))
			}
		}
		.padding(.vertical, 16)
	}
}
