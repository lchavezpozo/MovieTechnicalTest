//
//  MovieViewModel.swift
//  Movie
//
//  Created by Luis Chavez pozo on 27/06/21.
//

import Foundation

struct MovieViewModel {

    var id: Int
    var title: String
    var sumary: String
    var voteAverage: Double
    var posterURL: URL
    
    static func make(with entity: MovieEntity)-> MovieViewModel {
        return MovieViewModel(id: entity.id, title: entity.title, sumary: entity.sumary,
                              voteAverage: entity.voteAverage, posterURL: entity.posterURL)
    }
}
