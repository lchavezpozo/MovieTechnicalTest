//
//  LoadingView.swift
//  Movie
//
//  Created by Luis Chavez pozo on 4/07/21.
//

import UIKit

final class LoadingView: UIView, LodableViewType {

    private let activityIndicatorView: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .large)
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func startAnimation() {
        activityIndicatorView.startAnimating()
    }

    func stopAnimation() {
        activityIndicatorView.stopAnimating()
        removeFromSuperview()
    }
}

private extension LoadingView {
    
    func setupUI() {
        setupActivityIndicatorView()
    }

    func setupActivityIndicatorView() {
        addSubview(activityIndicatorView)
        activityIndicatorView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        activityIndicatorView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        activityIndicatorView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        activityIndicatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
