//
//  NetworkBehavior.swift
//  ErrorManagment
//
//  Created by sadegh on 7/24/20.
//  Copyright © 2020 sadegh. All rights reserved.
//

import Foundation


public enum HTTPMethod: String {
    
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public protocol NetworkRequestBehavior {
    func request<T: Decodable>(_ url: URL, dataModel: T.Type, result: ((Result<T, Error>) -> Void)?)
    func request<T: Decodable>(_ url: URL, dataModel: T.Type, body: Data?, result: ((Result<T, Error>) -> Void)?)
    func request<T: Decodable>(_ url: URL, dataModel: T.Type, body: Data?, mode: HTTPMethod ,result: ((Result<T, Error>) -> Void)?)
}

public struct NetworkConfig {
    var header: [String: String] = [:]
}

public class WN: NetworkRequestBehavior {
    
    public var config = NetworkConfig()
    public static let shared = WN()
    
    public func request<T>(_ url: URL, dataModel: T.Type, result: ((Result<T, Error>) -> Void)?) where T : Decodable {
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = config.header
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let data = data {
                guard let decodedJSON = try? JSONDecoder().decode(dataModel.self, from: data) else { return }
                result?(.success(decodedJSON))
            }
            
            if let response = response {
                print(response)
            }
            
            if let error = error {
                result?(.failure(error))
            }
        }.resume()
    }
    
    public func request<T>(_ url: URL, dataModel: T.Type, body: Data?, result: ((Result<T, Error>) -> Void)?) where T : Decodable {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpBody = body
        urlRequest.allHTTPHeaderFields = config.header
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if let data = data {
                guard let decodedJSON = try? JSONDecoder().decode(dataModel.self, from: data) else { return }
                result?(.success(decodedJSON))
            }
            
            if let response = response {
                print(response)
            }
            
            if let error = error {
                result?(.failure(error))
            }
        }.resume()
    }
    
    public func request<T>(_ url: URL, dataModel: T.Type, body: Data?, mode: HTTPMethod, result: ((Result<T, Error>) -> Void)?) where T : Decodable {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpBody = body
        urlRequest.httpMethod = mode.rawValue
        urlRequest.allHTTPHeaderFields = config.header
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if let data = data {
                guard let decodedJSON = try? JSONDecoder().decode(dataModel.self, from: data) else { return }
                result?(.success(decodedJSON))
            }
            
            if let response = response {
                print(response)
            }
            
            if let error = error {
                result?(.failure(error))
            }
        }.resume()
    }
}
