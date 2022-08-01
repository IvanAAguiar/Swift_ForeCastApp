//
//  HomeView.swift
//  ForeCast
//
//  Created by user225360 on 7/29/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var listVM: CityListWeatherViewModel = CityListWeatherViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter city here...", text: $listVM.location)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button {
                        listVM.getCityWeatherForecast()
                    } label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.title3)
                    }
                }
                
                SwiftUI.Group {
                    List (listVM.forecasts, id:\.forecast.id) { day in
                        VStack(alignment: .leading) {
                            Text(day.forecast.dtTxt)
                                .fontWeight(.bold)
                            HStack(alignment: .top) {
                                Image(systemName: "hourglass")
                                    .font(.title)
                                    .frame(width: 50, height: 50)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                                    HStack {
                                        Text(day.max)
                                        Text(day.min)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
    
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
