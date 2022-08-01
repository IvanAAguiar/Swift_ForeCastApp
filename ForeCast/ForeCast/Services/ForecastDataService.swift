//
//  ForecastDataService.swift
//  ForeCast
//
//  Created by user225360 on 7/29/22.
//

import Foundation
import Combine

public class ForecastDataService {
    
    public static let shared = ForecastDataService()
    
    var cancellables: Set<AnyCancellable> = []
    
    //Will associate the error protocol
    public enum APIError: Error {
        case error(_ errorString: String)
    }
    
    public func getData<T: Decodable>(url: String,
                                      dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                                      keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
                                      completion: @escaping (Result<T, APIError>) -> Void) {
        
        guard let url = URL(string: url) else {
            //It shows if had error with the process to build the URL
            completion(.failure(.error(NSLocalizedString("Error: Invalid City", comment: ""))))
            return
        }
        
        let request = URLRequest(url: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map {$0.data}
            .decode(type: T.self, decoder: decoder)
            .receive(on: RunLoop.main)
            .sink { taskCompletion in
                switch taskCompletion {
                case .finished:
                    return print(taskCompletion)
                case.failure(let decodingError):
                    completion(.failure((APIError.error("Error: \(decodingError.localizedDescription)"))))
                }
            } receiveValue: { decodedData in
                completion(.success(decodedData))
            }
            .store(in: &cancellables)

            
            
            
            
            
            
            
            
//
//            //It shows if had error with the process to request the JSON object
//            if let error = error {
//                completion(.failure(.error("Error: \(error.localizedDescription)")))
//                return print(error)
//            }
//
//            guard let data = data else {
//                //It shows if had error with the data
//                completion(.failure(.error(NSLocalizedString("Error: Data is corrupt.", comment: ""))))
//                return
//            }
//
//            let decoder = JSONDecoder()
////            decoder.dateDecodingStrategy = .deferredToDate
////            decoder.keyDecodingStrategy = .useDefaultKeys
//
//            do {
//                let decodedData = try decoder.decode(T.self, from: data)
//                completion(.success(decodedData))
//                return print(decodedData)
//            } catch let error {
//                //It shows if had error if the decoded data
//                completion(.failure(APIError.error("Error: \(error.localizedDescription)")))
//                return
//            }
//        }.resume()
    }
}



    


