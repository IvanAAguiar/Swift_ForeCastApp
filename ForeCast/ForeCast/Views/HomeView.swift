//
//  HomeView.swift
//  ForeCast
//
//  Created by user225360 on 7/29/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var location: String = ""
    @State var forecast: Forecast? = nil
    
    let dateFormatter = DateFormatter()
    init () {
        dateFormatter.dateFormat = "E, MM, d"
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter city here...", text: $location)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button {
                        getCityWeatherForecast(for: location)
                    } label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.title3)
                    }
                }
                
                if forecast != nil {
                    SwiftUI.Group {
                        List (forecast!.list, id: \.dt) { day in
                            VStack(alignment: .leading) {
                                Text(dateFormatter.string(from: day.dt))
                                    .fontWeight(.bold)
                                HStack(alignment: .top) {
                                    Image(systemName: "hourglass")
                                        .font(.title)
                                        .frame(width: 50, height: 50)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                                    VStack(alignment: .leading) {
                                        Text(day.weather[0].weatherDescription)
                                        Text("Max: \(day.main.tempMax)")
                                        Text("Min: \(day.main.tempMin)")
                                        Text("Clouds: \(day.clouds.all)")
                                        Text("Wind: \(day.wind.speed)")
                                        Text("Humidity: \(day.main.humidity)")
                                    }
                                }
                            }
                        }
                    }
                } else {
                    Spacer()
                }
            }
            .padding(.horizontal)
            .navigationTitle("ForeCastAPP")
        }
    }
    
    func getCityWeatherForecast (for location: String) {
        let apiService = ForecastDataService.shared
        //
        apiService.getData(url: "http://api.openweathermap.org/data/2.5/forecast?q=\(location)&appid=ab4fd70a66986dafa0c943e8a13ad08f&units=metric") {
            (result: Result<Forecast, ForecastDataService.APIError>)
            in
            switch result {
            case .success(var forecast):
                self.forecast = forecast
            case .failure(let apiError):
                switch apiError {
                case .error(let errorString):
                    return
                    print (errorString)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
