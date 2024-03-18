//
//  BottomToTopViewController.swift
//  BottomToTopCollectionView
//
//  Created by hayason00 on 2024/03/18
//
//

import UIKit

final class BottomToTopViewController: UIViewController {
    private let collectionViewController: BottomToTopCollectionProtocol
    
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
    
    init(collectionViewController: BottomToTopCollectionProtocol) {
        self.collectionViewController = collectionViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground

        self.setupSubviews()
        self.setupConstraints()
        self.appendCellButton.addAction(.init { [weak self] _ in
            self?.collectionViewController.appendCell()
        }, for: .primaryActionTriggered)
    }
    
    private func setupSubviews() {
        self.addChild(self.collectionViewController)
        self.stackView.addArrangedSubview(self.collectionViewController.view)
        self.collectionViewController.didMove(toParent: self)
        
        self.stackView.addArrangedSubview(self.appendCellButton)
        
        self.view.addSubview(self.stackView)
    }
    
    private func setupConstraints() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
