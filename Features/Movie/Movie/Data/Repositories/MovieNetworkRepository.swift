//
//  MovieNetworkRepository.swift
//  Movie
//
//  Created by Luis Chavez pozo on 28/06/21.
//

import Foundation

class MovieNetworkRepository:  MovieRepository {

    private var networkingService: MovieNetworkingService

    init(networkingService: MovieNetworkingService) {
        self.networkingService = networkingService
    }
    
    func getMovies(with category: MovieCategory, and page: Int, completion: @escaping MovieListResult) {
        let parameters: [String: Any] = ["page": page]
        switch category {
        case .popular: networkingService.request(endPoint: .popular(parameters: parameters), completion: completion)
        case .rated: networkingService.request(endPoint: .rated(parameters: parameters), completion: completion)
        case .upcomming: networkingService.request(endPoint: .upcomming(parameters: parameters), completion: completion)
        }
    }
}
