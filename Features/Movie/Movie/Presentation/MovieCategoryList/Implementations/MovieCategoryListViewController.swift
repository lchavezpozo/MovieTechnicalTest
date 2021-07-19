//
//  MovieListViewController.swift
//  Movie
//
//  Created by Luis Chavez pozo on 26/06/21.
//

import UIKit

class MovieCategoryListViewController: UIViewController, Lodable, Alertable {

    // MARK:- Properties
    var presenter: MovieCategoryListPresenter?
    var loadableView: LodableViewType = LoadingView()

    // MARK:- Views
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.dataSource = self
        tv.delegate = self
        tv.register(MovieListCell.self, forCellReuseIdentifier: MovieListCell.identifier)
        tv.rowHeight = 150
        tv.separatorStyle = .none
        tv.backgroundColor = .systemBackground
        return tv
    }()

    // MARK:- LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startLoading()
        presenter?.loadView()
    }
}

// MARK:- Presenter outputs
extension MovieCategoryListViewController: MovieCategoryListView {

    func reloadView() {
        stopLoading()
        tableView.reloadData()
    }

    func showEmptyView() {
        stopLoading()
    }

    func showError(with message: String) {
        stopLoading()
        showAlert(title: "Ups 🥲", message: message)
    }
}

// MARK:- UITableViewDataSource
extension MovieCategoryListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numberOfCategories ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfSections ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieListCell.identifier, for: indexPath) as? MovieListCell else {
            return  UITableViewCell()
        }
        let moviesForSection = presenter?.getMoviesInSectionFor(indexPath.section) ?? []
        cell.configureCell(with: moviesForSection)
        cell.onTapMovie = { [weak self] movieIndex in
            self?.presenter?.handleDidTapMovie(categoryIndex: indexPath.section, movieIndex: movieIndex)
        }
        return cell
    }
}

// MARK:- UITableViewDelegate
extension MovieCategoryListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel()
        headerLabel.backgroundColor = .systemBackground
        headerLabel.font = .preferredFont(forTextStyle: .headline)
        headerLabel.text = presenter?.getCategoryNameFor(section)
        return headerLabel
    }
}

// MARK:- Setup UI and Constraints
private extension MovieCategoryListViewController {

    func setupUI() {
        setupStyle()
        setupTableView()
    }

    func setupStyle() {
        title = "Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
