//
//  TableView.swift
//  ForeCast
//
//  Created by user225360 on 8/1/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var listVM: CityListWeatherViewModel = CityListWeatherViewModel()
    
    var body: some View {
        ScrollView {
            HStack (alignment: .center) {
                TextField("Enter city here...", text: $listVM.location)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button {
                    listVM.getCityWeatherForecast()
                } label: {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .font(.title3)
                }
            }
            .frame(width: 365, alignment: .center)
            Spacer()
            VStack (alignment: .leading) {
                SwiftUI.Group {
                    ForEach(listVM.forecasts, id: \.debugDescription) { index in
                        SectionView(days: index)
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(width: 300, alignment: .center)
        .padding()
    }
}

    
struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

