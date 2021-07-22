//
//  MovieDetailView.swift
//  Movie
//
//  Created by Luis Chavez pozo on 19/07/21.
//

import Foundation

protocol MovieDetailView: AnyObject {
    
    func showError(with message: String)
    func didStartLoading()
    func didStopLoading()
}
