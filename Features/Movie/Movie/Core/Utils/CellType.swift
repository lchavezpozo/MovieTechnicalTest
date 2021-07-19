//
//  CellType.swift
//  Movie
//
//  Created by Luis Chavez pozo on 26/06/21.
//

import Foundation

protocol CellType: AnyObject {
    static var identifier: String { get }
}

extension CellType {
    static var identifier: String {
        return String(describing: self)
    }
}
