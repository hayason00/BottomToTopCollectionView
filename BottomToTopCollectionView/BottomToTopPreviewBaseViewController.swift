//
//  BottomToTopPreviewBaseViewController.swift
//  BottomToTopCollectionView
//
//  Created by hayason00 on 2024/03/18
//
//

import UIKit

final class BottomToTopPreviewBaseViewController: UIViewController {
    private let bottomToTopViewController: BottomToTopPreviewProtocol

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()

    private let appendCellButton: UIButton = {
        var configuration = UIButton.Configuration.borderless()
        configuration.title = "Append Cell"
        return UIButton(configuration: configuration)
    }()

    init(_ bottomToTopViewController: BottomToTopPreviewProtocol) {
        self.bottomToTopViewController = bottomToTopViewController
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        setupSubviews()
        setupConstraints()
        appendCellButton.addAction(.init { [weak self] _ in
            self?.bottomToTopViewController.appendCell()
        }, for: .primaryActionTriggered)
    }

    private func setupSubviews() {
        addChild(bottomToTopViewController)
        stackView.addArrangedSubview(bottomToTopViewController.view)
        bottomToTopViewController.didMove(toParent: self)

        stackView.addArrangedSubview(appendCellButton)

        view.addSubview(stackView)
    }

    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
