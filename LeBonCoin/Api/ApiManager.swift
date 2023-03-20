//
//  ApiManager.swift
//  LeBonCoin
//
//  Created by Younup on 20/03/2023.
//

import Foundation

enum ApiError: Error {
    case badUrl
    case invalidStatusCode
    case invalidResponse
    case noData
    case serialization
}

class ApiManager {
    
    var sessionConfiguration: URLSessionConfiguration
    var session: URLSession
    var getTask: URLSessionDataTask?

    init() {
        sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = 20.0
        session = URLSession(configuration: sessionConfiguration)
    }
    
    func get<T>(_ type: T.Type, route: String, callback: ((Result<T, Error>) -> Void)?) where T: Decodable {
        if let task = getTask { task.cancel() }
        if let url = URL(string: route) {
            
            getTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
                if let e = error {
                    callback?(Result.failure(e))
                }else {
                    if let r = response as? HTTPURLResponse {
                        if  r.statusCode == 200{
                            if let data = data {
                                do {
                                    let decoder = JSONDecoder()
//                                    decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                                    let model = try decoder.decode(type, from: data)
                                    callback?(Result.success(model))
                                } catch {
                                    print(error)
                                    callback?(Result.failure(ApiError.serialization))
                                }
                            } else {
                                callback?(Result.failure(ApiError.noData))
                            }
                        }else {
                            callback?(Result.failure(ApiError.invalidStatusCode))
                        }
                    }else {
                        callback?(Result.failure(ApiError.invalidResponse))
                    }
                }
            })

            getTask?.resume()

        }else {
            callback?(Result.failure(ApiError.badUrl))
        }
    }
}
