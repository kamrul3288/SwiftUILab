//
//  FontAwesomeIcon.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 7/9/23.
//

import SwiftUI

struct FontAwesomeIcon: View {
    let icon: FAIconData
    let size: CGFloat
    let color: Color
    
    init(icon: FAIconData, size: CGFloat = 40, color: Color = .Black) {
        self.icon = icon
        self.size = size
        self.color = color
    }

    var body: some View {
        Text(icon.rawValue)
            .font(.custom("FontAwesome6Free-Solid", size: size))
            .foregroundColor(color)
    }
}
