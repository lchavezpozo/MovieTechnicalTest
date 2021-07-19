//
//  MovieModule.swift
//  Movie
//
//  Created by Luis Chavez pozo on 27/06/21.
//

import UIKit

public struct MovieModuleFactory {

    public static func movieCategoryListFeature(networkService: MovieNetworkingService)-> UIViewController {
        return MovieCategoryListModule.build(networkingService: networkService)
    }
}
