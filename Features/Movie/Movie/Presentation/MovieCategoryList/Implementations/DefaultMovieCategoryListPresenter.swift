//
//  DefaultMovieCategoryListViewPresenter.swift
//  Movie
//
//  Created by Luis Chavez pozo on 26/06/21.
//

import Foundation

class DefaultMovieCategoryListPresenter {

    // MARK:- Properties
    private(set) weak var view: MovieCategoryListView?
    private(set) var router: MovieCategoryListRouter?
    private(set) var interactor: MovieInteractor?

    private var movieCategories: [MovieCategoryViewModel] = []

    // MARK:- Methods
    func set(view: MovieCategoryListView, router: MovieCategoryListRouter, interactor: MovieInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}


extension DefaultMovieCategoryListPresenter: MovieCategoryListPresenter {

    // MARK:- Properties for the View
    var numberOfCategories: Int {
        return movieCategories.count
    }

    var numberOfSections: Int {
        return 1
    }

    // MARK:- Events of the View
    func loadView() {
        interactor?.fetchAllCategoryMovies(page: 1, completion: { [weak self] result in
            switch result {
            case .success(let movieCategoriesEntity):
                self?.movieCategories = movieCategoriesEntity.map { MovieCategoryViewModel.make(with: $0) }
                self?.view?.reloadView()
            case .failure(let error):
                self?.view?.showError(with: error.localizedDescription)
            }
        })
    }

    func getCategoryNameFor(_ section: Int)-> String {
        return movieCategories[section].category.rawValue
    }

    func getMoviesInSectionFor(_ section: Int) -> [URL] {
        return movieCategories[section].movies.result.map { $0.posterURL }
    }

    func handleDidTapMovie(categoryIndex category: Int, movieIndex movie: Int) {
        let viewModel = movieCategories[category].movies.result[movie]
        router?.showDetailMovie(with: viewModel)
    }
}
