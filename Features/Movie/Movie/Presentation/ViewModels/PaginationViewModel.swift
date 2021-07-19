//
//  PaginationViewModel.swift
//  Movie
//
//  Created by Luis Chavez pozo on 4/07/21.
//

import Foundation

struct PaginationViewModel<ViewModel> {

    private let page: Int
    private let totalPage: Int
    private let totalResult: Int
    var result: [ViewModel]

    var hasMorePages: Bool {
        return page < totalPage
    }

    var nextPage: Int {
        return page + 1
    }
}
