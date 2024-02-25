//
//  MaskExampeView2.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 15/1/24.
//

import SwiftUI

struct MaskExampeView2: View {
    @State var maskXOffset = CGFloat(0)
    @State var maskYOffset = CGFloat(0)
    @State var maskFrameHeight = CGFloat(100)
    @State var maskOpacity = 0.0
    
    var body: some View {
        VStack{
            Image(systemName: "person.3.sequence")
                .foregroundColor(.blue)
                .font(.largeTitleRegular)
                .mask(alignment: .top){
                   Rectangle()
                        .opacity(0.1)
                        .frame(height: 30)
                }
            
            Image(.banner_airplane)
                .resizable()
                .frame(width: 300,height: 200)
                .mask(alignment:.center){
                    Image(systemName: "wifi")
                        .resizable()
                }
            
            Image(.banner_airplane)
                .resizable()
                .frame(width: .infinity,height: 200)
                .mask(alignment:.leading){
                    GeometryReader{proxy in
                        Circle()
                            .frame(width: maskFrameHeight, height: maskFrameHeight)
                            .offset(x: maskXOffset, y: maskYOffset)
                            .opacity(maskOpacity)
                            .onAppear {
                                startAnimation(proxy: proxy)
                            }

                    }
                }


        }
    }
    
    private func startAnimation(proxy: GeometryProxy) {
        withAnimation(.default.speed(0.5)) {
            maskOpacity = 1
            maskXOffset += (proxy.size.width - 50)
        }

        withAnimation(.interpolatingSpring(stiffness: 180, damping: 20).delay(0.5)) {
            maskXOffset -= (proxy.size.width/2)
        }
        withAnimation(.default.speed(0.4).delay(1.3)) {
            maskXOffset = -100 // correcting offset while expanding the view
            maskYOffset -= 350  // correcting offset while expanding the view
            maskFrameHeight += 700
        }
       
    }
}

#Preview {
    MaskExampeView2()
}
