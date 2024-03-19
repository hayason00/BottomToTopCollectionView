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
        collectionView.dataSource = self
        collectionView.delegate = self
        containerView.addSubview(collectionView)
        view.addSubview(containerView)
        setupConstraints()
        adjustCollectionViewTopConstraint()
    }

    private func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionViewTopConstraint = collectionView.topAnchor.constraint(equalTo: containerView.topAnchor)
        collectionViewTopConstraint?.isActive = true
        collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true

        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    private func adjustCollectionViewTopConstraint() {
        collectionView.publisher(for: \.contentSize).map(\.height).removeDuplicates().sink { [weak self] contentHeight in
            guard let collectionViewTopConstraint = self?.collectionViewTopConstraint,
                  let containerViewBoundsHeight = self?.containerView.bounds.height
            else { return }
            collectionViewTopConstraint.constant = max(containerViewBoundsHeight - contentHeight, 0)
        }
        .store(in: &cancellables)
    }
}

// MARK: - CollectionViewControllerProtocol

extension AdjustCollectionViewInsetViewController: BottomToTopCollectionProtocol {
    func appendCell() {
        numberOfItems += 1
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension AdjustCollectionViewInsetViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueConfiguredReusableCell(
            using: cellRegistration,
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
