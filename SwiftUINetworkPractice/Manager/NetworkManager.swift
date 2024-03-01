//
//  NetworkManager.swift
//  SwiftUINetworkPractice
//
//  Created by Varun Adit on 1/19/24.
//

import Foundation
import Combine

protocol NetworkProtocol {
    func fetchData<T:Codable>(type: T.Type, urlStr: String) ->  AnyPublisher<T?, Error>
    
}

class NetworkManager: NetworkProtocol {
    
    func fetchData<T: Codable>(type: T.Type, urlStr: String) ->  AnyPublisher<T?, Error> {
        guard let url = URL(string: urlStr) else {
            return Fail(error: NetworkError.invalidURL)
                .eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        let headers = [
            "X-RapidAPI-Key" : "e9a13e3120msh3d12339056f538fp17c6b7jsnb5bd6a898cb4",
            "X-RapidAPI-Host" : "bitcoinaverage-global-ethereum-index-v1.p.rapidapi.com"
        ]
        
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data: Data, response: URLResponse) in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse
                }
                debugPrint(httpResponse.statusCode)
                return data
            }
            .decode(type: T?.self, decoder: JSONDecoder())
            .mapError { error in
                switch error {
                case is DecodingError:
                    return NetworkError.decodingError
                default:
                    return error
                }
            }
            .eraseToAnyPublisher()
    }
    
}

enum NetworkError: Error {
    
    case invalidURL
    case invalidResponse
    case decodingError
}
