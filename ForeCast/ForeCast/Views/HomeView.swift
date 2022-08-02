//
//  HomeView.swift
//  ForeCast
//
//  Created by Ivan Aguiar on 7/28/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showCities: Bool = false
    
    var body: some View {
        homeHeader
        if showCities == true {
            CitiesView()
        }
        else {
            CityView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            Text(showCities ? "Cities" : "Weather Forecast")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .animation(.none)
            Spacer()
            AddButtonView(iconName: showCities ? "chevron.left" : "chevron.right")
                .onTapGesture {
                    showCities.toggle()
                }
        }
        .padding(.horizontal)
    }
}
