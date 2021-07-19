//
//  PaginationResultEntity.swift
//  Movie
//
//  Created by Luis Chavez pozo on 3/07/21.
//

import Foundation

struct PaginationResultEntity<Entity> {

    let page: Int
    let totalPages: Int
    let totalResult: Int
    let results: [Entity]
}
