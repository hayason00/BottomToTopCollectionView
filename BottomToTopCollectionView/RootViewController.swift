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
        let vc = PreviewBaseViewController(ReversedCollectionViewController())
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction private func adjustCollectionViewInsetButtonDidTap(_ sender: UIButton) {
        let vc = PreviewBaseViewController(AdjustCollectionViewInsetViewController())
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction private func customCollectionViewLayoutButtonDidTap(_ sender: UIButton) {
        let vc = PreviewBaseViewController(CustomCollectionViewLayoutViewController())
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func swiftUIReversedListButtonDidTap(_ sender: UIButton) {
        let vc = PreviewBaseViewController(ReversedSwiftUIListViewController())
        navigationController?.pushViewController(vc, animated: true)
    }
}
