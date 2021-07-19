//
//  NetworkingService.swift
//  Movie
//
//  Created by Luis Chavez pozo on 27/06/21.
//

import Foundation

public class NetworkingService {

    public static func theMovieAPI() -> TheMovieNetworkingService {
        let networkingService = TheMovieNetworkingServiceMoya()
        return networkingService
    }
}


