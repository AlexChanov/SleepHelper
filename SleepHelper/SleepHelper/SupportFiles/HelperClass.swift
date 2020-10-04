//
//  HelperClass.swift
//  SleepHelper
//
//  Created by Дмитрий И. on 04.10.2020.
//

final class Helper {
	static func durationString(duration: Double) -> String {
		var a = ""
		a = "\(Int(duration))"
		let b = Int(abs((duration-Double(Int(duration)))*60))
		if b != 0 {
			a += ":\(b)"
		}
		a += " hr"
		return a
	}
}
