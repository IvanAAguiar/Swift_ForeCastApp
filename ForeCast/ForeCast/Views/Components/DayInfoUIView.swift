//
//  DayInfoUIView.swift
//  ForeCast
//
//  Created by user225360 on 8/2/22.
//

import SwiftUI

//TODO: It must be implemented in the home view to shows the current forecast
struct DayInfoUIView: View {
    
    let info: [CityWeatherViewModel]
    let city: String
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack (alignment: .center) {
                VStack{
                    Text(city)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Spacer()
                Text(info[0].max)
                        .font(.title)
                Text(info[0].max)
                        .font(.title)
                }
                .padding()
                Spacer()
                VStack {
                    Text(info[0].dtTxt[0])
                        .font(.title2)
                    Spacer()
                    //TODO: It must call the image of the icon in whether model object
                    Image(systemName: "cloud.sum.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 100, alignment: .center)
                }
                .padding()
            }
        }
        .frame(width: .infinity, height: 200, alignment: .leading)
        .previewLayout(.sizeThatFits)
    }
}

struct DayInfoUIView_Previews: PreviewProvider {
    static var previews: some View {
        DayInfoUIView(info: [CityWeatherViewModel.init(id: 10, forecast: .init(id: 12, main: .init(temp: 1.1, feelsLike: 1.1, tempMin: 1.1, tempMax: 1.1, pressure: 1, seaLevel: 1, grndLevel: 1, humidity: 1, tempKf: 1.1), weather: .init(arrayLiteral: .init(id: 1, main: "1", weatherDescription: "1", icon: "1")), clouds: .init(all: 1), wind: .init(speed: 1.1, deg: 1, gust: 1.1), visibility: 12, pop: 12, sys: .init(pod: "2"), dtTxt: "asd"))], city: "Berlin")
    }
}
