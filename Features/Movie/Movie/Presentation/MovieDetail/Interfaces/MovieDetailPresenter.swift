//
//  MovieDetailPresenter.swift
//  Movie
//
//  Created by Luis Chavez pozo on 19/07/21.
//

import Foundation

protocol MovieDetailPresenter {

    var view: MovieDetailView? { get }
    var router: MovieDetailRouter? { get }
    var interactor: MovieInteractor? { get }
    var viewModel: MovieViewModel { get }

    func loadView()
    func didTapDismiss()
}
