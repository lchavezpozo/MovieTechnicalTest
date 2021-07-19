//
//  MovieRepository.swift
//  Movie
//
//  Created by Luis Chavez pozo on 28/06/21.
//

import Foundation

enum MovieCategory {
    case popular
    case rated
    case upcomming
}

protocol MovieRepository {

    typealias MovieListResult = ((Result<PaginationResult<Movie>, Error>)->Void)
    
    func getMovies(with category: MovieCategory, and page: Int, completion: @escaping MovieListResult)
}
