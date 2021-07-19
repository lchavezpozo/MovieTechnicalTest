//
//  Lodable.swift
//  Movie
//
//  Created by Luis Chavez pozo on 4/07/21.
//

import UIKit

protocol Lodable {
    var loadableView: LodableViewType { get }
    func startLoading()
    func stopLoading()
}

protocol LodableViewType: UIView {
    func startAnimation()
    func stopAnimation()
}

extension Lodable where Self: UIViewController {

    func startLoading() {
        setupLoadableView()
        loadableView.startAnimation()
    }

    func stopLoading() {
        loadableView.stopAnimation()
    }

    private func setupLoadableView() {
        view.addSubview(loadableView)
        loadableView.translatesAutoresizingMaskIntoConstraints = false
        loadableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadableView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        loadableView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
}

