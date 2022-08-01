//
//  HomeModelView.swift
//  ForeCast
//
//  Created by user225360 on 7/29/22.
//

import Foundation
import SwiftUI

public struct CityWeatherViewModel {
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
    
}
