//
//  MovieInteractor.swift
//  Movie
//
//  Created by Luis Chavez pozo on 27/06/21.
//

import Foundation

protocol MovieInteractor {

    typealias MovieWithPagination = PaginationResultEntity<MovieEntity>

    func fetchAllCategoryMovies(page: Int, completion: @escaping ((Result<[MovieCategoryEntity], Error>)->Void))
    func fetchMovies(for category: MovieCategoryEntity.Category, and page: Int, completion: @escaping ((Result<MovieWithPagination, Error>)->Void))
}
