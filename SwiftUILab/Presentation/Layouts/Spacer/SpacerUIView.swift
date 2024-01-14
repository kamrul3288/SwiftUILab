//
//  SpacerUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 10/8/23.
//

import SwiftUI

struct SpacerUIView: View {
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "checkmark")
                Text("Kamrul Hasan")
            }
            .padding(.bottom,24)
            
            HStack {
                Image(systemName: "checkmark")
                Spacer()
                Text("Kamrul Hasan")
            }
            
        }
        .padding(16)
        
        .navigationBarWithBackButton(title: "Spacer")
    }
}

#Preview {
    PreviewNavigationbar{
        SpacerUIView()
    }
}

