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

        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        setupConstraints()
    }

    private func setupConstraints() {
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        hostingController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

// MARK: - CollectionViewControllerProtocol

extension SwiftUIReversedListViewController: BottomToTopPreviewProtocol {
    func appendCell() {
        hostingController.rootView.numberOfItems += 1
    }
}
