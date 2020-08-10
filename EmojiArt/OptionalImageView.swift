//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by Alex Ochigov on 8/10/20.
//  Copyright © 2020 Alex Ochigov. All rights reserved.
//

import SwiftUI

struct OptionalImageView: View {
    var uiImage: UIImage?
    
    var body: some View {
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}
