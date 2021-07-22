//
//  DefaultMovieDetailPresenter.swift
//  Movie
//
//  Created by Luis Chavez pozo on 22/07/21.
//

import Foundation

class DefaultMovieDetailPresenter {

    // MARK:- Properties
    private(set) weak var view: MovieDetailView?
    private(set) var router: MovieDetailRouter?
    private(set) var interactor: MovieInteractor?

    private(set) var viewModel: MovieViewModel

    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
    }

    // MARK:- Methods
    func set(view: MovieDetailView, router: MovieDetailRouter, interactor: MovieInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    
}

extension DefaultMovieDetailPresenter: MovieDetailPresenter {

    func loadView() {
        
    }
    
    func didTapDismiss() {
        router?.dismiss()
    }
}
