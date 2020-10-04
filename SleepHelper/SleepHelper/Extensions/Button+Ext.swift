//
//  Button+Ext.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 04.10.2020.
//

import SwiftUI

extension Button {
	func buttonShadow(pressed: Bool, radius: CGFloat = 30) -> some View {
		if pressed {
			return AnyView(
				self
					.overlay(
						RoundedRectangle(cornerRadius: radius)
							.stroke(Color("BackgroundColor"), lineWidth: 4)
							.shadow(color: .shadowColor, radius: 4, x: -2, y: -2)
							.clipShape(Capsule())
							.shadow(color: .shadowColor, radius: 20, x: -6, y: -6)
							.clipShape(Capsule())
					)
			)
		} else {
			return AnyView(self)
		}
	}
	
	func buttonLongShadow() -> some View {
		self
			.overlay(
				RoundedRectangle(cornerRadius: 16)
					.stroke(Color("BackgroundColor"), lineWidth: 4)
					.shadow(color: .shadowColor, radius: 4, x: -2, y: -2)
					.clipShape(Capsule())
					.shadow(color: .shadowColor, radius: 6, x: 2, y: 2)
					.clipShape(Capsule())
			)
	}
}

//extension Text {
//	func text14() -> some View {
//		self
//			.font(.system(size: 17, weight: .medium))
//			.tracking(-0.41)
//	}
//}
