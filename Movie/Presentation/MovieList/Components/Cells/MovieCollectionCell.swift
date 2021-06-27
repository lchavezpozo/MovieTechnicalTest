//
//  MovieCollectionCell.swift
//  Movie
//
//  Created by Luis Chavez pozo on 26/06/21.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell, CellType {

    // MARK:- Views
    private var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        return imageView
    }()

    // MARK:- Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK:- Methods
    func configureCell(with posterURL: URL) {
        posterImageView.downloadImage(url: posterURL)
    }
}

// MARK:- Setup UI and Constraints
private extension MovieCollectionCell {
    
    func setupUI() {
        setupStyle()
        setupPosterImageView()
    }

    func setupStyle() {
        contentView.backgroundColor = .systemBackground
    }

    func setupPosterImageView() {
        contentView.addSubview(posterImageView)
        posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}

