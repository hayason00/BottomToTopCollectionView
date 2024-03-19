//
//  AdjustCollectionViewInsetViewController.swift
//  BottomToTopCollectionView
//
//  Created by hayason00 on 2024/03/19.
//

import Combine
import UIKit

final class AdjustCollectionViewInsetViewController: UIViewController {
    private let containerView = UIView()
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    private let cellRegistration = UICollectionView.CellRegistration.colorCellRegistration()

    private var numberOfItems = 0

    private var collectionViewTopConstraint: NSLayoutConstraint?
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.containerView.addSubview(self.collectionView)
        self.view.addSubview(self.containerView)
        self.setupConstraints()
        self.adjustCollectionViewTopConstraint()
    }

    private func setupConstraints() {
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionViewTopConstraint = self.collectionView.topAnchor.constraint(equalTo: self.containerView.topAnchor)
        self.collectionViewTopConstraint?.isActive = true
        self.collectionView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor).isActive = true

        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.containerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.containerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.containerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    private func adjustCollectionViewTopConstraint() {
        let cancellable = self.collectionView.publisher(for: \.contentSize).map(\.height).removeDuplicates().sink { [weak self] contentHeight in
            guard let self else { return }
            self.collectionViewTopConstraint?.constant = max(self.containerView.bounds.height - contentHeight, 0)
        }
        self.cancellables.insert(cancellable)
    }
}

// MARK: - CollectionViewControllerProtocol

extension AdjustCollectionViewInsetViewController: BottomToTopCollectionProtocol {
    func appendCell() {
        self.numberOfItems += 1
        self.collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension AdjustCollectionViewInsetViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueConfiguredReusableCell(
            using: self.cellRegistration,
            for: indexPath,
            item: indexPath.item
        )
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AdjustCollectionViewInsetViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 40)
    }
}
