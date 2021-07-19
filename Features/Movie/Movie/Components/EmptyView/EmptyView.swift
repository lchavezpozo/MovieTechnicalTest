//
//  EmptyView.swift
//  Movie
//
//  Created by Luis Chavez pozo on 5/07/21.
//

import UIKit

class EmptyView: UIView {

    var title: String {
        didSet {
            titleLabel.text = title
        }
    }

    var subtitle: String {
        didSet {
            subtitleLabel.text = subtitle
        }
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.textAlignment = .center
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = subtitle
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension EmptyView {
    
    func setupUI() {
        setupTitleLabel()
    }
    
    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16).isActive = true
    }
}
