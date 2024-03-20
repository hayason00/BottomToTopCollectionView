//
//  RootViewController.swift
//
//
//  Created by hayason00 on 2024/03/18
//
//

import UIKit

final class RootViewController: UIViewController {
    @IBAction private func reversedCollectionViewButtonDidTap(_ sender: UIButton) {
        let vc = BottomToTopPreviewBaseViewController(ReversedCollectionViewController())
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction private func customCollectionViewLayoutButtonDidTap(_ sender: UIButton) {
        let vc = BottomToTopPreviewBaseViewController(CustomCollectionViewLayoutViewController())
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction private func adjustCollectionViewInsetButtonDidTap(_ sender: UIButton) {
        let vc = BottomToTopPreviewBaseViewController(AdjustCollectionViewInsetViewController())
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func swiftUIReversedListButtonDidTap(_ sender: UIButton) {
        let vc = BottomToTopPreviewBaseViewController(SwiftUIReversedListViewController())
        navigationController?.pushViewController(vc, animated: true)
    }
}
