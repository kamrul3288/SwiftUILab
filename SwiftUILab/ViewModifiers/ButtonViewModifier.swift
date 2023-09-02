//
//  ButtonViewModifier.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 2/9/23.
//

import SwiftUI

struct FillColorButtonViewModifier : ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding(12)
            .background(Color.primaryColor)
            .cornerRadius(5)
    }
}

struct OutlineButtonViewModifier : ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(12)
            .overlay(
                RoundedRectangle(cornerRadius: 5).stroke(Color.primaryColor,lineWidth: 1)
            )
    }
}

