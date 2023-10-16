//
//  ActionSheetUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 16/10/23.
//

import SwiftUI

struct ActionSheetUIView: View {
    @State private var showActionSheet:Bool = false
    
    
    var body: some View {
        Button {
            showActionSheet.toggle()
        } label: {
            Text("Rate Us")
                .modifier(FillColorButtonViewModifier())
        }
        .buttonStyle(ButtonClickScaleEffectStyle())
        .padding()
        .actionSheet(isPresented: $showActionSheet, content: {
            ActionSheet(
                title: Text("Rate Our Service"),
                message: Text("Please describe your taughts to improve us. We would like to hear from you"),
                buttons: [.default(Text("Good")), .default(Text("Average")), .destructive(Text("Bad")), .cancel()]
            )
        })
        
        .navigationBarWithBackButton(title: "Action Sheet")
    }
}

#Preview {
    PreviewNavigationbar{
        ActionSheetUIView()
    }
}
