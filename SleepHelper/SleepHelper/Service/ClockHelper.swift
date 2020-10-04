//
//  ClockHelper.swift
//  SleepHelper
//
//  Created by Чанов Алексей Михайлович on 04.10.2020.
//

import Foundation

struct ClockHelper {

    // MARK: - Properties

    let lowNumber: Float = 255
    let angelValue: Float = 15
    let startNumberAngel = 6

    // MARK: - Functions

    public func getAngelFromHour(_ hour: Float) -> Float {
        var angel: Float = 0
        let hourInt = Int(hour)

        if hourInt < 6 {
            angel = lowNumber
            if hourInt == 0 {
                return angel + angelValue
            }
            for _ in 0...hourInt {
                angel += angelValue
            }
        }

        if hourInt == 6 {
            return angel
        }
        if hourInt > startNumberAngel {
            for _ in 1...hourInt-startNumberAngel {
                angel += angelValue
            }
        }

        return angel
    }
}
