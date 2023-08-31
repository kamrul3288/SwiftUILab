//
//  CardUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 31/8/23.
//

import SwiftUI

struct CardUIView: View {
    var body: some View {
        
        VStack(spacing: 20){
            CardView {
                Text("Card With Default Elevation")
            }
            .frame(height: 70)
            
            
            CardView(elevation: 0) {
                Text("Card With NO Elevation")
            }
            .frame(height: 70)
            
            
            CardView(cornerRadius: 10,elevation: 10) {
                Text("Card With Outline Border")
            }
            .frame(height: 70)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.red)
            )
            
    
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
        .navigationBarWithBackButton(title: "Card")
    }
}


struct CardView<Content: View>:View{
    var cornerRadius:Double;
    var backgroundColor:Color;
    var elevation:Double
    var content: () -> Content

    init(cornerRadius:Double = 5.0, backgroundColor:Color = .white, elevation:Double = 5.0, @ViewBuilder content: @escaping () -> Content){
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.elevation = elevation
        self.content = content
    }
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(backgroundColor)
                .shadow(radius: elevation)
            
            content()
        }
    }
}

struct CardUIView_Previews: PreviewProvider {
    static var previews: some View {
        CardUIView()
    }
}
