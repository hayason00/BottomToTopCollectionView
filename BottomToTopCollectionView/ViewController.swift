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
        let reversedCollectionViewController = BottomToTopViewController(collectionViewController: ReversedCollectionViewController())
        self.navigationController?.pushViewController(reversedCollectionViewController, animated: true)
    }
}
