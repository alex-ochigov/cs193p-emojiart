//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by Alex Ochigov on 8/10/20.
//  Copyright © 2020 Alex Ochigov. All rights reserved.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document: EmojiArtDocument
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(EmojiArtDocument.palette.map { String($0) }, id: \.self) { emoji in
                        Text(emoji)
                            .font(Font.system(size: self.defaultEmojiSize))
                    }
                }
            }.padding(.horizontal)
            Rectangle()
                .foregroundColor(Color.yellow)
                .edgesIgnoringSafeArea([.horizontal, .bottom])
        }
    }
    
    private let defaultEmojiSize: CGFloat = 40.0
}
