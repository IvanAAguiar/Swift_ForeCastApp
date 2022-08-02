//
//  CityListWeatherViewModel.swift
//  ForeCast
//
//  Created by user225360 on 7/31/22.
//

import CoreLocation
import Foundation
import SwiftUI

class CityListWeatherViewModel: ObservableObject {
    
    @State private var cityList: CitiesViewModel = CitiesViewModel()
    @Published var forecasts:[[CityWeatherViewModel]] = []
    var days:[CityWeatherViewModel] = []
    var location: String = ""
    
    func getCityWeatherForecast () {
        let service = ForecastDataService.shared
        
        //Responsable for define the coordinates
        CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
            //It catchs errors at CLGeocoder
            if let error = error {
                print(error.localizedDescription)
            }
            if let lat = placemarks?.first?.location?.coordinate.latitude,
               let lon = placemarks?.first?.location?.coordinate.longitude {
                // It calls the data service and pass the coordinates to build the URL
                service.getData(url: "http://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=ab4fd70a66986dafa0c943e8a13ad08f&units=metric") {
                    (result: Result<Welcome, ForecastDataService.APIError>)
                    in
                    //It gets the result and shows in each case
                    switch result {
                    case .success(let success):
                        self.days = success.list.map {CityWeatherViewModel(id: $0.id, forecast: $0)}
                        self.filterDay()
                        self.cityList.addCity(text: self.location)
                        print(success)
                    case .failure(let apiError):
                        switch apiError {
                        case .error(let errorString):
                            return print (errorString)
                        }
                    }
                }
            }
        }
    }
}

//TODO: It must be a extension to formart the data
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
