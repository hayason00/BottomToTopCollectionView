//
//  ReversedListView.swift
//  BottomToTopCollectionView
//
//  Created by hayason00 on 2024/03/19.
//

import SwiftUI

struct ReversedListView: View {
    var numberOfItems: Int

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach((0 ..< self.numberOfItems).reversed(), id: \.self) { index in
                    ColorCell(num: index)
                        .frame(height: 40)
                        .rotationEffect(.degrees(180))
                }
            }
        }
        .rotationEffect(.degrees(180))
    }
}

#Preview {
    ReversedListView(numberOfItems: 5)
}
