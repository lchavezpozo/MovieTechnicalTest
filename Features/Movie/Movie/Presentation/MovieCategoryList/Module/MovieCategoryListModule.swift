//
//  MovieCategoryListModule.swift
//  Movie
//
//  Created by Luis Chavez pozo on 26/06/21.
//

import UIKit

struct MovieCategoryListModule {

    static func build(networkingService: MovieNetworkingService)-> UIViewController {
        let presenter = DefaultMovieCategoryListPresenter()
        let view = MovieCategoryListViewController()
        let navigation = UINavigationController(rootViewController: view)
        let router = DefaultMovieCategoryListRouter(navigationController: navigation, networkingService: networkingService)
        let repository = MovieNetworkRepository(networkingService: networkingService)
        let interactor = DefaultMovieInteractor(repository: repository)
        view.presenter = presenter
        presenter.set(view: view, router: router, interactor: interactor)
        return navigation
    }
}
