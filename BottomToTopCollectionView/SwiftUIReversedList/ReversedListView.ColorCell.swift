//
//  ReversedListView.ColorCell.swift
//  BottomToTopCollectionView
//
//  Created by hayason00 on 2024/03/19.
//

import SwiftUI

extension ReversedListView {
    struct ColorCell: View {
        let num: Int

        var body: some View {
            ZStack(alignment: .leading) {
                Color(
                    hue: (Double(self.num) / 16).truncatingRemainder(dividingBy: 1),
                    saturation: 0.2,
                    brightness: 0.95
                )
                Text(self.num.description)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ReversedListView.ColorCell(num: 1)
}
