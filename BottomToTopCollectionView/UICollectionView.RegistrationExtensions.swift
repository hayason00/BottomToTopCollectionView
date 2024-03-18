//
//  UICollectionView.RegistrationExtensions.swift
//  BottomToTopCollectionView
//
//  Created by hayason00 on 2024/03/18
//
//

import UIKit

extension UICollectionView.CellRegistration where Cell == UICollectionViewCell, Item == Int {
    static func colorCellRegistration() -> Self {
        Self { cell, _, num in
            var config = UIListContentConfiguration.cell()
            config.text = num.description
            cell.contentConfiguration = config
            cell.backgroundColor = UIColor(
                hue: (CGFloat(num) / 16).truncatingRemainder(dividingBy: 1),
                saturation: 0.2,
                brightness: 0.95,
                alpha: 1
            )
        }
    }
}
