//
//  Grid.swift
//  Memorize
//
//  Created by Alex Ochigov on 8/9/20.
//  Copyright © 2020 Alex Ochigov. All rights reserved.
//

import SwiftUI

struct Grid<T, K, V>: View where K: View, V: Hashable {
    private var items: [T]
    private var id: KeyPath<T, V>
    private var viewForItem: (T) -> K
    
    init(_ items: [T], id: KeyPath<T, V>, viewForItem: @escaping (T) -> K) {
        self.items = items
        self.id = id
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    private func body(for layout: GridLayout) -> some View {
        ForEach(items, id: id) { item in
            self.body(for: item, in: layout)
        }
    }
    
    private func body(for item: T, in layout: GridLayout) -> some View {
        let index = items.firstIndex(where: { item[keyPath: id] == $0[keyPath: id]})
        return Group {
            if index != nil {
                viewForItem(item)
                    .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: index!))
            }
        }
    }
}

extension Grid where T: Identifiable, V == T.ID {
    init(_ items: [T], viewForItem: @escaping (T) -> K) {
        self.init(items, id: \T.id, viewForItem: viewForItem)
    }
}

