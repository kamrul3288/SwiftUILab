//
//  NavBackButton.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 3/8/23.
//

import Foundation
import SwiftUI

struct NavBackButton : View{
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
           Button(action: {
               self.mode.wrappedValue.dismiss()
           }) {
               HStack {
                   Image(systemName: "chevron.backward")
                       .foregroundColor(Color.Black)
               }
           }
        
       }
}

struct NavBackButtonWithCustomAction : View{
    var action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
           Button(action: action) {
               HStack {
                   Image(systemName: "chevron.backward")
               }
           }
       }
}

struct NavBackButtonWithLabel : View{
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var label: String

    var body: some View {
           Button(action: {
               self.mode.wrappedValue.dismiss()
           }) {
               HStack {
                   Image(systemName: "chevron.backward")
                       .foregroundColor(Color.Black)
                   Text(label)
               }
           }
    }
}
