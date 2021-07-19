//
//  TheMovieNetworkingService.swift
//  Movie
//
//  Created by Luis Chavez pozo on 27/06/21.
//

import Foundation

public protocol TheMovieNetworkingService {
    
    func request<Model: Decodable>(target: TheMovieAPI, completion: @escaping ((Result<Model, Error>)->Void))
}
