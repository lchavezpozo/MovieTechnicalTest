//
//  MovieDetailModule.swift
//  Movie
//
//  Created by Luis Chavez pozo on 22/07/21.
//

import UIKit

struct MovieDetailModule {
    
    static func build(with viewModel: MovieViewModel, networkingService: MovieNetworkingService)-> UIViewController {
        let presenter = DefaultMovieDetailPresenter(viewModel: viewModel)
        let view = MovieDetailViewController()
        view.presenter = presenter
        let router = DefaultMovieDetailRouter(currentViewController: view)
        let repository = MovieNetworkRepository(networkingService: networkingService)
        let interactor = DefaultMovieInteractor(repository: repository)
        presenter.set(view: view, router: router, interactor: interactor)
        return view
    }
}
