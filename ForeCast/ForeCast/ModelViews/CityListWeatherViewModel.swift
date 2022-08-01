//
//  CityListWeatherViewModel.swift
//  ForeCast
//
//  Created by user225360 on 7/31/22.
//

import CoreLocation
import Foundation

class CityListWeatherViewModel: ObservableObject {
    
    @Published var forecasts:[CityWeatherViewModel] = []
    var location: String = ""
    
    func getCityWeatherForecast () {
        let service = ForecastDataService.shared
        
        //Responsable for define the coordinates
        CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let lat = placemarks?.first?.location?.coordinate.latitude,
               let lon = placemarks?.first?.location?.coordinate.longitude {
                // It calls the data service and pass the coordinates to build the URL
                service.getData(url: "http://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=ab4fd70a66986dafa0c943e8a13ad08f&units=metric") {
                    (result: Result<Welcome, ForecastDataService.APIError>)
                    in
                    switch result {
                    case .success(let success):
                        DispatchQueue.main.async {
                            self.forecasts = success.list.map {CityWeatherViewModel(forecast: $0)}
                            print(success)
                        }
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
