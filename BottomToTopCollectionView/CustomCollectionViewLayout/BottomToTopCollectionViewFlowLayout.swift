//
//  BottomToTopCollectionViewFlowLayout.swift
//  BottomToTopCollectionView
//
//  Created by hayason00 on 2024/03/19.
//

import UIKit

final class BottomToTopCollectionViewFlowLayout: UICollectionViewFlowLayout {
    private static let itemHeight: CGFloat = 40

    private var contentHeight: CGFloat {
        CGFloat(collectionView?.numberOfItems(inSection: 0) ?? 0) * (Self.itemHeight + minimumLineSpacing) - minimumLineSpacing
    }

    private var contentWidth: CGFloat {
        collectionView?.bounds.width ?? 0
    }

    override var collectionViewContentSize: CGSize {
        CGSize(width: contentWidth, height: contentHeight)
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView else { return nil }
        return (0 ..< collectionView.numberOfItems(inSection: 0))
            .compactMap { self.layoutAttributesForItem(at: IndexPath(item: $0, section: 0)) }
            .filter { $0.frame.intersects(rect) }
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let collectionView else { return super.layoutAttributesForItem(at: indexPath) }
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        let numberOfItem = collectionView.numberOfItems(inSection: indexPath.section)
        attributes.frame = CGRect(
            x: 0,
            y: max(contentHeight, collectionView.bounds.height) - CGFloat(numberOfItem - indexPath.item) * (Self.itemHeight + minimumLineSpacing) - minimumLineSpacing,
            width: contentWidth,
            height: Self.itemHeight
        )
        return attributes
    }
}
