//
//  PaginationResult.swift
//  Movie
//
//  Created by Luis Chavez pozo on 28/06/21.
//

import Foundation

struct PaginationResult<Model: Decodable>: Decodable {
    
    let page: Int
    let totalPages: Int
    let totalResult: Int
    let results: [Model]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResult = "total_results"
        case results
    }
}
