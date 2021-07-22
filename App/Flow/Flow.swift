//
//  Flow.swift
//  App
//
//  Created by Luis Chavez pozo on 28/06/21.
//

import UIKit
import NetworkingService
import Movie

class Flow {
    private(set) var networkingService = NetworkingService.theMovieAPI()
    private var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        let moviewFlow = MovieFlow(networkingService: networkingService)
        let movieCategoryListFeature =  moviewFlow.showMovieCategoryListView()
        window?.rootViewController = movieCategoryListFeature
        window?.makeKeyAndVisible()
    }
}

class MovieFlow {
    
    private var networkingService: TheMovieNetworkingService
    
    init(networkingService: TheMovieNetworkingService) {
        self.networkingService = networkingService
    }
    
    func showMovieCategoryListView() -> UIViewController {
        let movieNetworkingServiceAdapter = TheMovieToMovieNetworkingServiceAdapter(networkingService)
        return MovieModuleFactory.movieCategoryListFeature(networkService: movieNetworkingServiceAdapter)
    }
}
