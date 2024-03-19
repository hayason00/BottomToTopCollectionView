//
//  SwiftUIReversedListViewController.swift
//  BottomToTopCollectionView
//
//  Created by hayason00 on 2024/03/19.
//

import SwiftUI
import UIKit

final class SwiftUIReversedListViewController: UIViewController {
    private let hostingController = UIHostingController(rootView: ReversedListView(numberOfItems: 0))

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addChild(self.hostingController)
        self.view.addSubview(self.hostingController.view)
        self.hostingController.didMove(toParent: self)
        self.setupConstraints()
    }

    private func setupConstraints() {
        self.hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        self.hostingController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.hostingController.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.hostingController.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.hostingController.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

// MARK: - CollectionViewControllerProtocol

extension SwiftUIReversedListViewController: BottomToTopCollectionProtocol {
    func appendCell() {
        self.hostingController.rootView.numberOfItems += 1
    }
}
