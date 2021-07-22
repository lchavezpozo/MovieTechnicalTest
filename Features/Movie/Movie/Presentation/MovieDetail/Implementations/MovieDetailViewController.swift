//
//  DefaultMovieDetailView.swift
//  Movie
//
//  Created by Luis Chavez pozo on 22/07/21.
//

import UIKit

class MovieDetailViewController: UIViewController, Lodable, Alertable {
    
    // MARK:- Properties
    var presenter: MovieDetailPresenter?
    var loadableView: LodableViewType = LoadingView()

    // MARK:- Views
    private lazy var topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if let imageUrl = presenter?.viewModel.posterURL {
            imageView.downloadImage(url: imageUrl)
        }
        return imageView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "xmark")
        image?.withTintColor(.red)
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(handleDidTapCloseButton), for: .touchUpInside)
        return button
    }()

    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let scrollContentView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        return sv
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = presenter?.viewModel.title
        label.font = .preferredFont(forTextStyle: .title2)
        return label
    }()

    private lazy var voteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let vote = presenter?.viewModel.voteAverage ?? 0
        label.text = "\(vote)% vote"
        label.textColor = .systemGreen
        label.font = .preferredFont(forTextStyle: .callout)
        return label
    }()

    private let sumaryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sumary"
        label.font = .preferredFont(forTextStyle: .title2)
        return label
    }()

    private lazy var sumaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = presenter?.viewModel.sumary
        label.font = .preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK:- LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK:- Methods
    @objc
    private func handleDidTapCloseButton() {
        presenter?.didTapDismiss()
    }
}

// MARK:- Presenter outputs
extension MovieDetailViewController: MovieDetailView {

    func showError(with message: String) {
        showAlert(title: "Ups 🥲", message: message)
    }

    func didStartLoading() {
        startLoading()
    }

    func didStopLoading() {
        stopLoading()
    }
}

// MARK:- Setup UI and Constrain
private extension MovieDetailViewController {

    func setupUI() {
        setupStyle()
        setupTopImageView()
        setupCloseButton()
        setupScrollView()
        setupScrollContentView()
        setupTitleLabel()
        setupVoteLabel()
        setupSumaryTitleLabel()
        setupSumaryLabel()
    }

    func setupStyle() {
        view.backgroundColor = .systemBackground
    }

    func setupTopImageView() {
        view.addSubview(topImageView)
        topImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }

    func setupCloseButton() {
        view.addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
    }

    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: topImageView.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }

    func setupScrollContentView() {
        scrollView.addSubview(scrollContentView)
        scrollContentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollContentView.bottomAnchor.constraint(lessThanOrEqualTo: scrollView.bottomAnchor).isActive = true
        scrollContentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }

    func setupTitleLabel() {
        scrollContentView.addArrangedSubview(titleLabel)
    }

    func setupVoteLabel() {
        scrollContentView.addArrangedSubview(voteLabel)
        scrollContentView.setCustomSpacing(10, after: voteLabel)
    }

    func setupSumaryTitleLabel() {
        scrollContentView.addArrangedSubview(sumaryTitleLabel)
    }

    func setupSumaryLabel() {
        scrollContentView.addArrangedSubview(sumaryLabel)
    }
}
