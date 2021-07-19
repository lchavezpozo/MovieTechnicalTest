//
//  MovieCategoryListViewPresenter.swift
//  Movie
//
//  Created by Luis Chavez pozo on 26/06/21.
//

import Foundation

protocol MovieCategoryListPresenter {
    var view: MovieCategoryListView? { get }
    var router: MovieCategoryListRouter? { get }
    var interactor: MovieInteractor? { get }
    var numberOfCategories: Int { get }
    var numberOfSections: Int { get }
    func loadView()
    func getCategoryNameFor(_ index: Int)-> String
    func getMoviesInSectionFor(_ section: Int) -> [URL]
    func handleDidTapMovie(categoryIndex category: Int, movieIndex movie: Int)
}
