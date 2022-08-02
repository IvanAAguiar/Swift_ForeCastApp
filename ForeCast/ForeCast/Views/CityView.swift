//
//  TableView.swift
//  ForeCast
//
//  Created by Ivan Aguiar on 8/1/22.
//

import SwiftUI

struct CityView: View {
    
    @StateObject private var listVM: CityListWeatherViewModel = CityListWeatherViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                HStack (alignment: .center) {
                    TextField("Enter city here...", text: $listVM.location)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button  {
                        listVM.getCityWeatherForecast()
                    } label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.title3)
                    }
                }
                .frame(width: 365, alignment: .center)
                //Between the TextField and the List is sopposed to have a view of the current weather forecast.
                Spacer()
                VStack (alignment: .leading) {
                    SwiftUI.Group {
                        //TODO: Sometimes the list load over the old list
                        // The list must be clean always when is done a search
                        ForEach(listVM.forecasts, id: \.debugDescription) { index in
                            SectionView(days: index)
                        }
                    }
                }
                .padding(.horizontal)
                .alert(item: $listVM.appError) { alert in
                    Alert(title: Text("Error"), message: Text("\(alert.errorString)"))
                }
            }
            .frame(width: 300, alignment: .center)
            .padding()
        }
        // It shows when the process to access data is running
        if listVM.isLoading  {
            Color(.white)
                .opacity(0.3)
                .ignoresSafeArea()
            ProgressView("Fetching Weather")
                .frame(width: 100, height: 50, alignment: .topTrailing)
                .padding()
                .background(
                RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)))
                .shadow(radius: 10)
        }
    }
}

    
struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        CityView()
    }
}

