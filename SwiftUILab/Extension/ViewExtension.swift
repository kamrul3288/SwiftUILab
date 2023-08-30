//
//  ViewExtension.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 30/8/23.
//

import SwiftUI

extension View{
    func placeholder<Content: View>(when shouldShow: Bool, alignment: Alignment = .leading, @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
        }
    }
}
