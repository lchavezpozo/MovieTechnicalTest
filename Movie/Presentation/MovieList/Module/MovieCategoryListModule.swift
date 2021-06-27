//
//  MovieCategoryListModule.swift
//  Movie
//
//  Created by Luis Chavez pozo on 26/06/21.
//

import UIKit

struct MovieCategoryListModule {

    static func build()-> UIViewController {
        let presenter = DefaultMovieCategoryListPresenter()
        let view = MovieCategoryListViewController()
        let router = DefaultMovieCategoryListRouter()
        view.presenter = presenter
        presenter.set(view: view, and: router)
        return view
    }
}
