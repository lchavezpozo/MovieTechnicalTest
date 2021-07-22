//
//  DefaultMovieCategoryListRouter.swift
//  Movie
//
//  Created by Luis Chavez pozo on 27/06/21.
//

import UIKit

class DefaultMovieCategoryListRouter: MovieCategoryListRouter {

    private var navigationController: UINavigationController
    private var networkingService: MovieNetworkingService

    init(navigationController: UINavigationController, networkingService: MovieNetworkingService) {
        self.navigationController = navigationController
        self.networkingService = networkingService
    }

    func showDetailMovie(with movie: MovieViewModel) {
        let movideDetailModule = MovieDetailModule.build(with: movie, networkingService: networkingService)
        movideDetailModule.modalPresentationStyle = .fullScreen
        navigationController.present(movideDetailModule, animated: true)
    }
}
