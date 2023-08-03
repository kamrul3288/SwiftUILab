//
//  CardView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 1/8/23.
//

import Foundation
import SwiftUI

struct CardView<Content> : View where Content : View{
    var alignment:Alignment
    var cardColor:Color
    var cardCornerRadius:CGFloat
    var cardElevation:CGFloat
    var content:Content

    
    init(
        alignment: Alignment = .center,
        @ViewBuilder content: () -> Content,
        cardColor:Color = .white,
        cardCornerRadius:CGFloat = 5,
        cardElevation:CGFloat
    ) {
        self.alignment = alignment
        self.cardColor = cardColor
        self.cardCornerRadius = cardCornerRadius
        self.cardElevation = cardElevation
        self.content = content()
    }
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: cardCornerRadius, style: .continuous)
                           .fill(.white)
            content
        }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: alignment)
        .shadow(radius: cardElevation)

    }
}



struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: {
            Text("Hello")
        }, cardElevation: 10)
    }
}

