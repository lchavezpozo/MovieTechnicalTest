//
//  MovieCategoryViewModel.swift
//  Movie
//
//  Created by Luis Chavez pozo on 27/06/21.
//

import Foundation

struct MovieCategoryViewModel {

    enum MovieCategory: String {
        case popular = "Popular"
        case topRated = "Top Rated"
        case upomming = "Upomming"
        
        static func make(with entity: MovieCategoryEntity.Category)-> MovieCategory {
            switch entity {
            case .popular: return .popular
            case .rated: return .topRated
            case .upcomming: return .upomming
            }
        }
    }

    private(set) var category: MovieCategory
    var movies: PaginationViewModel<MovieViewModel>
    
    static func make(with entity: MovieCategoryEntity)-> MovieCategoryViewModel {
        let category = MovieCategory.make(with: entity.category)
        let movies = entity.movies.results.map { MovieViewModel.make(with: $0) }
        let moviePagination = PaginationViewModel(page: entity.movies.page, totalPage: entity.movies.totalPages,
                                                  totalResult: entity.movies.totalResult, result: movies)
        return MovieCategoryViewModel(category: category, movies: moviePagination)
    }
}
