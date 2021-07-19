//
//  CategoryEntity.swift
//  Movie
//
//  Created by Luis Chavez pozo on 4/07/21.
//

import Foundation

struct MovieCategoryEntity {

    enum Category {

        case popular
        case rated
        case upcomming

        func makeToModel()-> MovieCategory {
            switch self {
            case .popular: return .popular
            case .rated: return .rated
            case .upcomming: return .upcomming
            }
        }
    }

    var category: Category
    var movies: PaginationResultEntity<MovieEntity>

}
