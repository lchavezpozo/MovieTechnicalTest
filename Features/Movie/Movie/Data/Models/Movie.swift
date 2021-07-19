//
//  Movie.swift
//  Movie
//
//  Created by Luis Chavez pozo on 28/06/21.
//

import Foundation

struct Movie: Decodable {

    let id: Int
    let title: String
    let sumary: String
    let voteAverage: Double
    let posterURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case sumary = "overview"
        case voteAverage = "vote_average"
        case posterURL = "poster_path"
    }
}
