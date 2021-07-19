//
//  MovieInteractor.swift
//  Movie
//
//  Created by Luis Chavez pozo on 27/06/21.
//

import Foundation

class DefaultMovieInteractor: MovieInteractor {

    // MARK:- Properties
    private var repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }

    // MARK:- Methods
    func fetchAllCategoryMovies(page: Int, completion: @escaping ((Result<[MovieCategoryEntity], Error>) -> Void)) {
        let group = DispatchGroup()
        var movieCategories: [MovieCategoryEntity] = []
        var error: Error?
        
        group.enter()
        fetchMovies(for: .popular, and: page) { result in
            switch result {
            case .success(let movieWithPagination):
                let pupularMovies = MovieCategoryEntity(category: .popular, movies: movieWithPagination)
                movieCategories.append(pupularMovies)
            case .failure(let movieError):
                error = movieError
            }
            group.leave()
        }
        
        group.enter()
        fetchMovies(for: .rated, and: page) { result in
            switch result {
            case .success(let movieWithPagination):
                let ratedMovies = MovieCategoryEntity(category: .rated, movies: movieWithPagination)
                movieCategories.append(ratedMovies)
            case .failure(let movieError):
                error = movieError
            }
            group.leave()
        }
        
        group.enter()
        fetchMovies(for: .upcomming, and: page) { result in
            switch result {
            case .success(let movieWithPagination):
                let upcomingMovies =  MovieCategoryEntity(category: .rated, movies: movieWithPagination)
                movieCategories.append(upcomingMovies)
            case .failure(let movieError):
                error = movieError
            }
            group.leave()
        }
        
        group.notify(queue: .main) {
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(movieCategories))
            }
        }
    }
    
    func fetchMovies(for category: MovieCategoryEntity.Category, and page: Int, completion: @escaping ((Result<MovieWithPagination, Error>) -> Void)) {
        let categoryModel =  category.makeToModel()
        repository.getMovies(with: categoryModel, and: page) { result in
            switch result {
            case .success(let paginationResult):
                let movies = paginationResult.results.map { MovieEntity.make(with: $0) }
                let paginationResultEntity = PaginationResultEntity(page: paginationResult.page, totalPages: paginationResult.totalPages,
                                                                    totalResult: paginationResult.totalResult, results: movies)
                completion(.success(paginationResultEntity))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
