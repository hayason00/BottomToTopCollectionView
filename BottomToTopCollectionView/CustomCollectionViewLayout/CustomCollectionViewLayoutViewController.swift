//
//  CustomCollectionViewLayoutViewController.swift
//  BottomToTopCollectionView
//
//  Created by hayason00 on 2024/03/19.
//

import UIKit

final class CustomCollectionViewLayoutViewController: UIViewController {
    private let collectionView: UICollectionView = {
        let layout = BottomToTopCollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    private let cellRegistration = UICollectionView.CellRegistration.colorCellRegistration()

    private var numberOfItems = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        setupConstraints()
        collectionView.dataSource = self
    }

    private func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

// MARK: - CollectionViewControllerProtocol

extension CustomCollectionViewLayoutViewController: BottomToTopCollectionProtocol {
    func appendCell() {
        numberOfItems += 1
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension CustomCollectionViewLayoutViewController: UICollectionViewDataSource {
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
