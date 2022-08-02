//
//  ForecastDataService.swift
//  ForeCast
//
//  Created by Ivan Aguiar on 7/29/22.
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
    }
}




    


