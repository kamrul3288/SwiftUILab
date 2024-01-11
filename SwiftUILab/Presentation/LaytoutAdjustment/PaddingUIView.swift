//
//  PaddingUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 14/8/23.
//

import SwiftUI

struct PaddingUIView: View {
    var body: some View {
        VStack(spacing: 20){
            Text("Text padded by 10 points on each edge.")
                .padding(10)
                .border(.yellow)
            
            Text("Text padded by 20 points on the horizontal edges.")
                .padding(.horizontal, 20)
                .border(.orange)
            
            Text("Text padded by 20 points on the bottom and trailing edges.")
                    .padding([.bottom, .trailing], 20)
                    .border(.blue)
        }
        .navigationBarWithBackButton(title: "Padding")
    }
}

struct PaddingUIView_Previews: PreviewProvider {
    static var previews: some View {
        PaddingUIView()
    }
}
