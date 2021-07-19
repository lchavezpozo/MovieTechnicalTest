//
//  File.swift
//  Movie
//
//  Created by Luis Chavez pozo on 28/06/21.
//

import Foundation

public enum Endpoint {
    case popular(parameters: [String: Any])
    case rated(parameters: [String: Any])
    case upcomming(parameters: [String: Any])
    case trailers(parameters: [String: Any])
}

public protocol MovieNetworkingService {
    func request<Model: Decodable>(endPoint: Endpoint, completion: @escaping ((Result<Model, Error>)->Void))
}
