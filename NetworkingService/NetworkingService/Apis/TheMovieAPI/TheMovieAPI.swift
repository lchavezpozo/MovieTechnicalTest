//
//  TheMovieEndPoint.swift
//  Movie
//
//  Created by Luis Chavez pozo on 27/06/21.
//

import Foundation

public enum TheMovieAPI: API {

    case movie(MovieResource)

    public var baseURL: URL {
        return URL(string: "https://api.themoviedb.org")!
    }

    var version: String {
        return "3"
    }

    public var path: String {
        switch self {
        case .movie(let resource): return "/\(version)/\(resource.path)"
        }
    }

    public var headers: [String : String]? {
        return [:]
    }
}
