//
//  MovieEntity.swift
//  Movie
//
//  Created by Luis Chavez pozo on 27/06/21.
//

import Foundation

class MovieEntity {

    var id: Int
    var title: String
    var sumary: String
    var voteAverage: Double
    var posterURL: URL

    init(id: Int, title: String, sumary: String, voteAverage: Double, posterURL: URL) {
        self.id = id
        self.title = title
        self.sumary = sumary
        self.voteAverage = voteAverage
        self.posterURL = posterURL
    }
    
    static func make(with model: Movie)-> MovieEntity {
        return MovieEntity(id: model.id, title: model.title, sumary: model.sumary,
                           voteAverage: model.voteAverage, posterURL: URL(string: "https://image.tmdb.org/t/p/w200\(model.posterURL)")!)
    }
}
