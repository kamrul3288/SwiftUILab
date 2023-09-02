//
//  ButtonClickStyle.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 2/9/23.
//

import SwiftUI

struct ButtonClickOpacityStyle : ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

struct ButtonClickBrightnessStyle : ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .brightness(configuration.isPressed ? 0.05 : 0)
    }
}

struct ButtonClickScaleEffectStyle : ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
