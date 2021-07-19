//
//  MovieNetworkingServiceAdapter.swift
//  App
//
//  Created by Luis Chavez pozo on 28/06/21.
//

import Foundation
import NetworkingService
import Movie

class TheMovieToMovieNetworkingServiceAdapter: MovieNetworkingService {

    private var adaptee: TheMovieNetworkingService

    init(_ adaptee: TheMovieNetworkingService) {
        self.adaptee = adaptee
    }

    func request<Model>(endPoint: Endpoint, completion: @escaping ((Result<Model, Error>) -> Void)) where Model : Decodable {
        adaptee.request(target: endPoint.makeToTarget(), completion: completion)
    }
}

extension Endpoint {

    func makeToTarget()-> TheMovieAPI {
        switch self {
        case .popular(let parameters): return .movie(.popular(parameters: parameters))
        case .rated(let parameters): return .movie(.rated(parameters: parameters))
        case .trailers(let parameters): return .movie(.trailers(parameters: parameters))
        case .upcomming(let parameters): return .movie(.upcomming(parameters: parameters))
        }
    }
}
