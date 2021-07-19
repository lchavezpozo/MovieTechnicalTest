//
//  MovieResource.swift
//  Movie
//
//  Created by Luis Chavez pozo on 27/06/21.
//

import Foundation

public enum MovieResource: Resource {

    case popular(parameters: [String: Any])
    case rated(parameters: [String: Any])
    case upcomming(parameters: [String: Any])
    case trailers(parameters: [String: Any])

    var resource: String {
        return "movie"
    }

    var path: String {
        switch self {
        case .popular: return "\(resource)/popular"
        case .rated: return "\(resource)/top_rated"
        case .upcomming: return "\(resource)/upcoming"
        case .trailers: return "\(resource)/popular"
        }
    }

    var method: Method {
        switch self {
        case .popular,
             .rated ,
             .upcomming,
             .trailers:
            return .get
        }
    }
}
