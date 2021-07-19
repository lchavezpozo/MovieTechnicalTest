//
//  MovieCategoryVewCell.swift
//  Movie
//
//  Created by Luis Chavez pozo on 26/06/21.
//

import UIKit

class MovieListCell: UITableViewCell, CellType {

    // MARK:- Properties
    var onTapMovie: ((Int)->Void)?
    
    private var movies: [URL] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    // MARK:- Views
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.register(MovieCollectionCell.self, forCellWithReuseIdentifier: MovieCollectionCell.identifier)
        cv.backgroundColor = .systemBackground
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()

    // MARK:- Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    // MARK:- Methods
    func configureCell(with movies: [URL]) {
        self.movies = movies
    }
}

// MARK:- UICollectionViewDataSource
extension MovieListCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionCell.identifier, for: indexPath) as? MovieCollectionCell else { return UICollectionViewCell() }
        cell.configureCell(with: movies[indexPath.row])
        return cell
    }
}

// MARK:- UICollectionViewDelegate
extension MovieListCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onTapMovie?(indexPath.row)
    }
}

// MARK:- UICollectionViewDelegateFlowLayout
extension MovieListCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 4
        let hardCodedPadding: CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
}

// MARK:- Setup UI and Constraints
private extension MovieListCell {
    
    func setupUI() {
        setupStyle()
        setupCollectionView()
    }
    
    func setupStyle() {
        contentView.backgroundColor = .systemBackground
    }
    
    func setupCollectionView() {
        contentView.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
