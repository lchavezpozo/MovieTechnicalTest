//
//  MovieListView.swift
//  Movie
//
//  Created by Luis Chavez pozo on 26/06/21.
//

import Foundation

protocol MovieCategoryListView: AnyObject {
    var presenter: MovieCategoryListPresenter? { get set }
    func reloadView()
    func showEmptyView()
    func showError(with message: String)
}
