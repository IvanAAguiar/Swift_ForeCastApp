//
//  HomeModelView.swift
//  ForeCast
//
//  Created by Ivan Aguiar on 7/29/22.
//

import Foundation
import SwiftUI

public struct CityWeatherViewModel {
    let id: Int
    let forecast: Day

    private static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MM, d"
        return dateFormatter
    }
    
    private static var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter
    }
    
    var max: String {
        return "Max: \(Self.numberFormatter.string(for: forecast.main.tempMax) ?? "0")°C"
    }
    
    var min: String {
        return "Min: \(Self.numberFormatter.string(for: forecast.main.tempMin) ?? "0")°C"
    }
    
    var dtTxt: [String] {
        let arr = forecast.dtTxt
        return arr.description.components(separatedBy: " ")
    }
    
    var hour: String {
        let hour = dtTxt[1].components(separatedBy: ":")
        return String("\(hour[0]):\(hour[1])")
    }
}
