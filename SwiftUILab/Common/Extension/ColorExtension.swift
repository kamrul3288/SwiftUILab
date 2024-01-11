//
//  ColorExtension.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 1/8/23.
//

import Foundation
import SwiftUI

extension Color{
    static let Primary = Color("Primary")
    static let Secondary = Color("Secondary")
    static let Error = Color("Error")
    static let Success = Color("Success")
    static let Warning = Color("Warning")
    static let transparent = Color(hex: 0xFFFFFFFF)
    
    static let Black = Color("Black")
    static let Black10 = Color("Black10")
    static let Black20 = Color("Black20")
    static let Black30 = Color("Black30")
    static let Black40 = Color("Black40")
    static let Black50 = Color("Black50")
    static let Black60 = Color("Black60")
    static let Black70 = Color("Black70")
    static let Black80 = Color("Black80")
    static let Black90 = Color("Black90")
    static let Black95 = Color("Black95")
    static let Black99 = Color("Black99")
    
    static let White = Color("White")
    static let White10 = Color("White10")
    static let White20 = Color("White20")
    static let White30 = Color("White30")
    static let White40 = Color("White40")
    static let White50 = Color("White50")
    static let White60 = Color("White60")
    static let White70 = Color("White70")
    static let White80 = Color("White80")
    static let White90 = Color("White90")
    static let White95 = Color("White95")
    static let White99 = Color("White99")
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
