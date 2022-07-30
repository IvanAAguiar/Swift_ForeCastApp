//
//  HomeModelView.swift
//  ForeCast
//
//  Created by user225360 on 7/29/22.
//

//import Foundation
//
//class HomeViewModel: ObservableObject {
//    
//    init() {
//        printData()
//    }
//    
//    func printData() {
//        let apiService = ForecastDataService.shared
//        
//        apiService.getData(url: "http://api.openweathermap.org/data/2.5/forecast?q=Porto&appid=ab4fd70a66986dafa0c943e8a13ad08f&units=metric") {
//            (result: Result<Welcome, ForecastDataService.APIError>)
//            in
//            switch result {
//            case .success(let forecast):
//                for data in forecast.list {
//                    print(data.dt)
//                }
//                
//            case .failure(let apiError):
//                switch apiError {
//                case .error(let errorString):
//                    print (errorString)
//                }
//            }
//        }
//    }
//}
