//
//  ReversedCollectionViewController.swift
//  BottomToTopCollectionView
//
//  Created by hayason00 on 2024/03/18
//
//

import UIKit

final class ReversedCollectionViewController: UIViewController {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private let cellRegistration = UICollectionView.CellRegistration.colorCellRegistration()

    private var numberOfItems = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.collectionView)
        self.setupConstraints()
        self.collectionView.transform = CGAffineTransform(scaleX: 1, y: -1)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    private func setupConstraints() {
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

// MARK: - CollectionViewControllerProtocol

extension ReversedCollectionViewController: BottomToTopCollectionProtocol {
    func appendCell() {
        self.numberOfItems += 1
        self.collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension ReversedCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueConfiguredReusableCell(
            using: self.cellRegistration,
            for: indexPath,
            item: self.collectionView(collectionView, numberOfItemsInSection: indexPath.section) - indexPath.item
        )
        cell.transform = CGAffineTransform(scaleX: 1, y: -1)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ReversedCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 40)
    }
}
