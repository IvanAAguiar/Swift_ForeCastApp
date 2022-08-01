////
////  HomeView.swift
////  ForeCast
////
////  Created by user225360 on 7/29/22.
////
//
//import SwiftUI
//
//struct HomeView: View {
//    
//    @StateObject private var listVM: CityListWeatherViewModel = CityListWeatherViewModel()
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                HStack {
//                    TextField("Enter city here...", text: $listVM.location)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                    Button {
//                        listVM.getCityWeatherForecast()
//                    } label: {
//                        Image(systemName: "magnifyingglass.circle.fill")
//                            .font(.title3)
//                    }
//                }
//                
//                SwiftUI.Group {
//                    List (listVM.forecasts, id:\.forecast.id) { day in
//                        VStack(alignment: .leading) {
//                            Text(day.dtTxt[0])
//                                .fontWeight(.bold)
//                            HStack(alignment: .top) {
//                                    HStack {
//                                        CellView(tempMax: day.max, tempMin: day.min, hour: day.hour)
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//            .padding(.horizontal)
//        }
//    }
//}
//    
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
