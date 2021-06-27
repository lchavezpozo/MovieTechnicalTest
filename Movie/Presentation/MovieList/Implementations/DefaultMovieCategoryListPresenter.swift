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

    private var movieCategories: [MovieCategoryViewModel] = [
        .init(category: .popular, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .topRated, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        .init(category: .upomming, movies: Array(repeating: .init(id: 1, title: "title1", sumary: "test", voteAverage: 13.1, posterURL: URL(string: "https://image.tmdb.org/t/p/w200/b1bTpxh0lRfw7kwRrWPeMOo7jbY.jpg")!), count: 10)),
        
    ]

    // MARK:- Methods
    func set(view: MovieCategoryListView, and router: MovieCategoryListRouter) {
        self.view = view
        self.router = router
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
        view?.movieCategorySuccess()
    }

    func getCategoryNameFor(_ section: Int)-> String {
        return movieCategories[section].category.rawValue
    }

    func getMoviesInSectionFor(_ section: Int) -> [URL] {
        return movieCategories[section].movies.map { $0.posterURL }
    }

    func handleDidTapMovie(categoryIndex category: Int, movieIndex movie: Int) {
        let viewModel = movieCategories[category].movies[movie]
        router?.showDetailMovie(with: viewModel)
    }
}
