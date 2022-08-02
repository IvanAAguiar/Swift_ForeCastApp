//
//  DataExtension.swift
//  ForeCast
//
//  Created by Ivan Aguiar on 8/2/22.
//

import Foundation


// It must format the data to facilitate the manipulation in the view
extension CityListWeatherViewModel {
    func filterDay() {
        var filteredDays: [CityWeatherViewModel] = []

        for day in days {
            if filteredDays.isEmpty {
                filteredDays.append(day)
            } else {
                if filteredDays[0].dtTxt[0] == day.dtTxt[0] {
                    filteredDays.append(day)
                } else {
                    forecasts.append(filteredDays)
                    filteredDays.removeAll()
                    filteredDays.append(day)
                }
            }
        }
    }
}
