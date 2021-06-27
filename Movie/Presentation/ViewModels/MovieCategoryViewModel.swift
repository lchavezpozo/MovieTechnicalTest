//
//  MovieCategoryViewModel.swift
//  Movie
//
//  Created by Luis Chavez pozo on 27/06/21.
//

import Foundation

class MovieCategoryViewModel {

    enum MovieCategory: String {
        case popular = "Popular"
        case topRated = "Top Rated"
        case upomming = "Upomming"
    }

    private(set) var category: MovieCategory
    var movies: [MovieViewModel]

    init(category: MovieCategory, movies: [MovieViewModel]) {
        self.category = category
        self.movies = movies
    }
}
