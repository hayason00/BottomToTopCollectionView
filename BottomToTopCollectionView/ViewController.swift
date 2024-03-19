//
//  ViewController.swift
//
//
//  Created by hayason00 on 2024/03/18
//
//

import UIKit

final class ViewController: UIViewController {
    @IBAction private func reversedCollectionViewButtonDidTap(_ sender: UIButton) {
        let vc = BottomToTopViewController(collectionViewController: ReversedCollectionViewController())
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction private func customCollectionViewLayoutButtonDidTap(_ sender: UIButton) {
        let vc = BottomToTopViewController(collectionViewController: CustomCollectionViewLayoutViewController())
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction private func adjustCollectionViewInsetButtonDidTap(_ sender: UIButton) {
        let vc = BottomToTopViewController(collectionViewController: AdjustCollectionViewInsetViewController())
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func swiftUIReversedListButtonDidTap(_ sender: UIButton) {
        let vc = BottomToTopViewController(collectionViewController: SwiftUIReversedListViewController())
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
