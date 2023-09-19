//
//  MaskUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 19/9/23.
//

import SwiftUI

//Mask modifier in SwiftUI gives us ability to mask one view with another
struct MaskUIView: View {
    @State var rating:Int = 1
    
    var body: some View {
        ZStack{
            ratingView
                .overlay(overlayRatingView.mask(ratingView))
        }
        .navigationBarWithBackButton(title: "Mask")
    }
    
    private var overlayRatingView: some View{
        GeometryReader{proxy in
            ZStack(alignment: .leading) {
                Rectangle()
                     .foregroundColor(.yellow)
                     .frame(width: CGFloat(rating) / 5 * proxy.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var ratingView: some View{
        HStack{
            ForEach(1..<6){ index in
                Image(systemName: "star.fill")
                    .font(.titleRegular)
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        withAnimation {
                            rating = index
                        }
                    }
            }
        }
    }
}

struct MaskUIView_Previews: PreviewProvider {
    static var previews: some View {
        MaskUIView()
    }
}
