//
//  ForecastDataService.swift
//  ForeCast
//
//  Created by user225360 on 7/29/22.
//

import Foundation

public class ForecastDataService {
    
    public static let shared = ForecastDataService()
    
    //Will associate the error protocol
    public enum APIError: Error {
        case error(_ errorString: String)
    }
    
   public func getData<T: Decodable>(url: String,
                               completion: @escaping (Result<T, APIError>) -> Void) {
        
        guard let url = URL(string: url.setURL()) else {
            //It shows if had error with the process to build the URL
            completion(.failure(.error(NSLocalizedString("Error: Invalid City", comment: ""))))
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            //It shows if had error with the process to request the JSON object
            if let error = error {
                completion(.failure(.error("Error: \(error.localizedDescription)")))
                return
            }
        
            guard let data = data else {
                //It shows if had error with the data
                completion(.failure(.error(NSLocalizedString("Error: Data is corrupt.", comment: ""))))
                return
            }

            let decoder = JSONDecoder()
//            decoder.dateDecodingStrategy = .deferredToDate
//            decoder.keyDecodingStrategy = .useDefaultKeys
            
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
                return
            } catch let error {
                //It shows if had error if the decoded data
                completion(.failure(APIError.error("Error: \(error.localizedDescription)")))
                return
            }
        }.resume()
    }
}


    


