//
//  DefaultMovieDetailRouter.swift
//  Movie
//
//  Created by Luis Chavez pozo on 22/07/21.
//

import UIKit

class DefaultMovieDetailRouter {
    
    private var currentViewController: UIViewController
    
    init(currentViewController: UIViewController) {
        self.currentViewController =  currentViewController
    }
}

extension DefaultMovieDetailRouter: MovieDetailRouter {

    func dismiss() {
        currentViewController.dismiss(animated: true)
    }
}
