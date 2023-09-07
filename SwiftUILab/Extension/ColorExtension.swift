//
//  ColorExtension.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 1/8/23.
//

import Foundation
import SwiftUI

extension Color{
    static let primaryColor = Color("Primary")
    static let transparent = Color(hex: 0xFFFFFFFF)
    static let card = Color("Card")
    static let Black = Color("Black")
}


extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
