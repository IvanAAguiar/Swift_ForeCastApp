//
//  TableView.swift
//  ForeCast
//
//  Created by user225360 on 8/1/22.
//

import SwiftUI

struct TableView: View {
    
    @StateObject private var listVM: CityListWeatherViewModel = CityListWeatherViewModel()
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
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
                ScrollView {
                    SwiftUI.Group {
                        ForEach(listVM.forecasts, id: \.indices) { index in
                            SectionView(days: index)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
    
struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}

